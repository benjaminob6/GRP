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

	initPeripherals();

	while(1){
		//UARTSend("Hello WORLD!\r\n",14);
		unsigned short test = GetActuators();
		SysCtlDelay(15*SYS_MILLIS);
	}
}

unsigned short GetActuators(){
	// 15-8: PB5 PD0 PD1 PD2 PD3 PE1 PE2 PE3
	// 7-0: PB0 PB1 PE4 PE5 PB4 PA5 PA6 PA7

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
	// 15-8: PB3 PC4 PC5 PC6 PC7 PD5 PD7 PF4
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
    GPIOPinTypeGPIOOutput(GPIO_PORTD_BASE, GPIO_PIN_5 | GPIO_PIN_7);
    GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_5 | GPIO_PIN_7, 0);


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


