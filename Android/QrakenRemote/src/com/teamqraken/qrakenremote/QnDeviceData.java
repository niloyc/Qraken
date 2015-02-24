package com.teamqraken.qrakenremote;

import java.io.Serializable;

public class QnDeviceData implements Serializable {
	private static final long serialVersionUID = 2135354381049261433L;

	public enum DeviceType {BLUETOOTH, LAN, INTERNET};
	
	public String name;
	public String type;
	public String address;
	
	QnDeviceData(String name, String type, String address) {
		this.name = name;
		this.type = type;
		this.address = address;
	}
}
