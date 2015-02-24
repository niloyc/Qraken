package com.teamqraken.onqraken;

import android.app.ActionBar;
import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.content.Context;
import android.content.Intent;
import android.hardware.usb.UsbManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.WindowManager;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends Activity {
	QnServer mServer;
	UsbManager mUsbManager;
	UsbConnection mUsbConnection;
	TextView throttle;
	String mConnectedDeviceName;

	final static int REQUEST_ENABLE_BT = 1;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		// Cleaner than a WakeLock, this will keep the device on while the
		// activity is in the foreground
		getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);

		throttle = (TextView) findViewById(R.id.throttle);

		setStatus(R.string.title_not_connected);

		enableBluetooth();
		mUsbManager = (UsbManager) getSystemService(Context.USB_SERVICE);
		mUsbConnection = new UsbConnection(mUsbManager, this);
	}

	@Override
	protected void onResume() {
		super.onResume();
		mUsbConnection.open();
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case R.id.enable_discovery:
			// Start system intent to enable Bluetooth discovery
			if (!QnBluetoothServer.enableDiscovery(this)) {
				Toast.makeText(getApplicationContext(), "Already discoverable",
						Toast.LENGTH_SHORT).show();
			}
			return true;
		}
		return false;
	}

	private void enableControls(boolean enable) {
		if (enable) {
			findViewById(R.id.not_connected_layout).setVisibility(View.GONE);
			findViewById(R.id.throttle).setVisibility(View.VISIBLE);
		} else {
			findViewById(R.id.not_connected_layout).setVisibility(View.VISIBLE);
			findViewById(R.id.throttle).setVisibility(View.GONE);
		}
	}

	private void enableBluetooth() {
		if (!BluetoothAdapter.getDefaultAdapter().isEnabled()) {
			Intent enableIntent = new Intent(
					BluetoothAdapter.ACTION_REQUEST_ENABLE);
			startActivityForResult(enableIntent, REQUEST_ENABLE_BT);
		} else {
			mServer = new QnBluetoothServer(mHandler);
			mServer.listen();
		}
	}

	private final void setStatus(CharSequence subTitle) {
		final ActionBar actionBar = getActionBar();
		actionBar.setSubtitle(subTitle);
	}

	private final void setStatus(int resId) {
		final ActionBar actionBar = getActionBar();
		actionBar.setSubtitle(resId);
	}

	private final Handler mHandler = new Handler() {
		@Override
		public void handleMessage(Message msg) {
			switch (msg.what) {
			case QnServer.MESSAGE_STATE_CHANGE:
				switch (msg.arg1) {
				case QnServer.STATE_CONNECTED:
					setStatus(getString(R.string.title_connected_to) + " "
							+ mConnectedDeviceName);
					enableControls(true);
					break;
				case QnServer.STATE_CONNECTING:
					setStatus(R.string.title_connecting);
					break;
				case QnServer.STATE_NONE:
					setStatus(R.string.title_not_connected);
					enableControls(false);
					mUsbConnection.setvalue(UsbConnection.SET_THROTTLE, 0, 0);
					mUsbConnection.setvalue(UsbConnection.SET_THROTTLE, 0, 0);
					break;
				}
				break;
			case QnServer.MESSAGE_READ:
				byte[] readBuf = (byte[]) msg.obj;
				// construct a string from the valid bytes in the buffer
				String readMessage = new String(readBuf, 0, msg.arg1);
				Log.e("Recieved",readMessage);
				recievedMessages(readMessage);
				break;
			case QnServer.MESSAGE_DEVICE_NAME:
				// save the connected device's name
				mConnectedDeviceName = msg.getData().getString(
						QnServer.DEVICE_NAME);
				Toast.makeText(
						getApplicationContext(),
						getString(R.string.title_connected_to) + " "
								+ mConnectedDeviceName, Toast.LENGTH_SHORT)
						.show();
				break;
			case QnServer.MESSAGE_TOAST:
				Toast.makeText(getApplicationContext(),
						msg.getData().getString(QnServer.TOAST),
						Toast.LENGTH_SHORT).show();
				break;
			}
		}
	};

	public void onActivityResult(int requestCode, int resultCode, Intent data) {
		switch (requestCode) {
		case REQUEST_ENABLE_BT:
			// When the request to enable Bluetooth returns
			if (resultCode == Activity.RESULT_OK) {
				// Bluetooth is now enabled, so set up the connection
				enableBluetooth();
			} else {
				// User did not enable Bluetooth or an error occurred
				Toast.makeText(this, R.string.bt_not_enabled,
						Toast.LENGTH_SHORT).show();
				finish();
			}
		}
	}

	private void recievedMessages(String msg) {
		String[] message = msg.split(",");
		throttle.setText("");
		for (int i = 0; i < message.length; i++) {
			
			if(message[i].length()<2)
				break;
			
			int flag1 = -1, flag2 = -1;
			char rFlag1 = message[i].charAt(0);
			char rFlag2 = message[i].charAt(1);
			double value = -1;

			if (rFlag1 == 'T') { // THROTTLE, everything from position 1 is data
				flag1 = UsbConnection.SET_THROTTLE;
				try {
					value = (double) Integer.parseInt(message[i].substring(1));
				} catch (NumberFormatException n) {
					n.printStackTrace();
				}
			} else if (rFlag1 == 'R' || rFlag1 == 'P') { // PID values, position
															// 1
															// is FLAG2, rest is
															// data
				flag1 = UsbConnection.SET_PITCH_ROLL;
				flag2 = (rFlag2 == 'P') ? UsbConnection.SET_P
						: (rFlag2 == 'I') ? UsbConnection.SET_I
								: (rFlag2 == 'D') ? UsbConnection.SET_D : -1;
				try {
					value = (double) Float.parseFloat(message[i].substring(2));
				} catch (NumberFormatException n) {
					n.printStackTrace();
				}
			} else if (rFlag1 == 'Y') {
				flag1 = UsbConnection.SET_YAW;
				flag2 = (rFlag2 == 'P') ? UsbConnection.SET_P
						: (rFlag2 == 'I') ? UsbConnection.SET_I
								: (rFlag2 == 'D') ? UsbConnection.SET_D : -1;
				try {
					value = (double) Float.parseFloat(message[i].substring(2));
				} catch (NumberFormatException n) {
					n.printStackTrace();
				}
			}
			
			mUsbConnection.setvalue(flag1, flag2, value);
			throttle.append(""+flag1+flag2+value);
			Log.e("Split",message[i]);
		}
	}

	@Override
	protected void onDestroy() {
		super.onDestroy();
		if (mServer != null) {
			mServer.stop();
			mServer = null;
		}

		if (mUsbConnection != null) {
			mUsbConnection.close();
			mUsbConnection = null;
		}
	}

}
