/********************************************************************
 FileName:	   	HardwareProfile - PIC24FJ64GB004 PIM.h
 Dependencies:	See INCLUDES section
 Processor: 	PIC24FJ64GB002
 Hardware:		PIC24FJ64GB002 PIM
 Compiler:		Microchip C30
 Company:		Microchip Technology, Inc.

 Software License Agreement:

 The software supplied herewith by Microchip Technology Incorporated
 (the �Company�) for its PIC� Microcontroller is intended and
 supplied to you, the Company�s customer, for use solely and
 exclusively on Microchip PIC Microcontroller products. The
 software is owned by the Company and/or its supplier, and is
 protected under applicable copyright laws. All rights are reserved.
 Any use in violation of the foregoing restrictions may subject the
 user to criminal sanctions under applicable laws, as well as to
 civil liability for the breach of the terms and conditions of this
 license.

 THIS SOFTWARE IS PROVIDED IN AN �AS IS� CONDITION. NO WARRANTIES,
 WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT NOT LIMITED
 TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. THE COMPANY SHALL NOT,
 IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL OR
 CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.

********************************************************************
 File Description:

 Change History:
  Rev	Date		 Description
  1.0	11/19/2004	 Initial release
  2.1	02/26/2007	 Updated for simplicity and to use common
					 coding style
  2.3	09/15/2008	 Broke out each hardware platform into its own
					 "HardwareProfile - xxx.h" file
  2.4b	04/08/2009	 Initial support for PIC24FJ64GB004 family
********************************************************************/

#ifndef HARDWARE_PROFILE_PIC24FJ64GB002_PIM_H
#define HARDWARE_PROFILE_PIC24FJ64GB002_PIM_H

	/*******************************************************************/
	/*******************************************************************/
	/*******************************************************************/
	/******** Application specific definitions *************************/
	/*******************************************************************/
	/*******************************************************************/
	/*******************************************************************/

	/** Board definition ***********************************************/
	//These defintions will tell the main() function which board is
	//	currently selected.  This will allow the application to add
	//	the correct configuration bits as wells use the correct
	//	initialization functions for the board.  These defitions are only
	//	required in the stack provided demos.  They are not required in
	//	final application design.
	#define DEMO_BOARD PIC24FJ64GB002_PIM
	#define EXPLORER_16
	#define PIC24FJ64GB002_PIM
	#define CLOCK_FREQ 32000000

	#define DEMO_BOARD_NAME_STRING "PIC24FJ64GB002 PIM"
	
	/** LED ************************************************************/
	//#define InitAllLEDs()	   LATA &= 0xFD7F; TRISA &= 0xFD7F; LATB &= 0xFFF3; TRISB &= 0xFFF3;
	#define InitAllLEDs()	   LATA &= 0xFFFC; TRISA &= 0xFFFC; LATB &= 0xFFFF; TRISB &= 0xFFFF;
	
	#define mLED_1				LATAbits.LATA0	//	LATAbits.LATA7
	#define mLED_2				LATAbits.LATA1	//	LATBbits.LATB3
//	#define mLED_3				LATBbits.LATB2
//	#define mLED_4				LATAbits.LATA9	   
	
	#define LED0_On()		  mLED_1 = 1;
	#define LED1_On()		  mLED_2 = 1;
	#define LED2_On()
	#define LED3_On()
	#define LED4_On()
	#define LED5_On()
	#define LED6_On()
	#define LED7_On()
	
	#define LED0_Off()		  mLED_1 = 0;
	#define LED1_Off()		  mLED_2 = 0;
	#define LED2_Off()
	#define LED3_Off()
	#define LED4_Off()
	#define LED5_Off()
	#define LED6_Off()
	#define LED7_Off()
	
	/** SWITCH *********************************************************/
	#define mInitSwitch2()		TRISBbits.TRISB5=1;	//TRISAbits.TRISA10=1;
	#define mInitSwitch3()		TRISAbits.TRISA4=1;	//TRISAbits.TRISA9=1;
	#define InitAllSwitches()  mInitSwitch2();	mInitSwitch3();
	#define sw2 				PORTBbits.RB5	//PORTAbits.RA10
	#define sw3 				PORTAbits.RA4	//PORTAbits.RA9

	#define Switch1Pressed()	((PORTBbits.RB5  == 0)? TRUE : FALSE)
	#define Switch2Pressed()	((PORTAbits.RA4  == 0)? TRUE : FALSE)
	#define Switch3Pressed()	FALSE
	#define Switch4Pressed()	FALSE

	/** POT ************************************************************/
	
	#define mInitPOT()	{AD1PCFGLbits.PCFG5 = 0;	AD1CON2bits.VCFG = 0x0;    AD1CON3bits.ADCS = 0xFF;    AD1CON1bits.SSRC = 0x0;	  AD1CON3bits.SAMC = 0b10000;	 AD1CON1bits.FORM = 0b00;	 AD1CON2bits.SMPI = 0x0;	AD1CON1bits.ADON = 1;}

	/** I/O pin definitions ********************************************/
	#define INPUT_PIN 1
	#define OUTPUT_PIN 0

	/** UART ***********************************************************/
	#define BAUDRATE2		57600UL
	#define BRG_DIV2		4 
	#define BRGH2			1 

//	#include <p24fxxxx.h>
//	#include <uart2.h>

#endif	//HARDWARE_PROFILE_PIC24FJ64GB002_PIM_H
