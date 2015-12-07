#include <Wire.h>
#include <HMC58X3.h>
#include <MS561101BA.h>
#include <SPI.h>
#include <I2Cdev.h>
#include <MPU60X0.h>
#include <EEPROM.h>
#include <FreeIMU.h>
#include <PID_v1.h>
#include <Servo.h>
#include <adk.h>

//ADK stuff{
USB usb;
ADK adk(&usb,
    "TeamQraken",     //Manufacturer*
    "Qraken",         //Model*
    "ADK",   //Description
    "0.2",            //Version*
    "Q",    //Website
    "000772536");       //ID
                  //*Required to be same inside "$android_proj$/res/xml/accessory_filter.xml"

bool connected;
uint8_t msg[6] = { 0, 0, 0, 0, 0, 0 };
//}

//FreeIMU stuff{
//For the following 0=Yaw, 1=Pitch, 2=Roll
float angles[3]; //inputs to PID controller
FreeIMU mySensor = FreeIMU();
//}

//PID stuff{
//Inputs, outputs and setpoint
double yIn, pIn, rIn;
double yOut, pOut, rOut;
double ySet, pSet, rSet;
int throttle;

#define SET_YAW_PID 0
#define SET_PITCH_PID 1
#define SET_ROLL_PID 2

//PID (double &input, double &output, double &setpoint, double Kp, double Ki, double Kd, Direction = Direct)
//Direction determines what direction the output will be moving, Direct or reverse.
//Constants can be changed on the fly by using PID.SetTunings(double newKp, double newKi, double newKd);
PID myPID[3] = { PID(&yIn, &yOut, &ySet, 0.0, 0.0, 0.0, DIRECT),
         PID(&pIn, &pOut, &pSet, 0.0, 0.0, 0.0, DIRECT),
         PID(&rIn, &rOut, &rSet, 0.0, 0.0, 0.0, DIRECT) };

void setPID(int ypr, int pid, float value);
//}

//Motor management{
void motorManager();
Servo motors[4];
void killMotors();
//}

void setup() {
  
  Wire.begin();
  delay(5);

  mySensor.init(true);
  
  //setup initial setpoint
  //TODO: Replace with calibration algorithm
  ySet = 0.0;
  pSet = 0.0;
  rSet = 0.0;
  throttle = 0.0;

  //Setup output range of PID
  myPID[0].SetOutputLimits(-50, 50);//half of the throttle range, this will be halved again for each motor pair,
  myPID[1].SetOutputLimits(-100, 100); //left motor + output/2; right motor - output/2
  myPID[2].SetOutputLimits(-100, 100);

  //Set PID sampling time
  myPID[0].SetSampleTime(3);  //PID::SetSampleTime(int milliseconds)
  myPID[1].SetSampleTime(3);
  myPID[2].SetSampleTime(3);

  //start PID controller
  myPID[0].SetMode(AUTOMATIC);
  myPID[1].SetMode(AUTOMATIC);
  myPID[2].SetMode(AUTOMATIC);

  //attach motors to pins
  motors[0].attach(2); //pair 1
  motors[1].attach(3);
  motors[2].attach(5); //pair 1
  motors[3].attach(6);

  motors[0].writeMicroseconds(1060);
  motors[1].writeMicroseconds(1060);
  motors[2].writeMicroseconds(1060);
  motors[3].writeMicroseconds(1060);

  if (usb.Init() == -1) {
    while (1);
  }

  connected = false;
  delay(2000);
}

void loop() {

  usb.Task();
  if (adk.isReady()) {
    if (!connected) {
      connected = true;
    }

    uint16_t len = sizeof(msg);
    adk.RcvData(&len, msg);
    if (len > 0) {

      uint32_t *temp = (uint32_t*) (msg + 2);
      double data = (double) *temp / 1000.0;
      switch (msg[0]) {
      case 0:
        throttle = (int) data;
        throttle = (throttle > 800) ? 800 :
              (throttle < 0) ? 0 : throttle;
        break;
      case 1:
        setPID(SET_YAW_PID,msg[1],data);
        break;
      case 2:
        setPID(SET_PITCH_PID, msg[1], data);
        setPID(SET_ROLL_PID, msg[1], data);
        break;
      }
    }
  } else {
    if (connected) {
      connected = false;
      killMotors();
    }
  }
  //observe position, set input
  mySensor.getYawPitchRoll(angles);

  //TODO: Add yaw correction algorithm
  yIn = (double) angles[0];
  pIn = (double) angles[1];
  rIn = (double) angles[2];

  //Compute PID outputs
  for (int i = 0; i < 3; i++)
    myPID[i].Compute();

  //manage motors
  motorManager();
}

void motorManager() {

  motors[0].writeMicroseconds(
      (int) (1060 + throttle + ((-yOut / 2) + pOut) / 2));
  motors[1].writeMicroseconds(
      (int) (1060 + throttle + ((yOut / 2) - rOut) / 2));
  motors[2].writeMicroseconds(
      (int) (1060 + throttle + ((-yOut / 2) - pOut) / 2));
  motors[3].writeMicroseconds(
      (int) (1060 + throttle + ((yOut / 2) + rOut) / 2));
}

void setPID(int ypr, int pid, double value) {
  switch (pid) {
  case 0:
    myPID[ypr].SetTunings(value, myPID[ypr].GetKp(), myPID[ypr].GetKd());
    break;
  case 1:
    myPID[ypr].SetTunings(myPID[ypr].GetKi(), value, myPID[ypr].GetKd());
    break;
  case 2:
    myPID[ypr].SetTunings(myPID[ypr].GetKi(), myPID[ypr].GetKp(), value);
    break;
  }
}

void killMotors(){
  noInterrupts();
  for(int i=0;i<4;i++){
    motors[i].writeMicroseconds(1060);
  }
  while(1);
}

