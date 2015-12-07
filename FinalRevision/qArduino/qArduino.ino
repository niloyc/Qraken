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
#include <adk.h>

//ADK stuff{
USB usb;
ADK adk(&usb,
    "TeamQraken",     //Manufacturer*
    "Qraken",         //Model*
    "Test Usb Host Shield",   //Description
    "0.2",            //Version*
    "www.bradnicolle.com",    //Website
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

void setPID(int ypr, int pid, double value);
//}

//Motor management{
void motorManager();
Servo motorOne, motorTwo, motorThree, motorFour;
void killMotors();
void zeroMotors();
//}

// Debug/Test variables/functions
long prevTime;

void setup() {

  Serial.begin(115200);
  Wire.begin();
  delay(5);

  mySensor.init(true);
  Serial.println("Initialised sensor");

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
  Serial.println("Initialised PID");

  //attach motors to pins
  motorOne.attach(2); //pair 1
  motorTwo.attach(3);
  motorThree.attach(5); //pair 1
  motorFour.attach(6);

  zeroMotors();

  if (usb.Init() == -1) {
    Serial.print("Unable to initialise \n");
    while (1)
      ;
  }

  connected = false;

  delay(2000);
  Serial.setTimeout(10); //for faster input reading from serial
  Serial.println("Starting....");

  //Debugging
  prevTime = millis();
}

void loop() {

  usb.Task();
  if (adk.isReady()) {
    if (!connected) {
      connected = true;
      Serial.print("Connected to accessory\n");
    }

    uint16_t len = sizeof(msg);
    adk.RcvData(&len, msg);
    if (len > 0) {

      uint32_t *temp = (uint32_t*) (msg + 2);
      double data = (double) *temp / 1000.0;
      switch (msg[0]) {
      case 0:
        Serial.print("Throttle: ");
        throttle = (int) data;
        throttle = (throttle > 800) ? 800 :
              (throttle < 0) ? 0 : throttle;
        break;
      case 1:
        setPID(SET_YAW_PID,msg[1],data);
        Serial.print("Yaw: ");
        break;
      case 2:
        setPID(SET_PITCH_PID, msg[1], data);
        setPID(SET_ROLL_PID, msg[1], data);
        Serial.print("PitchRoll: ");
        break;
      }
      Serial.println(data);
    } else {

    }

  } else {
    if (connected) {
      connected = false;
      Serial.print("Disconnected from accessory\n");
      killMotors();
    }
  }

  if(Serial.available()>0){
    throttle = Serial.readString().toInt();
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

//  if(throttle<=10){
//    zeroMotors();
//    return;
//  }


  motorOne.writeMicroseconds(
      (int) (1060 + throttle + ((-yOut / 2) + pOut) / 2));
  motorTwo.writeMicroseconds(
      (int) (1060 + throttle + ((yOut / 2) - rOut) / 2));
  motorThree.writeMicroseconds(
      (int) (1060 + throttle + ((-yOut / 2) - pOut) / 2));
  motorFour.writeMicroseconds(
      (int) (1060 + throttle + ((yOut / 2) + rOut) / 2));

  if(millis()-prevTime>1000){
    prevTime=millis();
    Serial.print("Yaw: ");
    Serial.print(angles[0]);
    Serial.print("\tPitch: ");
    Serial.print(angles[1]);
    Serial.print("\tRoll: ");
    Serial.print(angles[2]);

    Serial.print("\nMotor1: ");
    Serial.print(motorOne.readMicroseconds());
    Serial.print("\tMotor2: ");
    Serial.print(motorTwo.readMicroseconds());
    Serial.print("\tMotor3: ");
    Serial.print(motorThree.readMicroseconds());
    Serial.print("\tMotor4: ");
    Serial.println(motorFour.readMicroseconds());
  }

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

void zeroMotors(){
  motorOne.writeMicroseconds(1060);
  motorTwo.writeMicroseconds(1060);
  motorThree.writeMicroseconds(1060);
  motorFour.writeMicroseconds(1060);
}

void killMotors(){
  noInterrupts();
  motorOne.writeMicroseconds(1060);
  motorTwo.writeMicroseconds(1060);
  motorThree.writeMicroseconds(1060);
  motorFour.writeMicroseconds(1060);
  while(1);
}

