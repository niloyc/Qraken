################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/avr-libc/malloc.c \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/avr-libc/realloc.c 

C_DEPS += \
./arduino/malloc.c.d \
./arduino/realloc.c.d 

AR_OBJ += \
./arduino/malloc.c.o \
./arduino/realloc.c.o 


# Each subdirectory must supply rules for building sources it contributes
arduino/malloc.c.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/avr-libc/malloc.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-gcc" -c -g -Os -w -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

arduino/realloc.c.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/avr-libc/realloc.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-gcc" -c -g -Os -w -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '


