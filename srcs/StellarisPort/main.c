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
#define MAX_COMMAND_LEN 16

//
// Global Variables
/////////////////////////////////////////
char command[MAX_COMMAND_LEN];
volatile short commandIndex;
volatile short testvalue;
volatile short currentOutputs;

//
// Functions
/////////////////////////////////////////
void initPeripherals();
unsigned short GetActuators();
void SetSensors(unsigned short SensorValue);

//
// Really not like normal strcmp
////////////////////////////////////
int strcmp(char* str1, char* str2){
	while ( *str1 && *str2 ){

		if ( *str1 != *str2){
			return 0;
		}

		str1++; str2++;
	}

	return 1;
}


void UARTSend(char* cBuffer, unsigned long ulCount){
	while(ulCount--){
		UARTCharPutNonBlocking(UART0_BASE, *cBuffer++);
	}
}

void SendInputValues(short inputValue){
	char hexdisp[4];

	hexdisp[0] = (char)((inputValue & 0xF000) >> 12) + '0';
	hexdisp[1] = (char)((inputValue & 0x0F00) >> 8) + '0';
	hexdisp[2] = (char)((inputValue & 0x00F0) >> 4) + '0';
	hexdisp[3] = (char)((inputValue & 0x000F) ) + '0';

	hexdisp[0] += hexdisp[0] > '9' ? 7 : 0;
	hexdisp[1] += hexdisp[1] > '9' ? 7 : 0;
	hexdisp[2] += hexdisp[2] > '9' ? 7 : 0;
	hexdisp[3] += hexdisp[3] > '9' ? 7 : 0;

	UARTSend("EW=",3);
	UARTSend(hexdisp,4);
	UARTSend("\r",1);
}

short parseHexWord(char *hex){
	return (short)
		(
			(hex[0] > '9' ? hex[0] - '0' - 7 : hex[0] - '0') * 4096 +
			(hex[1] > '9' ? hex[1] - '0' - 7 : hex[1] - '0') * 256  +
			(hex[2] > '9' ? hex[2] - '0' - 7 : hex[2] - '0') * 16 +
			(hex[3] > '9' ? hex[3] - '0' - 7 : hex[3] - '0')
		);
}

void ParseCommand(char *command){
	if ( strcmp(command,"setup0") ){
		UARTSend("setup1\r",7); //Respond to the setup
		TimerEnable(TIMER0_BASE, TIMER_A);
	} else if ( strcmp(command,"MAW=") ) {
		//Update the output values
		short newOutputs = parseHexWord(command+4);
		SetSensors(newOutputs);
	} else if ( strcmp(command, "RST")){
		TimerDisable(TIMER0_BASE, TIMER_A);
		testvalue = 0;
	}
}


void UARTRead(){
	char c;
	while (UARTCharsAvail(UART0_BASE)){
		c = UARTCharGetNonBlocking(UART0_BASE);
		if ( c == '\r'){
			command[commandIndex++] = '\0';
			commandIndex = 0;
			ParseCommand(command);
		} else {
			command[commandIndex++] = c;
		}
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

	//unsigned short testval = 0;

	initPeripherals();

	while(1){
		UARTRead();
	}
}

void Timer0IntHandler(void){
	TimerIntClear(TIMER0_BASE, TIMER_TIMA_TIMEOUT);
	SendInputValues(GetActuators());
}


unsigned short GetActuators(){

	// 15	14		13		12		11		10		9		8		7		6		5		4		3		2		1		0
	//C3-7	C3-6	C3-5	C3-4	C3-3	C3-2	C3-1	C3-0	C1-7	C1-6	C1-5	C1-4	C1-3	C1-2	C1-1	C1-0
	//PC7	PA6		PD6		PA7		PC6		PB4		PC5		PA5		PC4		PE4		PB3		PE5		PF3		PB0		PF2		PB1
	//
	// Ports: A, C, D, B, F
	// Port A: 7 6 5
	// Port B: 4 3 1 0
	// Port C: 7 6 5 4
	// Port D: 6
	// Port E: 5 4
	// Port F: 3 2

	unsigned short PortA = GPIOPinRead(GPIO_PORTA_BASE, GPIO_PIN_7 | GPIO_PIN_6 | GPIO_PIN_5);
	unsigned short PortB = GPIOPinRead(GPIO_PORTB_BASE, GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_1 | GPIO_PIN_0);
	unsigned short PortC = GPIOPinRead(GPIO_PORTC_BASE, GPIO_PIN_7 | GPIO_PIN_6 | GPIO_PIN_5 | GPIO_PIN_4);
	unsigned short PortD = GPIOPinRead(GPIO_PORTD_BASE, GPIO_PIN_6);
	unsigned short PortE = GPIOPinRead(GPIO_PORTE_BASE, GPIO_PIN_5 | GPIO_PIN_4);
	unsigned short PortF = GPIOPinRead(GPIO_PORTF_BASE, GPIO_PIN_3 | GPIO_PIN_2);

	unsigned short ActuatorValues = (PortC & GPIO_PIN_7) << (15-7) |
									(PortA & GPIO_PIN_6) << (14-6) |
									(PortD & GPIO_PIN_6) << (13-6) |
									(PortA & GPIO_PIN_7) << (12-7) |
									(PortC & GPIO_PIN_6) << (11-6) |
									(PortB & GPIO_PIN_4) << (10-4) |
									(PortC & GPIO_PIN_5) << (9-5) |
									(PortA & GPIO_PIN_5) << (8-5) |
									(PortC & GPIO_PIN_4) << (7-4) |
									(PortE & GPIO_PIN_4) << (6-4) |
									(PortB & GPIO_PIN_3) << (5-3) |
									(PortE & GPIO_PIN_5) >> (5-4) |
									(PortF & GPIO_PIN_3) >> (3-3) |
									(PortB & GPIO_PIN_0) << (2-0) |
									(PortF & GPIO_PIN_2) >> (2-1) |
									(PortB & GPIO_PIN_1) >> (1-0);

	return ActuatorValues;
}

void SetSensors(unsigned short SensorValue){

	// 15	14		13		12		11		10		9		8		7		6		5		4		3		2		1		0
	//C2-7	C2-6	C2-5	C2-4	C2-3	C2-2	C2-1	C2-0	C0-7	C0-6	C0-5	C0-4	C0-3	C0-2	C0-1	C0-0
	//PE3	PD7		PF1		PF4		PE1		PA2		PE2		PA3		PD2		PA4		PD3		PB6		PD0		PB7		PD1		PB2
	//
	// Port: A, B, D, E, F
	// Port A: 4 3 2
	// Port B: 7 6 2
	// Port D: 7 3 2 1 0
	// Port E: 1 3 2
	// Port F: 4 1


	unsigned char PortABits = (SensorValue & (1 << 6)) >> 2 | /* bit 6 to bit A4 */
							  (SensorValue & (1 << 8)) >> 5 | /* bit 8 to bit A3 */
							  (SensorValue & (1 << 10)) >> 8 ; /* bit 10 to bit A2 */

	unsigned char PortBBits = (SensorValue & (1 << 4)) << 2 |  /* bit 4 to bit B6*/
							  (SensorValue & (1 << 2)) << 5 | /* bit 2 to bit B7 */
							  (SensorValue & (1 << 0)) << 2 ; /* bit 0 to bit B2 */

	unsigned char PortDBits = (SensorValue & (1 << 14)) >> 7 | /* bit 14 to bit D7 */
							  (SensorValue & (1 <<  7)) >> 5 | /* bit 7 to bit D2 */
							  (SensorValue & (1 << 5)) >> 2  | /* bit 5 to bit D3 */
							  (SensorValue & (1 << 1)) >> 0  | /* bit 1 to bit D1 */
							  (SensorValue & (1 << 3)) >> 3 ; /* bit 3 to bit D0 */

	unsigned char PortEBits = (SensorValue & (1 << 15)) >> 12 | /* bit 15 to bit E3 */
							  (SensorValue & (1 << 9)) >> 7 | /* bit 9 to bit E2 */
							  (SensorValue & (1 << 11)) >> 10 ; /* bit 11 to bit E1 */

	unsigned char PortFBits = (SensorValue & (1 << 13)) >> 12 | /* bit 13 to bit F1 */
							  (SensorValue & (1 << 12)) >> 8 ; /* bit 12 to bit F4 */


    GPIOPinWrite(GPIO_PORTA_BASE, GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4, PortABits);
    GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_7, PortDBits);
    GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_2 | GPIO_PIN_6 | GPIO_PIN_7, PortBBits);
    GPIOPinWrite(GPIO_PORTE_BASE, GPIO_PIN_1 | GPIO_PIN_2 |GPIO_PIN_3, PortEBits);
    GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_1 | GPIO_PIN_4, PortFBits);
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
	// Configure a timer
	////////////////////////////////////////
	SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER0);
	TimerConfigure(TIMER0_BASE,TIMER_CFG_32_BIT_PER);
	TimerLoadSet(TIMER0_BASE, TIMER_A, (SysCtlClockGet()/15) - 1 );



	//
	// Enable GPIO Clocks we will be using (A-E)
	////////////////////////////////////////////
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOB);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOC);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOD);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOE);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);

	// Inputs
	// Ports: A, C, D, B, F
	// Port A: 7 6 5
	// Port B: 4 3 1 0
	// Port C: 7 6 5 4
	// Port D: 6
	// Port E: 5 4
	// Port F: 3 2

    // PinMux spit this out for me. I'll just trust it for now
    // First open the lock and select the bits we want to modify in the GPIO commit register.
    HWREG(GPIO_PORTD_BASE + GPIO_O_LOCK) = GPIO_LOCK_KEY_DD;
    HWREG(GPIO_PORTD_BASE + GPIO_O_CR) = 0x80;

	//
	// Setup I/O pins
	///////////////////////////////////////////
    GPIOPinTypeGPIOInput(GPIO_PORTA_BASE, GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_7);
    GPIOPinTypeGPIOInput(GPIO_PORTB_BASE, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_3 | GPIO_PIN_4);
    GPIOPinTypeGPIOInput(GPIO_PORTC_BASE, GPIO_PIN_7 | GPIO_PIN_6 | GPIO_PIN_5 | GPIO_PIN_4);
    GPIOPinTypeGPIOInput(GPIO_PORTD_BASE, GPIO_PIN_6 );
    GPIOPinTypeGPIOInput(GPIO_PORTE_BASE, GPIO_PIN_5 | GPIO_PIN_4);
    GPIOPinTypeGPIOInput(GPIO_PORTF_BASE, GPIO_PIN_3 | GPIO_PIN_2);


    // Outputs
	// Port: A, B, D, E, F
	// Port A: 4 3 2
	// Port B: 7 6 2
	// Port D: 7 3 2 1 0
	// Port E: 1 3 2
	// Port F: 4 1
    GPIOPinTypeGPIOOutput(GPIO_PORTA_BASE, GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4);
    GPIOPinWrite(GPIO_PORTA_BASE, GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4, 0);

    GPIOPinTypeGPIOOutput(GPIO_PORTB_BASE, GPIO_PIN_2 | GPIO_PIN_6 | GPIO_PIN_7);
    GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_2 | GPIO_PIN_6 | GPIO_PIN_7, 0);

    GPIOPinTypeGPIOOutput(GPIO_PORTD_BASE, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_7);
    GPIOPinWrite(GPIO_PORTD_BASE,GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_7, 0);

    GPIOPinTypeGPIOOutput(GPIO_PORTE_BASE, GPIO_PIN_1 | GPIO_PIN_3 | GPIO_PIN_2);
    GPIOPinWrite(GPIO_PORTE_BASE, GPIO_PIN_1 | GPIO_PIN_2  | GPIO_PIN_3, 0);

    GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE, GPIO_PIN_1 | GPIO_PIN_4);
    GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_1 | GPIO_PIN_4, 0);





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
	// Prepare the timer interrupt
	////////////////////////////////////////
	IntMasterEnable();
	IntEnable(INT_TIMER0A);
	TimerIntEnable(TIMER0_BASE, TIMER_TIMA_TIMEOUT);

}


