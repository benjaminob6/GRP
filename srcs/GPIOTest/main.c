#include <stm32f10x.h>
#include <stm32f10x_rcc.h>
#include <stm32f10x_gpio.h>

volatile uint8_t ledval;

void Delay(uint32_t nTime);

int main(void)
{
  ledval = 0;

  GPIO_InitTypeDef  GPIO_InitStruct;

  //Enable Our Clock for the GPIO Pins
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);


  // Configure Pins. Currently, PortA, Pins 0-7, Push-Pull Output
  GPIO_StructInit(&GPIO_InitStruct); //Get everything all nice and clean
  GPIO_InitStruct.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_1 | GPIO_Pin_2 | GPIO_Pin_3 | GPIO_Pin_4 | 
                             GPIO_Pin_5 | GPIO_Pin_6 | GPIO_Pin_7;

  GPIO_InitStruct.GPIO_Mode = GPIO_Mode_Out_PP; // Push Pull Output
  GPIO_InitStruct.GPIO_Speed = GPIO_Speed_2MHz; //Choose the lowest acceptable speed
  GPIO_Init(GPIOA, &GPIO_InitStruct);

  // Configure SysTick
//  if ( SysTick_Config(SystemCoreClock / 1000))
//    while(1);

  while(1){
    //GPIO_SetBits(GPIOA, 0xFF & ledval);
    GPIO_WriteBit(GPIOA,GPIO_Pin_0, (ledval & 0x01 == 1) ? Bit_SET : Bit_RESET);
    ledval++;
    Delay(1500000); //Delay a lot
  }

}


/**************************************************************/
/* Magical Timing Functions. I'm sure I'll understand it soon */
/**************************************************************/
static __IO uint32_t TimingDelay; //Prevents Optimization by some sort of magic...

void Delay(uint32_t nTime){
  TimingDelay = nTime;
  while (TimingDelay-- != 0);
}

//void SysTick_Handler(void){
//  if (TimingDelay != 0x00)
//    TimingDelay--;
//}




/************************************************************/
/* Assertion for debugging and such                         */
/************************************************************/
#ifdef USE_FULL_ASSERT
void assert_failed(uint8_t* file, uint32_t line)
{
  //Let GDB figure it out for now
  while (1);
}
#endif
