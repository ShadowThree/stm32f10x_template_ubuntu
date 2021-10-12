#include "stm32f10x.h"
#include "stm32f10x_conf.h"
//#include "stm32f10x_rcc.h"
//#include "stm32f10x_gpio.h"
//#include "delay.h"

void delay_us(uint16_t us)
{    
   uint16_t i = 0;  
   while(us--)
   {
      i = 10;
      while(i--);    
   }
}

void delay_ms(uint16_t time)
{    
   uint16_t i = 0;  
   while(time--)
   {
      i = 12000;
      while(i--);    
   }
}

GPIO_InitTypeDef GPIO_InitStructure;

int main()
{
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_Init(GPIOA, &GPIO_InitStructure);

    while(1)
    {
        GPIO_SetBits(GPIOA, GPIO_Pin_8);
        delay_ms(1000);
        GPIO_ResetBits(GPIOA, GPIO_Pin_8);
        delay_ms(1000);
    }

    return 0;
}

