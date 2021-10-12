#include "system_stm32f10x.h"
#include "core_cm3.h"   // for SysTick_Config()
#include "delay.h"

void Init_SysTick(void)
{
    if(SysTick_Config(SystemCoreClock / 1000))
        while(1);
}

__IO uint32_t TimingDelay;
void delay_ms(__IO uint32_t nTime)
{
    TimingDelay = nTime;
    while(TimingDelay != 0);
}
