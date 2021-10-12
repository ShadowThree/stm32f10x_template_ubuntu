#!/usr/bin/bash

arm-none-eabi-gcc -c -mthumb -mcpu=cortex-m3 -g -Wa,--warn -o startup_stm32f10x_hd.o ../startup_stm32f10x_hd.s

arm-none-eabi-gcc -DSTM32F10X_HD -c -mthumb -mcpu=cortex-m3 -g -Wa,--warn -I../inc -I../components/inc -o main.o ../app/main.c

arm-none-eabi-gcc -DSTM32F10X_HD -c -mthumb -mcpu=cortex-m3 -g -Wa,--warn -I../inc -I../components/inc -o core_cm3.o ../core/core_cm3.c

arm-none-eabi-gcc -DSTM32F10X_HD -DUSE_STDPERIPH_DRIVER -c -mthumb -mcpu=cortex-m3 -g -Wa,--warn -I../inc -I../components/inc -o stm32f10x_gpio.o ../src/stm32f10x_gpio.c

arm-none-eabi-gcc -DSTM32F10X_HD -DUSE_STDPERIPH_DRIVER -c -mthumb -mcpu=cortex-m3 -g -Wa,--warn -I../inc -I../components/inc -o stm32f10x_rcc.o ../src/stm32f10x_rcc.c

arm-none-eabi-gcc -DSTM32F10X_HD -DUSE_STDPERIPH_DRIVER -c -mthumb -mcpu=cortex-m3 -g -Wa,--warn -I../inc -I../components/inc -o system_stm32f10x.o ../src/system_stm32f10x.c

arm-none-eabi-gcc -DSTM32F10X_HD -DUSE_STDPERIPH_DRIVER -c -mthumb -mcpu=cortex-m3 -g -Wa,--warn -I../inc -I../components/inc -o stm32f10x_it.o ../src/stm32f10x_it.c

arm-none-eabi-gcc *.o -T ../stm32_flash.ld -o led.elf -mthumb -mcpu=cortex-m3 -W -Wall -lm -lc

rm ./*.o

arm-none-eabi-objcopy  led.elf led.bin -Obinary
arm-none-eabi-objcopy  led.elf led.hex -Oihex

rm led.elf

# 从flash的0x0开始，读取长度为0xFFFF的固件
#st-flash read led_read.bin 0x0 0xFFFF

# 擦除 flash
st-flash erase

# 烧 hex
st-flash --format ihex write led.hex

# 烧 bin
#st-flash write led.bin 0x8000000

#st-info
