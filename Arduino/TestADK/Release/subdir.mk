################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../TestADK.cpp 

CPP_DEPS += \
./TestADK.cpp.d 

LINK_OBJ += \
./TestADK.cpp.o 


# Each subdirectory must supply rules for building sources it contributes
TestADK.cpp.o: ../TestADK.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '


