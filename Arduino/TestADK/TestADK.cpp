
#include <adk.h>

USB usb;
ADK adk(&usb,
		"TeamQraken",				//Manufacturer*
		"Qraken",					//Model*
		"Test Usb Host Shield",		//Description
		"0.2",						//Version*
		"www.bradnicolle.com",		//Website
		"000772536");				//ID
									//*Required to be same inside "$android_proj$/res/xml/accessory_filter.xml"

bool connected;

uint8_t msg[6] = {0,0,0,0,0,0};

//The setup function is called once at startup of the sketch
void setup()
{
	Serial.begin(115200);

	if(usb.Init()==-1){
		Serial.print("Unable to initialise \n");
		while(1);
	}

	connected = false;
	Serial.print("Starting\n");
}

// The loop function is called in an endless loop
void loop()
{
	usb.Task();

	if(adk.isReady()){
		if(!connected){
			connected = true;
			Serial.print("Connected to accessory\n");
		}

		uint16_t len = sizeof(msg);
		adk.RcvData(&len,msg);
		if(len>0){

			switch(msg[0]) {
			case 0:
				Serial.print("Throttle: ");
				break;
			case 1:
				Serial.print("Yaw: ");
				break;
			case 2:
				Serial.print("Pitch: ");
				break;
			case 3:
				Serial.print("Roll: ");
				break;
			}

			uint32_t *data  = (uint32_t*)(msg+2);
			Serial.print("Decoded data: ");
			Serial.print(*data);
			Serial.print(" Received data: ");
			Serial.print(msg[0]);
			Serial.print(msg[1]);
			Serial.print("\t");
			Serial.print((int)msg[2]);
			Serial.print("\t");
			Serial.print((int)msg[3]);
			Serial.print("\t");
			Serial.print((int)msg[4]);
			Serial.print("\t");
			Serial.println((int)msg[5]);
		}else{

		}

	}else{
		if(connected){
			connected = false;
			Serial.print("Disconnected from accessory\n");
		}
	}

}
