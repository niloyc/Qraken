// Only modify this file to include
// - function definitions (prototypes)
// - include files
// - extern variable definitions
// In the appropriate section

#ifndef _TestSensors_H_
#define _TestSensors_H_
#include "Arduino.h"
//add your includes for the project TestSensors here

#include <ADXL345.h>
#include <bma180.h>
#include <HMC58X3.h>
#include <ITG3200.h>
#include <MS561101BA.h>
#include <I2Cdev.h>
#include <MPU60X0.h>
#include <EEPROM.h>

#include <CommunicationUtils.h>
#include <FreeIMU.h>
#include <Wire.h>
#include <SPI.h>
#include <PID_v1.h>
#include <Servo.h>


//end of add your includes here
#ifdef __cplusplus
extern "C" {
#endif
void loop();
void setup();
#ifdef __cplusplus
} // extern "C"
#endif

//add your function definitions for the project TestSensors here




//Do not add code below this line
#endif /* _TestSensors_H_ */
