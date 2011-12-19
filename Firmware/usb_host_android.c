/******************************************************************************

    USB Host Client Driver for Android(tm) Devices

The Android Operating System update v2.3.4 includes a module for accessing
the USB port of the device with an application.  This is done through an
USB accessory framework in the OS.  This client driver provides support to 
talk to that interface


*******************************************************************************/
//DOM-IGNORE-BEGIN
/******************************************************************************

 File Name:       usb_host_android.c
 Dependencies:    None
 Processor:       PIC24F/PIC32MX
 Compiler:        C30/C32
 Company:         Microchip Technology, Inc.

Software License Agreement

The software supplied herewith by Microchip Technology Incorporated
(the “Company”) for its PICmicro® Microcontroller is intended and
supplied to you, the Company’s customer, for use solely and
exclusively on Microchip PICmicro Microcontroller products. The
software is owned by the Company and/or its supplier, and is
protected under applicable copyright laws. All rights are reserved.
Any use in violation of the foregoing restrictions may subject the
user to criminal sanctions under applicable laws, as well as to
civil liability for the breach of the terms and conditions of this
license.

THIS SOFTWARE IS PROVIDED IN AN “AS IS” CONDITION. NO WARRANTIES,
WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT NOT LIMITED
TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. THE COMPANY SHALL NOT,
IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL OR
CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.

Change History:
  Rev         Description
  ----------  ----------------------------------------------------------
  2.9         Initial release

*******************************************************************************/

#include "USB/usb.h"
#include "USB/usb_host_android.h"
#include "usb_host_android_protocol_v1_local.h"

//************************************************************
// Internal type definitions
//************************************************************

typedef enum
{
    //NO_DEVICE must = 0 so that the memset in the init function resets
    //  all of the device instances to NO_DEVICE
    NO_DEVICE = 0,
    DEVICE_ATTACHED,
    GET_PROTOCOL_SENT,
    PROTOCOL_RECEIVED,
    READY,
    NOT_SUPPORTED    
} ANDROID_DEVICE_STATE;

typedef struct
{
    BYTE address;
    BYTE clientDriverID;
    DWORD flags;
    WORD protocol;
    void* protocolHandle;
    WORD countDown;
    ANDROID_DEVICE_STATE state;
} ANDROID_DEVICE_DATA;

typedef BYTE (*ANDROID_APP_WRITE) (void* handle, BYTE* data, DWORD size);
typedef BOOL (*ANDROID_APP_IS_WRITE_COMPLETE) (void* handle, BYTE* errorCode, DWORD* size);
typedef BYTE (*ANDROID_APP_READ) (void* handle, BYTE* data, DWORD size);
typedef BOOL (*ANDROID_APP_IS_READ_COMPLETE) (void* handle, BYTE* errorCode, DWORD* size);
typedef void* (*ANDROID_APP_INITIALIZE) ( BYTE address, DWORD flags, BYTE clientDriverID );
typedef void (*ANDROID_APP_TASKS) (void);

typedef struct _ANDROID_PROTOCOL_VERSION
{
    BYTE versionNumber;

    ANDROID_APP_WRITE write;
    ANDROID_APP_IS_WRITE_COMPLETE isWriteComplete;

    ANDROID_APP_READ read;
    ANDROID_APP_IS_READ_COMPLETE isReadComplete;

    ANDROID_APP_INITIALIZE init;
    ANDROID_APP_TASKS tasks;

    USB_CLIENT_EVENT_HANDLER handler;
    USB_CLIENT_EVENT_HANDLER dataHandler;
} ANDROID_PROTOCOL_VERSION;

//** Command transfer code **
#define ANDROID_ACCESSORY_GET_PROTOCOL 51

//************************************************************
// Internal prototypes
//************************************************************
BYTE AndroidCommandGetProtocol(ANDROID_DEVICE_DATA* device, WORD *protocol);

//************************************************************
// Global variables
//************************************************************
//accessoryInfo is for use by the Android drivers only and not for users.
ANDROID_ACCESSORY_INFORMATION *accessoryInfo;

//************************************************************
// Internal variables
//************************************************************
static ANDROID_DEVICE_DATA devices[NUM_ANDROID_DEVICES_SUPPORTED];
static ANDROID_PROTOCOL_VERSION protocolVersions[] = 
{
    {
        1,
        AndroidAppWrite_Pv1,
        AndroidAppIsWriteComplete_Pv1,
        AndroidAppRead_Pv1,
        AndroidAppIsReadComplete_Pv1,
        AndroidInitialize_Pv1,
        AndroidTasks_Pv1,
        AndroidAppEventHandler_Pv1,
        AndroidAppDataEventHandler_Pv1
    }
};


//DOM-IGNORE-END
//***************************************************************************
//  API Interface to user
//***************************************************************************


/****************************************************************************
  Function:
    void AndroidAppStart(ANDROID_ACCESSORY_INFORMATION *info)

  Summary:
    Sets the accessory information and initializes the client driver information
    after the initial power cycles.

  Description:
    Sets the accessory information and initializes the client driver information
    after the initial power cycles.  Since this resets all device information
    this function should be used only after a compete system reset.  This should 
    not be called while the USB is active or while connected to a device.

  Precondition:
    USB module should not be in operation

  Parameters:
    ANDROID_ACCESSORY_INFORMATION *info  - the information about the Android accessory

  Return Values:
    None

  Remarks:
    None
  ***************************************************************************/
void AndroidAppStart(ANDROID_ACCESSORY_INFORMATION *info)
{
    accessoryInfo = info;
    memset(&devices,0x00,sizeof(devices));
    AndroidAppStart_Pv1();
}


/****************************************************************************
  Function:
    BYTE AndroidAppWrite(void* handle, BYTE* data, DWORD size)

  Summary:
    Sends data to the Android device specified by the passed in handle.

  Description:
    Sends data to the Android device specified by the passed in handle.

  Precondition:
    Transfer is not already in progress.  USB module is initialized and Android
    device has attached.

  Parameters:
    void* handle - the handle passed to the device in the EVENT_ANDROID_ATTACH event
    BYTE* data - the data to send to the Android device
    DWORD size - the size of the data that needs to be sent

  Return Values:
    USB_SUCCESS                     - Write started successfully.
    USB_UNKNOWN_DEVICE              - Device with the specified address not found.
    USB_INVALID_STATE               - We are not in a normal running state.
    USB_ENDPOINT_ILLEGAL_TYPE       - Must use USBHostControlWrite to write
                                        to a control endpoint.
    USB_ENDPOINT_ILLEGAL_DIRECTION  - Must write to an OUT endpoint.
    USB_ENDPOINT_STALLED            - Endpoint is stalled.  Must be cleared
                                        by the application.
    USB_ENDPOINT_ERROR              - Endpoint has too many errors.  Must be
                                        cleared by the application.
    USB_ENDPOINT_BUSY               - A Write is already in progress.
    USB_ENDPOINT_NOT_FOUND          - Invalid endpoint.

  Remarks:
    None
  ***************************************************************************/
BYTE AndroidAppWrite(void* handle, BYTE* data, DWORD size)
{
    BYTE i;

    for(i=0;i<NUM_ANDROID_DEVICES_SUPPORTED;i++)
    {
        if(handle == devices[i].protocolHandle) {
            return protocolVersions[devices[i].protocol - 1].write(handle,data,size);
        }
    }

    return USB_UNKNOWN_DEVICE;
}

/****************************************************************************
  Function:
    BOOL AndroidAppIsWriteComplete(void* handle, BYTE* errorCode, DWORD* size)

  Summary:
    Check to see if the last write to the Android device was completed

  Description:
    Check to see if the last write to the Android device was completed.  If 
    complete, returns the amount of data that was sent and the corresponding 
    error code for the transmission.

  Precondition:
    Transfer has previously been sent to Android device.

  Parameters:
    void* handle - the handle passed to the device in the EVENT_ANDROID_ATTACH event
    BYTE* errorCode - a pointer to the location where the resulting error code should be written
    DWORD* size - a pointer to the location where the resulting size information should be written

  Return Values:
    TRUE    - Transfer is complete.
    FALSE   - Transfer is not complete.

  Remarks:
    Possible values for errorCode are:
        * USB_SUCCESS                     - Transfer successful
        * USB_UNKNOWN_DEVICE              - Device not attached
        * USB_ENDPOINT_STALLED            - Endpoint STALL'd
        * USB_ENDPOINT_ERROR_ILLEGAL_PID  - Illegal PID returned
        * USB_ENDPOINT_ERROR_BIT_STUFF
        * USB_ENDPOINT_ERROR_DMA
        * USB_ENDPOINT_ERROR_TIMEOUT
        * USB_ENDPOINT_ERROR_DATA_FIELD
        * USB_ENDPOINT_ERROR_CRC16
        * USB_ENDPOINT_ERROR_END_OF_FRAME
        * USB_ENDPOINT_ERROR_PID_CHECK
        * USB_ENDPOINT_ERROR              - Other error
  ***************************************************************************/
BOOL AndroidAppIsWriteComplete(void* handle, BYTE* errorCode, DWORD* size)
{
    BYTE i;

    for(i=0;i<NUM_ANDROID_DEVICES_SUPPORTED;i++)
    {
        if(handle == devices[i].protocolHandle) {
            return protocolVersions[devices[i].protocol - 1].isWriteComplete(handle,errorCode,size);
        }
    }

    *errorCode = USB_UNKNOWN_DEVICE;
    *size = 0;
    return TRUE;
}

/****************************************************************************
  Function:
    BYTE AndroidAppRead(void* handle, BYTE* data, DWORD size)

  Summary:
    Attempts to read information from the specified Android device

  Description:
    Attempts to read information from the specified Android device.  This
    function does not block.  Data availability is checked via the 
    AndroidAppIsReadComplete() function.

  Precondition:
    A read request is not already in progress and an Android device is attached.

  Parameters:
    void* handle - the handle passed to the device in the EVENT_ANDROID_ATTACH event
    BYTE* data - a pointer to the location of where the data should be stored.  This location
                should be accessible by the USB module
    DWORD size - the amount of data to read.

  Return Values:
    USB_SUCCESS                     - Read started successfully.
    USB_UNKNOWN_DEVICE              - Device with the specified address not found.
    USB_INVALID_STATE               - We are not in a normal running state.
    USB_ENDPOINT_ILLEGAL_TYPE       - Must use USBHostControlRead to read
                                        from a control endpoint.
    USB_ENDPOINT_ILLEGAL_DIRECTION  - Must read from an IN endpoint.
    USB_ENDPOINT_STALLED            - Endpoint is stalled.  Must be cleared
                                        by the application.
    USB_ENDPOINT_ERROR              - Endpoint has too many errors.  Must be
                                        cleared by the application.
    USB_ENDPOINT_BUSY               - A Read is already in progress.
    USB_ENDPOINT_NOT_FOUND          - Invalid endpoint.

  Remarks:
    None
  ***************************************************************************/
BYTE AndroidAppRead(void* handle, BYTE* data, DWORD size)
{
    BYTE i;

    for(i=0;i<NUM_ANDROID_DEVICES_SUPPORTED;i++)
    {
        if(handle == devices[i].protocolHandle) {
            return protocolVersions[devices[i].protocol - 1].read(handle,data,size);
        }
    }

    return USB_UNKNOWN_DEVICE;
}

/****************************************************************************
  Function:
    BOOL AndroidAppIsReadComplete(void* handle, BYTE* errorCode, DWORD* size)

  Summary:
    Check to see if the last read to the Android device was completed

  Description:
    Check to see if the last read to the Android device was completed.  If 
    complete, returns the amount of data that was sent and the corresponding 
    error code for the transmission.

  Precondition:
    Transfer has previously been requested from an Android device.

  Parameters:
    void* handle - the handle passed to the device in the EVENT_ANDROID_ATTACH event
    BYTE* errorCode - a pointer to the location where the resulting error code should be written
    DWORD* size - a pointer to the location where the resulting size information should be written

  Return Values:
    TRUE    - Transfer is complete.
    FALSE   - Transfer is not complete.

  Remarks:
    Possible values for errorCode are:
        * USB_SUCCESS                     - Transfer successful
        * USB_UNKNOWN_DEVICE              - Device not attached
        * USB_ENDPOINT_STALLED            - Endpoint STALL'd
        * USB_ENDPOINT_ERROR_ILLEGAL_PID  - Illegal PID returned
        * USB_ENDPOINT_ERROR_BIT_STUFF
        * USB_ENDPOINT_ERROR_DMA
        * USB_ENDPOINT_ERROR_TIMEOUT
        * USB_ENDPOINT_ERROR_DATA_FIELD
        * USB_ENDPOINT_ERROR_CRC16
        * USB_ENDPOINT_ERROR_END_OF_FRAME
        * USB_ENDPOINT_ERROR_PID_CHECK
        * USB_ENDPOINT_ERROR              - Other error
  ***************************************************************************/
BOOL AndroidAppIsReadComplete(void* handle, BYTE* errorCode, DWORD* size)
{
    BYTE i;

    for(i=0;i<NUM_ANDROID_DEVICES_SUPPORTED;i++)
    {
        if(handle == devices[i].protocolHandle) {
            return protocolVersions[devices[i].protocol - 1].isReadComplete(handle,errorCode,size);
        }
    }

    *errorCode = USB_UNKNOWN_DEVICE;
    *size = 0;
    return TRUE;
}

/****************************************************************************
  Function:
    void AndroidTasks(void)

  Summary:
    Tasks function that keeps the Android client driver moving

  Description:
    Tasks function that keeps the Android client driver moving.  Keeps the driver
    processing requests and handling events.  This function should be called
    periodically (the same frequency as USBHostTasks() would be helpful).

  Precondition:
    AndroidAppStart() function has been called before the first calling of this function

  Parameters:
    None

  Return Values:
    None

  Remarks:
    This function should be called periodically to keep the Android driver moving.
  ***************************************************************************/
void AndroidTasks(void)
{
    BYTE i;

    for(i=0;i<NUM_ANDROID_DEVICES_SUPPORTED;i++)
    {
        switch(devices[i].state)
        {
            case DEVICE_ATTACHED:
                {
                    BYTE errorCode;

                    errorCode = AndroidCommandGetProtocol(&devices[i],(WORD*)&devices[i].protocol);

                    if(errorCode == USB_SUCCESS)
                    {
                        devices[i].state = GET_PROTOCOL_SENT;
                    }
                }   
                break;

            case GET_PROTOCOL_SENT:
                //Nothing to do here.  The event transfer will progress our state.
                break;

            //Nothing to do in these states
            case NO_DEVICE:
                //Fall through
            case READY:
                break;

            default:
                //Unknown state, reset it
                devices[i].state = NO_DEVICE;
                break;
        }
    }

    for(i=0;i<(sizeof(protocolVersions)/sizeof(ANDROID_PROTOCOL_VERSION));i++)
    {
        protocolVersions[i].tasks();
    }
}

//DOM-IGNORE-BEGIN
//***************************************************************************
//***************************************************************************
//***************************************************************************
//  API Interface to sub-protocol drivers
//***************************************************************************
//***************************************************************************
//***************************************************************************


/****************************************************************************
  Function:
    BYTE AndroidCommandGetProtocol(ANDROID_DEVICE_DATA* device, WORD *protocol)

  Summary:
    Requests the protocol version from the specified Android device.

  Description:
    Requests the protocol version from the specified Android device.    

  Precondition:
    None

  Parameters:
    ANDROID_DEVICE_DATA* device - pointer to the Android device to query
    WORD *protocol - pointer to where to store the resulting protocol version

  Return Values:
    USB_SUCCESS                 - Request processing started
    USB_UNKNOWN_DEVICE          - Device not found
    USB_INVALID_STATE           - The host must be in a normal running state
                                    to do this request
    USB_ENDPOINT_BUSY           - A read or write is already in progress
    USB_ILLEGAL_REQUEST         - SET CONFIGURATION cannot be performed with
                                    this function.

  Remarks:
    Internal API only.  Should not be called by a user.
  ***************************************************************************/
BYTE AndroidCommandGetProtocol(ANDROID_DEVICE_DATA* device, WORD *protocol)
{
    return USBHostIssueDeviceRequest (  device->address,                    //BYTE deviceAddress, 
                                        USB_SETUP_DEVICE_TO_HOST            //BYTE bmRequestType,
                                            | USB_SETUP_TYPE_VENDOR 
                                            | USB_SETUP_RECIPIENT_DEVICE,       
                                        ANDROID_ACCESSORY_GET_PROTOCOL,     //BYTE bRequest,
                                        0,                                  //WORD wValue, 
                                        0,                                  //WORD wIndex, 
                                        2,                                  //WORD wLength, 
                                        (BYTE*)protocol,                    //BYTE *data, 
                                        USB_DEVICE_REQUEST_GET,             //BYTE dataDirection,
                                        device->clientDriverID              //BYTE clientDriverID 
                                      );
}

/****************************************************************************
  Function:
    BOOL AndroidIsLastCommandComplete(BYTE address, BYTE *errorCode, DWORD *byteCount)

  Summary:
    Checks to see if the last command request is complete.

  Description:
    Checks to see if the last command request is complete.

  Precondition:
    AndroidAppStart() function has been called before the first calling of this function

  Parameters:
    BYTE address - the address of the device that issued the command
    BYTE* errorCode - pointer to the location where the error code should be stored
    DWORD* byteCount - pointer to the location where the size of the resulting transfer should be written.

  Return Values:
    TRUE - command is complete
    FALSE - command is still in progress

  Remarks:
    This function is implemented for polled transfer implementations but should
    be deprecated once polled transfer requests are removed.

    Internal API only.  Should not be called by a user.
  ***************************************************************************/
BOOL AndroidIsLastCommandComplete(BYTE address, BYTE *errorCode, DWORD *byteCount)
{
    return USBHostTransferIsComplete(   address,        //BYTE deviceAddress, 
                                        0,                      //BYTE endpoint, 
                                        errorCode,              //BYTE *errorCode,
                                        byteCount               //DWORD *byteCount 
                                    );
}


//***************************************************************************
//***************************************************************************
//***************************************************************************
//  API Interface to USB stack
//***************************************************************************
//***************************************************************************
//***************************************************************************

/****************************************************************************
  Function:
    BOOL AndroidAppInitialize( BYTE address, DWORD flags, BYTE clientDriverID )

  Summary:
    Per instance client driver for Android device.  Called by USB host stack from
    the client driver table.

  Description:
    Per instance client driver for Android device.  Called by USB host stack from
    the client driver table.

  Precondition:
    None

  Parameters:
    BYTE address - the address of the device that is being initialized
    DWORD flags - the initialization flags for the device
    BYTE clientDriverID - the clientDriverID for the device

  Return Values:
    TRUE - initialized successfully
    FALSE - does not support this device

  Remarks:
    This is a internal API only.  This should not be called by anything other
    than the USB host stack via the client driver table
  ***************************************************************************/
BOOL AndroidAppInitialize( BYTE address, DWORD flags, BYTE clientDriverID )
{
    BYTE i;

    //See if the device is already in the device list
    for(i=0;i<NUM_ANDROID_DEVICES_SUPPORTED;i++)
    {
        if(devices[i].state != NO_DEVICE)
        {
            if(devices[i].protocol == 1)
            {
                devices[i].countDown = 0;
                devices[i].protocolHandle = protocolVersions[0].init(devices[i].address, devices[i].flags, devices[i].clientDriverID);
                return TRUE;
            }
            return FALSE;
        }
    }

    //Find an empty location for this new device
    for(i=0;i<NUM_ANDROID_DEVICES_SUPPORTED;i++)
    {
        if(devices[i].state == NO_DEVICE)
        {
            if( (flags & ANDROID_INIT_FLAG_BYPASS_PROTOCOL) == ANDROID_INIT_FLAG_BYPASS_PROTOCOL)
            {
                devices[i].protocol = 1;
                devices[i].countDown = 0;
                devices[i].flags = flags;
                devices[i].state = READY;
                devices[i].clientDriverID = clientDriverID;
                devices[i].address = address;
                devices[i].protocolHandle = protocolVersions[0].init(devices[i].address, devices[i].flags, devices[i].clientDriverID);
            }
            else
            {
                devices[i].state = DEVICE_ATTACHED;
                devices[i].address = address;
                devices[i].flags = flags;
                devices[i].clientDriverID = clientDriverID;
            }

            return TRUE;
        }
    }

    //No slot available, can't handle this device
    return FALSE;
}

/****************************************************************************
  Function:
    BOOL AndroidAppDataEventHandler( BYTE address, USB_EVENT event, void *data, DWORD size )

  Summary:
    Handles data events from the host stack

  Description:
    Handles data events from the host stack

  Precondition:
    None

  Parameters:
    BYTE address - the address of the device that caused the event
    USB_EVENT event - the event that occured
    void* data - the data for the event
    DWORD size - the size of the data in bytes

  Return Values:
    TRUE - the event was handled
    FALSE - the event was not handled

  Remarks:
    This is a internal API only.  This should not be called by anything other
    than the USB host stack via the client driver table
  ***************************************************************************/
BOOL AndroidAppDataEventHandler( BYTE address, USB_EVENT event, void *data, DWORD size )
{
    BYTE i;

    switch (event)
    {
        case EVENT_SOF:              // Start of frame - NOT NEEDED
            return TRUE;
        case EVENT_1MS:
            for(i=0;i<NUM_ANDROID_DEVICES_SUPPORTED;i++)
            {
                switch(devices[i].countDown)
                {
                    case 0:
                        //do nothing
                        break;
                    case 1:
                        //Device has timed out.  Destroy its info.
                        memset(&devices[i],0x00,sizeof(ANDROID_DEVICE_DATA));
                        break;
                    default:
                        //for every other number, decrement the count
                        devices[i].countDown--;
                        break;
                }
            }
            return TRUE;
        default:
            break;
    }
    return FALSE;
}

/****************************************************************************
  Function:
    BOOL AndroidAppEventHandler( BYTE address, USB_EVENT event, void *data, DWORD size )

  Summary:
    Handles events from the host stack

  Description:
    Handles events from the host stack

  Precondition:
    None

  Parameters:
    BYTE address - the address of the device that caused the event
    USB_EVENT event - the event that occured
    void* data - the data for the event
    DWORD size - the size of the data in bytes

  Return Values:
    TRUE - the event was handled
    FALSE - the event was not handled

  Remarks:
    This is a internal API only.  This should not be called by anything other
    than the USB host stack via the client driver table
  ***************************************************************************/
BOOL AndroidAppEventHandler( BYTE address, USB_EVENT event, void *data, DWORD size )
{
    HOST_TRANSFER_DATA* transfer_data = data ;
    BYTE i,j;

    //Throw the message to the protocol handlers if they match the address
    //  and are ready.
    for(i=0;i<NUM_ANDROID_DEVICES_SUPPORTED;i++)
    {
        if((devices[i].state == READY) && (devices[i].address == address))
        {
            for(j=0;j<(sizeof(protocolVersions)/sizeof(ANDROID_PROTOCOL_VERSION));j++)
            {
                if(devices[i].protocol == protocolVersions[j].versionNumber)
                {
                    protocolVersions[j].handler(address, event, data, size);

                    //Force exit both for loops
                    i=NUM_ANDROID_DEVICES_SUPPORTED;
                    break;
                }
            }
        }
    }

    switch (event)
    {
        case EVENT_DETACH:           // USB cable has been detached (data: BYTE, address of device)
            for(i=0;i<NUM_ANDROID_DEVICES_SUPPORTED;i++)
            {
                if(devices[i].address == address)
                {
                    if(devices[i].state == READY)
                    {
                        switch(devices[i].protocol)
                        {
                            case 1:
                                devices[i].countDown = ANDROID_DEVICE_ATTACH_TIMEOUT;
                                break;
                            default:
                                //USB_HOST_APP_EVENT_HANDLER(address,event,devices[i].protocolHandle,sizeof(ANDROID_DEVICE_DATA*));
                                break;
                        }
                    }
                    else
                    {
                        USB_HOST_APP_EVENT_HANDLER(address,event,devices[i].protocolHandle,sizeof(ANDROID_DEVICE_DATA*));
                        //Device has timed out.  Destroy its info.
                        memset(&devices[i],0x00,sizeof(ANDROID_DEVICE_DATA));
                    }
                }
            }
            
            return TRUE;
        case EVENT_TRANSFER:        
            for(i=0;i<NUM_ANDROID_DEVICES_SUPPORTED;i++)
            {
                if((transfer_data->bEndpointAddress == 0x00) && (devices[i].state == GET_PROTOCOL_SENT))
                {
                    for(j=0;j<(sizeof(protocolVersions)/sizeof(ANDROID_PROTOCOL_VERSION));j++)
                    {
                        if(devices[i].protocol == protocolVersions[j].versionNumber)
                        {
                            //From this level standpoint, we are done.  The rest is
                            //  protocol layer specific
                            devices[i].state = READY;
                            devices[i].protocolHandle = protocolVersions[j].init(devices[i].address, devices[i].flags, devices[i].clientDriverID);
                            break;
                        }
                    }

                    if(j >= (sizeof(protocolVersions)/sizeof(ANDROID_PROTOCOL_VERSION)))
                    {
                        //If we don't support that protocol version, use the next best version
                        devices[i].state = READY;
                        devices[i].protocolHandle = protocolVersions[j-1].init(devices[i].address, devices[i].flags, devices[i].clientDriverID);
                    }

                    return TRUE;
                }
            }
            return TRUE;
        case EVENT_NONE:             // No event occured (NULL event)
            //Fall through
        case EVENT_HUB_ATTACH:       // USB hub has been attached
            //Fall through           
        case EVENT_RESUME:           // Device-mode resume received
            //Fall through           
        case EVENT_SUSPEND:          // Device-mode suspend/idle event received
            //Fall through           
        case EVENT_RESET:            // Device-mode bus reset received
            //Fall through           
        case EVENT_STALL:            // A stall has occured
            //Fall through           
        case EVENT_BUS_ERROR:            // BUS error has occurred
            return TRUE;
        default:
            break;
    }
    return FALSE;
}


//DOM-IGNORE-END
