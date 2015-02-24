################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Niloy/Documents/Arduino/libraries/ADK/utility/usb_drv.c 

C_DEPS += \
./Libraries/ADK/utility/usb_drv.c.d 

LINK_OBJ += \
./Libraries/ADK/utility/usb_drv.c.o 


# Each subdirectory must supply rules for building sources it contributes
Libraries/ADK/utility/usb_drv.c.o: C:/Users/Niloy/Documents/Arduino/libraries/ADK/utility/usb_drv.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-gcc" -c -g -Os -w -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Documents\Arduino\libraries\ADK" -I"C:\Users\Niloy\Documents\Arduino\libraries\ADK\utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '


