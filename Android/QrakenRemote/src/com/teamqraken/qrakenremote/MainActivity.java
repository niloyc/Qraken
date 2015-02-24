package com.teamqraken.qrakenremote;

import java.nio.ByteBuffer;
import java.util.Map;

import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.app.ActionBar;
import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.content.Intent;
import android.content.SharedPreferences;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.SeekBar.OnSeekBarChangeListener;

public class MainActivity extends Activity implements OnSeekBarChangeListener {
	private SharedPreferences settings;
	
	private QnDevice mConnection;
	private SeekBar throttle;
	
	private String mConnectedDeviceName = null;
	private final int BLUETOOTH_CONNECT = 1;
	private final int REQUEST_ENABLE_BT = 2;
	private final int PID_TUNING = 3;
	
	private final int NUM_PID_PREFS = 3;
	private final String[] PITCH_ROLL_PREF_NAMES = {"RP", "RI", "RD"};
	private float[] pitchRollCoeffs = new float[NUM_PID_PREFS];
	private final String[] YAW_PREF_NAMES = {"YP", "YI", "YD"};
	private float[] yawCoeffs = new float[NUM_PID_PREFS];

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		setStatus(R.string.title_not_connected);
		
		throttle = (SeekBar) findViewById(R.id.throttle);
		throttle.setOnSeekBarChangeListener(this);
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
        case R.id.bt_connect:
            // Launch the DeviceListActivity to see devices and do scan
        	if (!BluetoothAdapter.getDefaultAdapter().isEnabled()) {
        		Intent enableIntent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
                startActivityForResult(enableIntent, REQUEST_ENABLE_BT);
        	}
        	else {
            	setupBluetooth();
        	}
            return true;
        case R.id.net_connect:
        	Toast.makeText(getApplicationContext(), "Internet connectivity not yet implemented.", Toast.LENGTH_SHORT).show();
        	return true;
        case R.id.wifi_connect:
        	Toast.makeText(getApplicationContext(), "WiFi connectivity not yet implemented.", Toast.LENGTH_SHORT).show();
        	return true;
        case R.id.pid_tuning:
        	// Kill throttle so that new PID settings don't make quad go haywire
        	killThrottle();
        	Intent pidIntent = new Intent(this, PIDActivity.class);
        	startActivityForResult(pidIntent, PID_TUNING);
        	return true;
        }
        return false;
    }
    
    private void setupBluetooth() {
		Intent scanIntent = new Intent(getApplicationContext(), QnDeviceList.class);
        startActivityForResult(scanIntent, BLUETOOTH_CONNECT);
    }
    
    private void connectBluetooth(Intent data) {
    	if (mConnection != null) {
    		mConnection.stop();
    		mConnection = null;
    	}
        mConnection = new QnBluetooth(mHandler);
        String address = data.getExtras().getString(QnDeviceList.EXTRA_DEVICE_ADDRESS);
        mConnection.connect(new QnDeviceData("ASD", "BT", address));
    }
	
    private final void setStatus(CharSequence subTitle) {
        final ActionBar actionBar = getActionBar();
        actionBar.setSubtitle(subTitle);
    }
    
    private final void setStatus(int resId) {
        final ActionBar actionBar = getActionBar();
        actionBar.setSubtitle(resId);
    }
    
    private void enableControls(boolean enable) {
    	if (enable) {
    		findViewById(R.id.not_connected_layout).setVisibility(View.GONE);
    		throttle.setProgress(0);
    		findViewById(R.id.throttle).setVisibility(View.VISIBLE);
    	}
    	else {
    		findViewById(R.id.not_connected_layout).setVisibility(View.VISIBLE);
    		throttle.setProgress(0);
    		findViewById(R.id.throttle).setVisibility(View.GONE);
    	}
    }
    
    private void sendSettingsData() {
    	// Load settings, in case they have changed
		settings = getSharedPreferences(PIDActivity.PREFS_NAME, MODE_PRIVATE);
		Map<String, ?> settingsMap;
		try {
			settingsMap = (Map<String, ?>)settings.getAll();
			
			for (int i = 0; i < NUM_PID_PREFS; i++) {
				pitchRollCoeffs[i] = (Float)settingsMap.get(PITCH_ROLL_PREF_NAMES[i]);
				yawCoeffs[i] = (Float)settingsMap.get(YAW_PREF_NAMES[i]);
			}

		} catch (NullPointerException npe) {Log.d("QrakenRemote", "Failed to load SharedPreferences");}
		
		// And send
		if (mConnection != null) {
			for (int i = 0; i < NUM_PID_PREFS; i++) {
				String name = PITCH_ROLL_PREF_NAMES[i];
				String data = Float.toString(pitchRollCoeffs[i]);
				String toSend = name + data;
				Log.d("BTSEND", toSend);
				writeMessage(toSend);
				
				name = YAW_PREF_NAMES[i];
				data = Float.toString(yawCoeffs[i]);
				toSend = name + data;
				Log.d("BTSEND", toSend);
				writeMessage(toSend);
			}
		}
    }
    
    private void writeMessage(String message){
    	message += ',';
    	mConnection.write(message.getBytes());
    }

    public static byte [] float2ByteArray (float value) {  
         return ByteBuffer.allocate(4).putFloat(value).array();
    }
	
    private final Handler mHandler = new Handler() {
        @Override
        public void handleMessage(Message msg) {
            switch (msg.what) {
            case QnDevice.MESSAGE_STATE_CHANGE:
                switch (msg.arg1) {
                case QnDevice.STATE_CONNECTED:
                	setStatus(getString(R.string.title_connected_to) + " " + mConnectedDeviceName);
                    
                	sendSettingsData();
                    enableControls(true);
                    break;
                case QnDevice.STATE_CONNECTING:
                    setStatus(R.string.title_connecting);
                    break;
                case QnDevice.STATE_NONE:
                    setStatus(R.string.title_not_connected);
                    enableControls(false);
                    break;
                }
                break;
            case QnDevice.MESSAGE_READ:
                //byte[] readBuf = (byte[]) msg.obj;
                // construct a string from the valid bytes in the buffer
                //String readMessage = new String(readBuf, 0, msg.arg1);
                break;
            case QnDevice.MESSAGE_DEVICE_NAME:
                // save the connected device's name
                mConnectedDeviceName = msg.getData().getString(QnDevice.DEVICE_NAME);
                Toast.makeText(getApplicationContext(), getString(R.string.title_connected_to)
                               + " " + mConnectedDeviceName, Toast.LENGTH_SHORT).show();
                break;
            case QnDevice.MESSAGE_TOAST:
                Toast.makeText(getApplicationContext(), msg.getData().getString(QnDevice.TOAST),
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
		            setupBluetooth();
		        } else {
		            // User did not enable Bluetooth or an error occurred
		            Toast.makeText(this, R.string.bt_not_enabled, Toast.LENGTH_SHORT).show();
		        }
		        break;
		    case BLUETOOTH_CONNECT:
		    	if (resultCode == Activity.RESULT_OK) {
		    		connectBluetooth(data);
		    	}
		    	break;
		    case PID_TUNING:
		    	if (resultCode == Activity.RESULT_OK) {
		    		sendSettingsData();
			    	Toast.makeText(this, "Settings saved.", Toast.LENGTH_SHORT).show();
		    	}
    	}
    }
    
    public void killThrottle() {
    	throttle.setProgress(0);
		if (mConnection != null) {
			writeMessage("T0");
		}
    }

	@Override
	public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
		
		if (mConnection != null) {
			writeMessage("T" + progress);
		}
	}

	@Override
	public void onStartTrackingTouch(SeekBar seekBar) {}

	@Override
	public void onStopTrackingTouch(SeekBar seekBar) {}
	
	@Override
	protected void onDestroy() {
		super.onDestroy();
		if (mConnection != null) {
			mConnection.stop();
			mConnection = null;
		}
	}

}
