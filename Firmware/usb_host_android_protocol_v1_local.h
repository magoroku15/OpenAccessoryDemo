
//If the user hasn't specified a timeout period, make one up for them
#ifndef ANDROID_DEVICE_ATTACH_TIMEOUT
    #define ANDROID_DEVICE_ATTACH_TIMEOUT 1500
#endif

BYTE AndroidAppWrite_Pv1(void* handle, BYTE* data, DWORD size);
BOOL AndroidAppIsWriteComplete_Pv1(void* handle, BYTE* errorCode, DWORD* size);
BYTE AndroidAppRead_Pv1(void* handle, BYTE* data, DWORD size);
BOOL AndroidAppIsReadComplete_Pv1(void* handle, BYTE* errorCode, DWORD* size);
void* AndroidInitialize_Pv1 ( BYTE address, DWORD flags, BYTE clientDriverID );
void AndroidTasks_Pv1(void);
BOOL AndroidAppEventHandler_Pv1( BYTE address, USB_EVENT event, void *data, DWORD size );
BOOL AndroidAppDataEventHandler_Pv1( BYTE address, USB_EVENT event, void *data, DWORD size );
void AndroidAppStart_Pv1(void);
