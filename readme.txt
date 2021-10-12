1. 工程目的：在 ubuntu 环境下从 C 文件开始编译固件，熟悉整个开发流程
2. 工程功能：LED 闪烁（LED 接在 STM32F103RCT6 的 GPIO_A8 上）
3. 编译详情请查看 build.sh 文件
4. 链接文件路径： STM32F10x_StdPeriph_Lib_V3.5.0/Project/STM32F10x_StdPeriph_Template/TrueSTUDIO/STM3210E-EVAL/stm32_flash.ld

使用方法：
    0. 通过 st-link 工具连接开发板到PC，确保 st-link 驱动安装成功
       以及在 build.sh 命令中需要用到的工具也要提前安装好
    1. 进入 build 文件夹
    2. 执行 ./build.sh

注意：
    编译过程中出现错误，根据网上的建议，
    稍微修改了 core_cm3.c 和 stm32_flash.ld 文件
    
