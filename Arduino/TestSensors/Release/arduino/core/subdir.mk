################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/CDC.cpp \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/HID.cpp \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/HardwareSerial.cpp \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/HardwareSerial0.cpp \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/HardwareSerial1.cpp \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/HardwareSerial2.cpp \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/HardwareSerial3.cpp \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/IPAddress.cpp \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/Print.cpp \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/Stream.cpp \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/Tone.cpp \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/USBCore.cpp \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/WMath.cpp \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/WString.cpp \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/main.cpp \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/new.cpp 

C_SRCS += \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/WInterrupts.c \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/hooks.c \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/wiring.c \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/wiring_analog.c \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/wiring_digital.c \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/wiring_pulse.c \
C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/wiring_shift.c 

C_DEPS += \
./arduino/WInterrupts.c.d \
./arduino/hooks.c.d \
./arduino/wiring.c.d \
./arduino/wiring_analog.c.d \
./arduino/wiring_digital.c.d \
./arduino/wiring_pulse.c.d \
./arduino/wiring_shift.c.d 

AR_OBJ += \
./arduino/CDC.cpp.o \
./arduino/HID.cpp.o \
./arduino/HardwareSerial.cpp.o \
./arduino/HardwareSerial0.cpp.o \
./arduino/HardwareSerial1.cpp.o \
./arduino/HardwareSerial2.cpp.o \
./arduino/HardwareSerial3.cpp.o \
./arduino/IPAddress.cpp.o \
./arduino/Print.cpp.o \
./arduino/Stream.cpp.o \
./arduino/Tone.cpp.o \
./arduino/USBCore.cpp.o \
./arduino/WInterrupts.c.o \
./arduino/WMath.cpp.o \
./arduino/WString.cpp.o \
./arduino/hooks.c.o \
./arduino/main.cpp.o \
./arduino/new.cpp.o \
./arduino/wiring.c.o \
./arduino/wiring_analog.c.o \
./arduino/wiring_digital.c.o \
./arduino/wiring_pulse.c.o \
./arduino/wiring_shift.c.o 

CPP_DEPS += \
./arduino/CDC.cpp.d \
./arduino/HID.cpp.d \
./arduino/HardwareSerial.cpp.d \
./arduino/HardwareSerial0.cpp.d \
./arduino/HardwareSerial1.cpp.d \
./arduino/HardwareSerial2.cpp.d \
./arduino/HardwareSerial3.cpp.d \
./arduino/IPAddress.cpp.d \
./arduino/Print.cpp.d \
./arduino/Stream.cpp.d \
./arduino/Tone.cpp.d \
./arduino/USBCore.cpp.d \
./arduino/WMath.cpp.d \
./arduino/WString.cpp.d \
./arduino/main.cpp.d \
./arduino/new.cpp.d 


# Each subdirectory must supply rules for building sources it contributes
arduino/CDC.cpp.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/CDC.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

arduino/HID.cpp.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/HID.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

arduino/HardwareSerial.cpp.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/HardwareSerial.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

arduino/HardwareSerial0.cpp.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/HardwareSerial0.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

arduino/HardwareSerial1.cpp.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/HardwareSerial1.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

arduino/HardwareSerial2.cpp.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/HardwareSerial2.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

arduino/HardwareSerial3.cpp.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/HardwareSerial3.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

arduino/IPAddress.cpp.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/IPAddress.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

arduino/Print.cpp.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/Print.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

arduino/Stream.cpp.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/Stream.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

arduino/Tone.cpp.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/Tone.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

arduino/USBCore.cpp.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/USBCore.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

arduino/WInterrupts.c.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/WInterrupts.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-gcc" -c -g -Os -w -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

arduino/WMath.cpp.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/WMath.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

arduino/WString.cpp.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/WString.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

arduino/hooks.c.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/hooks.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-gcc" -c -g -Os -w -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

arduino/main.cpp.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/main.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

arduino/new.cpp.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/new.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

arduino/wiring.c.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/wiring.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-gcc" -c -g -Os -w -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

arduino/wiring_analog.c.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/wiring_analog.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-gcc" -c -g -Os -w -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

arduino/wiring_digital.c.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/wiring_digital.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-gcc" -c -g -Os -w -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

arduino/wiring_pulse.c.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/wiring_pulse.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-gcc" -c -g -Os -w -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

arduino/wiring_shift.c.o: C:/Users/Niloy/Desktop/Arduino/hardware/arduino/avr/cores/arduino/wiring_shift.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-gcc" -c -g -Os -w -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=156-r2 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR    -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\cores\arduino" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\variants\standard" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo" -I"C:\Users\Niloy\Desktop\Arduino\libraries\Servo\src" -I"C:\Users\Niloy\Documents\Arduino\libraries\adxl345driver" -I"C:\Users\Niloy\Documents\Arduino\libraries\bma180" -I"C:\Users\Niloy\Documents\Arduino\libraries\FreeIMU" -I"C:\Users\Niloy\Documents\Arduino\libraries\I2Cdev" -I"C:\Users\Niloy\Documents\Arduino\libraries\MPU60X0" -I"C:\Users\Niloy\Documents\Arduino\libraries\MS561101BA" -I"C:\Users\Niloy\Documents\Arduino\libraries\PID_v1" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\EEPROM" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\Wire\utility" -I"C:\Users\Niloy\Documents\Arduino\libraries\HMC58X3" -I"C:\Users\Niloy\Documents\Arduino\libraries\itg3200filv05" -I"C:\Users\Niloy\Desktop\Arduino\hardware\arduino\avr\libraries\SPI" -I"C:\Users\Niloy\Documents\Arduino\libraries\DebugUtils" -I"C:\Users\Niloy\Documents\Arduino\libraries\USB_Host_Shield_20" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '


