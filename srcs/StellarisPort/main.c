//
// Includes
//////////////////////////////////////////
#include "inc/hw_types.h"
#include "inc/hw_memmap.h"
#include "inc/hw_ints.h"
#include "inc/hw_gpio.h"
#include "driverlib/sysctl.h"
#include "driverlib/interrupt.h"
#include "driverlib/gpio.h"
#include "driverlib/timer.h"
#include "driverlib/uart.h"


//
// Defines and Macros
//////////////////////////////////////////
#define SYS_MILLIS 13333 //3 Cycles Per Loop. @40Mhz that's ~13,333 per ms!

//
// Global Variables
/////////////////////////////////////////

//
// Functions
/////////////////////////////////////////
void initPeripherals();
unsigned short GetActuators();
void SetSensors(unsigned short SensorValue);

void UARTSend(char* cBuffer, unsigned long ulCount){
	while(ulCount--){
		UARTCharPutNonBlocking(UART0_BASE, *cBuffer++);
	}
}


void __error__(char *pcFilename, unsigned long ulLine)
{
	while(1){}
}


//
// Main program loop
////////////////////////////////////////
void main(void){

	unsigned short testval = 0;

	initPeripherals();

	while(1){
		//UARTSend("Hello WORLD!\r\n",14);
		//unsigned short test = GetActuators();
		SetSensors(testval);
		SysCtlDelay(5*SYS_MILLIS);
		testval ++;
	}
}


unsigned short GetActuators(){
	// 15-8:	PB5 PD0 PD1 PD2		PD3 PE1 PE2 PE3
	// 7-0: 	PB0 PB1 PE4 PE5	 	PB4 PA5 PA6 PA7

	unsigned short PortA = GPIOPinRead(GPIO_PORTA_BASE, GPIO_PIN_7 | GPIO_PIN_6 | GPIO_PIN_5);
	unsigned short PortB = GPIOPinRead(GPIO_PORTB_BASE, GPIO_PIN_5 | GPIO_PIN_4 | GPIO_PIN_1 | GPIO_PIN_0);
	unsigned short PortD = GPIOPinRead(GPIO_PORTD_BASE, GPIO_PIN_3 | GPIO_PIN_2 | GPIO_PIN_1 | GPIO_PIN_0);
	unsigned short PortE = GPIOPinRead(GPIO_PORTE_BASE, GPIO_PIN_5 | GPIO_PIN_4 |GPIO_PIN_3 | GPIO_PIN_2 | GPIO_PIN_1 );

	unsigned short ActuatorValues = (PortB & GPIO_PIN_5) << (15-5) |
									(PortD & GPIO_PIN_0) << (14-0) |
									(PortD & GPIO_PIN_1) << (13-1) |
									(PortD & GPIO_PIN_2) << (12-2) |
									(PortD & GPIO_PIN_3) << (11-3) |
									(PortE & GPIO_PIN_1) << (10-1) |
									(PortE & GPIO_PIN_2) << (9-2) |
									(PortE & GPIO_PIN_3) << (8-3) |
									(PortB & GPIO_PIN_0) << (7-0) |
									(PortB & GPIO_PIN_1) << (6-1) |
									(PortE & GPIO_PIN_4) << (5-4) |
									(PortE & GPIO_PIN_5) >> (5-4) |
									(PortB & GPIO_PIN_4) >> (4-3) |
									(PortA & GPIO_PIN_5) >> (5-2) |
									(PortA & GPIO_PIN_6) >> (6-1) |
									(PortA & GPIO_PIN_7) >> (7-0);

	return ActuatorValues;
}

void SetSensors(unsigned short SensorValue){
	// 15-8: 	PB3 PC4 PC5 PC6  	PC7 PD6 PD7 PF4
	// 7-0: 	PF2 PF3 PB2 PB7   	PB6 PA4 PA3 PA2

	unsigned char PortABits = (SensorValue & (1 << 2)) << 2 | /* bit 2 to bit 4 */
							  (SensorValue & (1 << 1)) << 2 | /* bit 1 to bit 3 */
							  (SensorValue & (1 << 0)) << 2 ; /* bit 0 to bit 2 */

	unsigned char PortBBits = (SensorValue & (1 << 15)) >> 12 | /* bit 15 to bit 3*/
							  (SensorValue & (1 <<  5)) >> 3 | /* bit 5 to bit 2 */
							  (SensorValue & (1 <<  4)) << 3 | /* bit 4 to bit 7 */
							  (SensorValue & (1 <<  3)) << 3 ; /* bit 3 to bit 6 */

	unsigned char PortCBits = (SensorValue & (1 << 14)) >> 10 | /* bit 14 to bit 4 */
							  (SensorValue & (1 << 13)) >> 8 | /* bit 13 to bit 5 */
							  (SensorValue & (1 << 12)) >> 6 | /* bit 12 to bit 6 */
							  (SensorValue & (1 << 11)) >> 4 ; /* bit 11 to bit 7 */

	unsigned char PortDBits = (SensorValue & (1 << 10)) >> 4 | /* bit 10 to bit 6 */
							  (SensorValue & (1 << 9)) >> 2 ; /* bit 9 to bit 7 */

	unsigned char PortFBits = (SensorValue & (1 << 8)) >> 4 | /* bit 8 to bit 4 */
							  (SensorValue & (1 << 7)) >> 5 | /* bit 7 to bit 2 */
							  (SensorValue & (1 << 6)) >> 3 ; /* bit 6 to bit 3 */


    GPIOPinTypeGPIOOutput(GPIO_PORTA_BASE, GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4);
    GPIOPinWrite(GPIO_PORTA_BASE, GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4, PortABits);

    GPIOPinTypeGPIOOutput(GPIO_PORTB_BASE, GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_6 | GPIO_PIN_7);
    GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_6 | GPIO_PIN_7, PortBBits);

    GPIOPinTypeGPIOOutput(GPIO_PORTC_BASE, GPIO_PIN_4 | GPIO_PIN_6 | GPIO_PIN_5 | GPIO_PIN_7);
    GPIOPinWrite(GPIO_PORTC_BASE, GPIO_PIN_4 | GPIO_PIN_6 | GPIO_PIN_5 | GPIO_PIN_7, PortCBits);

    GPIOPinTypeGPIOOutput(GPIO_PORTD_BASE, GPIO_PIN_6 | GPIO_PIN_7);
    GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_6 | GPIO_PIN_7, PortDBits);

    GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE, GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4);
    GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4, PortFBits);
}

//
// Starts up the Clock, GPIO and UART
/////////////////////////////////////////
void initPeripherals(){

	//
	// 400Mhz PLL. /2 Built in, so /5 = 40Mhz
	/////////////////////////////////////////
	SysCtlClockSet(SYSCTL_SYSDIV_5|SYSCTL_USE_PLL|SYSCTL_XTAL_16MHZ|SYSCTL_OSC_MAIN);

	//
	// Enable GPIO Clocks we will be using (A-E)
	////////////////////////////////////////////
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOB);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOC);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOD);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOE);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);

	//
	// Inputs are on the Left side of the Stellaris Board
	// Outputs are on the Right side. They are grouped as follows
	//
	// INPUTS (Actuators)
	// 7-0: PB0 PB1 PE4 PE5 PB4 PA5 PA6 PA7
	// 15-8: PB5 PD0 PD1 PD2 PD3 PE1 PE2 PE3
	//
	//
	// Outputs (Sensors)
	// 7-0: PF2 PF3 PB2 PB7 PB6 PA4 PA3 PA2
	// 15-8: PB3 PC4 PC5 PC6 PC7 PD6 PD7 PF4
	///////////////////////////////////////////////////////////

	//
	// Setup I/O pins
	///////////////////////////////////////////
    GPIOPinTypeGPIOInput(GPIO_PORTA_BASE, GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_7);
    GPIOPinTypeGPIOInput(GPIO_PORTB_BASE, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_4 | GPIO_PIN_5);
    GPIOPinTypeGPIOInput(GPIO_PORTD_BASE, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3);
    GPIOPinTypeGPIOInput(GPIO_PORTE_BASE, GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5);


    GPIOPinTypeGPIOOutput(GPIO_PORTA_BASE, GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4);
    GPIOPinWrite(GPIO_PORTA_BASE, GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4, 0);

    GPIOPinTypeGPIOOutput(GPIO_PORTB_BASE, GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_6 | GPIO_PIN_7);
    GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_6 | GPIO_PIN_7, 0);

    GPIOPinTypeGPIOOutput(GPIO_PORTC_BASE, GPIO_PIN_4 | GPIO_PIN_6 | GPIO_PIN_5 | GPIO_PIN_7);
    GPIOPinWrite(GPIO_PORTC_BASE, GPIO_PIN_4 | GPIO_PIN_6 | GPIO_PIN_5 | GPIO_PIN_7, 0);

    GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE, GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4);
    GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4, 0);


    // PinMux spit this out for me. I'll just trust it for now
    // First open the lock and select the bits we want to modify in the GPIO commit register.
    HWREG(GPIO_PORTD_BASE + GPIO_O_LOCK) = GPIO_LOCK_KEY_DD;
    HWREG(GPIO_PORTD_BASE + GPIO_O_CR) = 0x80;

    GPIOPinTypeGPIOOutput(GPIO_PORTD_BASE, GPIO_PIN_6 | GPIO_PIN_7);
    GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_6 | GPIO_PIN_7, 0);


	//
	// Setup UART0 to use USB interface
	///////////////////////////////////////////
	SysCtlPeripheralEnable(SYSCTL_PERIPH2_UART0);
	GPIOPinConfigure(0x00000001);
	GPIOPinConfigure(0x00000401);
	GPIOPinTypeUART(GPIO_PORTA_BASE,GPIO_PIN_0|GPIO_PIN_1);

	//
	// Setup UART Params
	//////////////////////////////////////////
	UARTConfigSetExpClk(UART0_BASE,SysCtlClockGet(),115200,
			(UART_CONFIG_WLEN_8 | UART_CONFIG_STOP_ONE | UART_CONFIG_PAR_NONE));

	//
	// Enable Serial Interrupts (and in startup_css.c)
	/////////////////////////////////////////
	IntMasterEnable();
	IntEnable(INT_UART0);
	UARTIntEnable(UART0_BASE, UART_INT_RX | UART_INT_RT);

}


