package com.teamqraken.qrakenremote;

public class QnConnectionService {
	QnDevice mDevice;
	
	
	QnConnectionService(QnDevice device) {
		mDevice = device;
	}
	
	void setThrottle(int value) {
		String strSend = "T" + value;
		byte[] send = strSend.getBytes();
		mDevice.write(send);
	}
	
	void setP(int value) {
		String strSend = "P" + value;
		byte[] send = strSend.getBytes();
		mDevice.write(send);
	}
	
}
