################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir.mk
-include arduino/core/avr-libc/subdir.mk
-include arduino/core/subdir.mk
-include Libraries/itg3200filv05/subdir.mk
-include Libraries/bma180/subdir.mk
-include Libraries/adxl345driver/subdir.mk
-include Libraries/Wire/utility/subdir.mk
-include Libraries/Wire/subdir.mk
-include Libraries/USB_Host_Shield_20/subdir.mk
-include Libraries/Servo/src/sam/subdir.mk
-include Libraries/Servo/src/avr/subdir.mk
-include Libraries/SPI/subdir.mk
-include Libraries/PID_v1/subdir.mk
-include Libraries/MS561101BA/subdir.mk
-include Libraries/MPU60X0/subdir.mk
-include Libraries/I2Cdev/subdir.mk
-include Libraries/HMC58X3/subdir.mk
-include Libraries/FreeIMU/subdir.mk
-include Libraries/EEPROM/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
AR += \
C:/Users/Niloy/Desktop/ArduinoWorkspace/TestSensors/Release/arduino.ar \

ELF += \
TestSensors.elf \

EEP += \
TestSensors.eep \

FLASH_IMAGE += \
TestSensors.hex \


# All Target
all: TestSensors

# Tool invocations
TestSensors: $(FLASH_IMAGE)
	@echo 'Building target: $@'
	@echo 'Printing size:'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-size" -A "C:/Users/Niloy/Desktop/ArduinoWorkspace/TestSensors/Release/TestSensors.elf"
	@echo 'Finished building target: $@'
	@echo ' '

C:/Users/Niloy/Desktop/ArduinoWorkspace/TestSensors/Release/arduino.ar: $(AR_OBJ)
	@echo 'Starting archiver'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-ar" rcs "C:/Users/Niloy/Desktop/ArduinoWorkspace/TestSensors/Release/arduino.ar"   $(AR_OBJ)
	@echo 'Finished building: $@'
	@echo ' '

TestSensors.elf: $(LINK_OBJ) $(AR)
	@echo 'Starting combiner'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-gcc" -Os -Wl,--gc-sections -mmcu=atmega328p -o "C:/Users/Niloy/Desktop/ArduinoWorkspace/TestSensors/Release/TestSensors.elf"   $(LINK_OBJ) $(AR)  "C:/Users/Niloy/Desktop/ArduinoWorkspace/TestSensors/Release/arduino.ar" "-LC:/Users/Niloy/Desktop/ArduinoWorkspace/TestSensors/Release" -lm
	@echo 'Finished building: $@'
	@echo ' '

TestSensors.eep: $(ELF)
	@echo 'Create eeprom image'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-objcopy" -O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load --no-change-warnings --change-section-lma .eeprom=0 "C:/Users/Niloy/Desktop/ArduinoWorkspace/TestSensors/Release/TestSensors.elf" "C:/Users/Niloy/Desktop/ArduinoWorkspace/TestSensors/Release/TestSensors.eep"
	@echo 'Finished building: $@'
	@echo ' '

TestSensors.hex: $(EEP)
	@echo 'Create Flash image (ihex format)'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-objcopy" -O ihex -R .eeprom "C:/Users/Niloy/Desktop/ArduinoWorkspace/TestSensors/Release/TestSensors.elf" "C:/Users/Niloy/Desktop/ArduinoWorkspace/TestSensors/Release/TestSensors.hex"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(ELF)$(C++_DEPS)$(AR)$(C_DEPS)$(CC_DEPS)$(FLASH_IMAGE)$(AR_OBJ)$(CPP_DEPS)$(LINK_OBJ)$(EEP)$(CXX_DEPS)$(C_UPPER_DEPS)$(SIZEDUMMY) TestSensors
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
