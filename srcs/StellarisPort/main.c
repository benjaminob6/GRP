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


//
// Functions
/////////////////////////////////////////
void initPeripherals();




//
// Main program loop
////////////////////////////////////////
void main(void) {

	initPeripherals();

	while(1){

	}
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
	// Setup I/O pins
	///////////////////////////////////////////
    GPIOPinTypeGPIOInput(GPIO_PORTA_BASE, GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_7);
    GPIOPinTypeGPIOInput(GPIO_PORTB_BASE, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_4 | GPIO_PIN_5);
    GPIOPinTypeGPIOInput(GPIO_PORTD_BASE, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3);
    GPIOPinTypeGPIOInput(GPIO_PORTE_BASE, GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_5 | GPIO_PIN_4);


    GPIOPinTypeGPIOOutput(GPIO_PORTA_BASE, GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4);
    GPIOPinTypeGPIOOutput(GPIO_PORTB_BASE, GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_6 | GPIO_PIN_7);
    GPIOPinTypeGPIOOutput(GPIO_PORTC_BASE, GPIO_PIN_4 | GPIO_PIN_6 | GPIO_PIN_5 | GPIO_PIN_7);
    GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE, GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4);

    // PinMux spit this out for me. I'll just trust it for now
    // First open the lock and select the bits we want to modify in the GPIO commit register.
    HWREG(GPIO_PORTD_BASE + GPIO_O_LOCK) = GPIO_LOCK_KEY_DD;
    HWREG(GPIO_PORTD_BASE + GPIO_O_CR) = 0x80;

    GPIOPinTypeGPIOOutput(GPIO_PORTD_BASE, GPIO_PIN_7);
    GPIOPinTypeGPIOOutput(GPIO_PORTD_BASE, GPIO_PIN_5);


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


