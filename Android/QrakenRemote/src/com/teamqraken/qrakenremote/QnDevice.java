package com.teamqraken.qrakenremote;

public interface QnDevice {
    public static final int STATE_NONE = 0;       // we're doing nothing
    public static final int STATE_CONNECTING = 1; // now initiating an outgoing connection
    public static final int STATE_CONNECTED = 2;  // now connected to a remote device
    
    public static final int MESSAGE_STATE_CHANGE = 1;
    public static final int MESSAGE_READ = 2;
    public static final int MESSAGE_WRITE = 3;
    public static final int MESSAGE_DEVICE_NAME = 4;
    public static final int MESSAGE_TOAST = 5;
    
	public static final String TOAST = "toast";
	public static final String DEVICE_NAME = "device_name";
    
	public void connect(QnDeviceData data);
	public void write(byte[] out);
	public void stop();
	
	public String getName();
	public String getType();
}
