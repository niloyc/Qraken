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
-include Libraries/USB_Host_Shield_20/subdir.mk
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
C:/Users/Niloy/Desktop/ArduinoWorkspace/TestADK/Release/arduino.ar \

ELF += \
TestADK.elf \

EEP += \
TestADK.eep \

FLASH_IMAGE += \
TestADK.hex \


# All Target
all: TestADK

# Tool invocations
TestADK: $(FLASH_IMAGE)
	@echo 'Building target: $@'
	@echo 'Printing size:'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-size" -A "C:/Users/Niloy/Desktop/ArduinoWorkspace/TestADK/Release/TestADK.elf"
	@echo 'Finished building target: $@'
	@echo ' '

C:/Users/Niloy/Desktop/ArduinoWorkspace/TestADK/Release/arduino.ar: $(AR_OBJ)
	@echo 'Starting archiver'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-ar" rcs "C:/Users/Niloy/Desktop/ArduinoWorkspace/TestADK/Release/arduino.ar"   $(AR_OBJ)
	@echo 'Finished building: $@'
	@echo ' '

TestADK.elf: $(LINK_OBJ) $(AR)
	@echo 'Starting combiner'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-gcc" -Os -Wl,--gc-sections -mmcu=atmega328p -o "C:/Users/Niloy/Desktop/ArduinoWorkspace/TestADK/Release/TestADK.elf"   $(LINK_OBJ) $(AR)  "C:/Users/Niloy/Desktop/ArduinoWorkspace/TestADK/Release/arduino.ar" "-LC:/Users/Niloy/Desktop/ArduinoWorkspace/TestADK/Release" -lm
	@echo 'Finished building: $@'
	@echo ' '

TestADK.eep: $(ELF)
	@echo 'Create eeprom image'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-objcopy" -O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load --no-change-warnings --change-section-lma .eeprom=0 "C:/Users/Niloy/Desktop/ArduinoWorkspace/TestADK/Release/TestADK.elf" "C:/Users/Niloy/Desktop/ArduinoWorkspace/TestADK/Release/TestADK.eep"
	@echo 'Finished building: $@'
	@echo ' '

TestADK.hex: $(EEP)
	@echo 'Create Flash image (ihex format)'
	"C:/Users/Niloy/Desktop/Arduino/hardware/tools/avr/bin/avr-objcopy" -O ihex -R .eeprom "C:/Users/Niloy/Desktop/ArduinoWorkspace/TestADK/Release/TestADK.elf" "C:/Users/Niloy/Desktop/ArduinoWorkspace/TestADK/Release/TestADK.hex"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(ELF)$(C++_DEPS)$(AR)$(C_DEPS)$(CC_DEPS)$(FLASH_IMAGE)$(AR_OBJ)$(CPP_DEPS)$(LINK_OBJ)$(EEP)$(CXX_DEPS)$(C_UPPER_DEPS)$(SIZEDUMMY) TestADK
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
