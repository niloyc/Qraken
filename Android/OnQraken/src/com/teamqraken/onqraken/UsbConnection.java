package com.teamqraken.onqraken;

import java.io.FileDescriptor;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.hardware.usb.UsbAccessory;
import android.hardware.usb.UsbManager;
import android.os.ParcelFileDescriptor;
import android.util.Log;

public class UsbConnection {
	private static final String TAG = "USB_CONNECTION";
	
	private UsbManager mUsbManager;
	private Activity mActivity;
	private static final String ACTION_USB_PERMISSION = "com.qraken.onqraken.USB_PERMISSION";

	private UsbAccessory mAccessory;
	private IntentFilter filter;
	private ParcelFileDescriptor mFileDescriptor;
	private FileInputStream mInputStream; //TODO: Add input handler for batter charge and other info
	private FileOutputStream mOutputStream;
	private boolean run;
	private Thread connectionThread;
	private double mThrottle;
	private double[] yPID = { 0, 0, 0 };
	private double[] prPID = { 0, 0, 0 };
	
	private boolean sendData;
	private byte[] data = {0,0,0,0,0,0};
	
	public static final int SET_THROTTLE = 0;
	public static final int SET_YAW = 1;
	public static final int SET_PITCH_ROLL = 2;
	
	public static final int SET_P = 0;
	public static final int SET_I = 1;
	public static final int SET_D = 2;

	public void setvalue(int flag1, int flag2, double value) {
		switch (flag1) {
		case SET_THROTTLE:
			if(value<0)
			mThrottle = value;
			sendData = true;
			break;
		case SET_YAW:
			if(flag2<0 || flag2>2)
				return;
			yPID[flag2] = value;
			sendData = true;
			break;
		case SET_PITCH_ROLL:
			if(flag2<0 || flag2>2)
				return;
			prPID[flag2] = value;
			sendData = true;
			break;

		}
		
		if(sendData){
			data[0] = (byte)flag1;
			data[1] = (byte)flag2;
			int temp = (int)(value * 1000);
			
			//NOTE: Data needs to be sent in reverse order
			data[5] = (byte) ((temp >> 24) & 0xFF);
			data[4] = (byte) ((temp >> 16) & 0xFF);
			data[3] = (byte) ((temp >> 8) & 0xFF);
			data[2] = (byte) (temp & 0xFF);
		}
	}

	private final BroadcastReceiver mUsbReceiver = new BroadcastReceiver() {
		@Override
		public void onReceive(Context context, Intent intent) {
			String action = intent.getAction();
			if (ACTION_USB_PERMISSION.equals(action)) {
				synchronized (this) {
					UsbAccessory accessory = (UsbAccessory) intent
							.getParcelableExtra(UsbManager.EXTRA_ACCESSORY);
					if (intent.getBooleanExtra(
							UsbManager.EXTRA_PERMISSION_GRANTED, false)) {
						openAccessory(accessory);
					}
				}
			} else if (UsbManager.ACTION_USB_ACCESSORY_DETACHED.equals(action)) {
				UsbAccessory accessory = (UsbAccessory) intent
						.getParcelableExtra(UsbManager.EXTRA_ACCESSORY);
				if (accessory != null && accessory.equals(mAccessory)) {
					closeAccessory();
				}
			}
		}
	};

	public UsbConnection(UsbManager usbmanager, Activity activity) {
		mUsbManager = usbmanager;
		mActivity = activity;
		filter = new IntentFilter(ACTION_USB_PERMISSION);
		filter.addAction(UsbManager.ACTION_USB_ACCESSORY_DETACHED);
		mActivity.registerReceiver(mUsbReceiver, filter);
		connectionThread = new Thread(new Runnable() {

			@Override
			public void run() {
				while (run) {
					if (mFileDescriptor != null && sendData) {
						try {
							mOutputStream.write(data);
							sendData = false;
						} catch (IOException e) {
							Log.e(TAG, "Write Failed", e);
						}
					}

				}
			}
		});
	}

	public void open() {
		UsbAccessory[] accessories = mUsbManager.getAccessoryList();
		UsbAccessory accessory = (accessories == null ? null : accessories[0]);
		if (accessory != null) {
			if (mUsbManager.hasPermission(accessory)) {
				openAccessory(accessory);
				run = true;
				if (!connectionThread.isAlive())
					connectionThread.start();
			}
		}
	}

	public void close() {
		run = false;
		try {
			connectionThread.join();
		} catch (InterruptedException e) {

		}
		mActivity.unregisterReceiver(mUsbReceiver);
		closeAccessory();
	}

	private void openAccessory(UsbAccessory accessory) {
		mFileDescriptor = mUsbManager.openAccessory(accessory);
		if (mFileDescriptor != null) {
			mAccessory = accessory;
			FileDescriptor fd = mFileDescriptor.getFileDescriptor();
			mInputStream = new FileInputStream(fd);
			mOutputStream = new FileOutputStream(fd);
		}
	}

	private void closeAccessory() {
		try {
			if (mFileDescriptor != null) {
				mFileDescriptor.close();
			}
		} catch (IOException e) {

		} finally {
			mFileDescriptor = null;
			mAccessory = null;
		}
	}
}
