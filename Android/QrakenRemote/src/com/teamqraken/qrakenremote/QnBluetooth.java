package com.teamqraken.qrakenremote;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;

public class QnBluetooth implements QnDevice {
	private static final UUID myUUID = UUID.fromString("0e2681a0-867f-11e3-baa7-0800200c9a66");
	private final BluetoothAdapter mAdapter;
	private BluetoothDevice device;
	private final Handler mHandler;
	private ConnectThread mConnectThread;
	private ConnectedThread mConnectedThread;
	
	private int mState;
	
	private String mName;
	
	public QnBluetooth(Handler handler) {
		mAdapter = BluetoothAdapter.getDefaultAdapter();
		mHandler = handler;
	}
	
    private synchronized void setState(int state) {
        mState = state;

        // Give the new state to the Handler so the UI Activity can update
        mHandler.obtainMessage(MESSAGE_STATE_CHANGE, state, -1).sendToTarget();
    }

    /**
     * Return the current connection state. */
    public synchronized int getState() {
        return mState;
    }
    
    @Override
    public synchronized void connect(QnDeviceData data) {

        // Cancel any thread attempting to make a connection
        if (mState == STATE_CONNECTING) {
            if (mConnectThread != null) {mConnectThread.cancel(); mConnectThread = null;}
        }

        // Cancel any thread currently running a connection
        if (mConnectedThread != null) {mConnectedThread.cancel(); mConnectedThread = null;}

        // Start the thread to connect with the given device
        device = mAdapter.getRemoteDevice(data.address);
        mConnectThread = new ConnectThread(device);
        mConnectThread.start();
        setState(STATE_CONNECTING);
    }
	
	public synchronized void connected(BluetoothSocket socket, BluetoothDevice
            device) {

        // Cancel the thread that completed the connection
        if (mConnectThread != null) {mConnectThread.cancel(); mConnectThread = null;}

        // Cancel any thread currently running a connection
        if (mConnectedThread != null) {mConnectedThread.cancel(); mConnectedThread = null;}


        // Start the thread to manage the connection and perform transmissions
        mConnectedThread = new ConnectedThread(socket);
        mConnectedThread.start();

        // Send the name of the connected device back to the UI Activity
        Message msg = mHandler.obtainMessage(MESSAGE_DEVICE_NAME);
        Bundle bundle = new Bundle();
        bundle.putString(DEVICE_NAME, device.getName());
        msg.setData(bundle);
        mHandler.sendMessage(msg);

        setState(STATE_CONNECTED);
    }
	
    public synchronized void stop() {
        if (mConnectThread != null) {
            mConnectThread.cancel();
            mConnectThread = null;
        }

        if (mConnectedThread != null) {
            mConnectedThread.cancel();
            mConnectedThread = null;
        }
        setState(STATE_NONE);
    }

	@Override
    public void write(byte[] out) {
        // Create temporary object
        ConnectedThread r;
        // Synchronise a copy of the ConnectedThread
        synchronized (this) {
            if (mState != STATE_CONNECTED) return;
            r = mConnectedThread;
        }
        // Perform the write unsynchronised
        r.write(out);
    }
	
    private void connectionFailed() {
    	// Update state
    	setState(STATE_NONE);
        // Send a failure message back to the Activity
        Message msg = mHandler.obtainMessage(MESSAGE_TOAST);
        Bundle bundle = new Bundle();
        bundle.putString(TOAST, "Unable to connect device");
        msg.setData(bundle);
        mHandler.sendMessage(msg);
    }
    
    private void connectionLost() {
    	// Update state
    	setState(STATE_NONE);
        // Send a failure message back to the Activity
        Message msg = mHandler.obtainMessage(MESSAGE_TOAST);
        Bundle bundle = new Bundle();
        bundle.putString(TOAST, "Device connection was lost");
        msg.setData(bundle);
        mHandler.sendMessage(msg);
    }
	
	private class ConnectThread extends Thread {
        private final BluetoothSocket mmSocket;
        private final BluetoothDevice mmDevice;
        
        public ConnectThread(BluetoothDevice device) {
	        mmDevice = device;
	        BluetoothSocket tmp = null;
	
	        // Get a BluetoothSocket for a connection with the
	        // given BluetoothDevice
	        try {
	                tmp = device.createRfcommSocketToServiceRecord(
	                        myUUID);
	        } catch (IOException e) {
	        	connectionFailed();
	        }
	        mmSocket = tmp;
	    }
	
	    public void run() {
	
	        // Always cancel discovery because it will slow down a connection
	        mAdapter.cancelDiscovery();
	
	        // Make a connection to the BluetoothSocket
	        try {
	            // This is a blocking call and will only return on a
	            // successful connection or an exception
	            mmSocket.connect();
	        } catch (IOException e) {
	            // Close the socket
	            try {
	                mmSocket.close();
	            } catch (IOException e2) {}
	            connectionFailed();
	            return;
	        }
	
	        // Reset the ConnectThread because we're done
	        synchronized (QnBluetooth.this) {
	            mConnectThread = null;
	        }
	
	        // Start the connected thread
	        connected(mmSocket, mmDevice);
	    }
	
	    public void cancel() {
	        try {
	            mmSocket.close();
	        } catch (IOException e) {}
	    }
	}
	
    private class ConnectedThread extends Thread {
        private final BluetoothSocket mmSocket;
        private final InputStream mmInStream;
        private final OutputStream mmOutStream;

        public ConnectedThread(BluetoothSocket socket) {
            mmSocket = socket;
            InputStream tmpIn = null;
            OutputStream tmpOut = null;

            // Get the BluetoothSocket input and output streams
            try {
                tmpIn = socket.getInputStream();
                tmpOut = socket.getOutputStream();
            } catch (IOException e) {}

            mmInStream = tmpIn;
            mmOutStream = tmpOut;
        }

        public void run() {
            byte[] buffer = new byte[1024];
            int bytes;

            // Keep listening to the InputStream while connected
            while (true) {
                try {
                    // Read from the InputStream
                    bytes = mmInStream.read(buffer);

                    // Send the obtained bytes to the UI Activity
                    mHandler.obtainMessage(MESSAGE_READ, bytes, -1, buffer)
                            .sendToTarget();
                } catch (IOException e) {
                    connectionLost();
                    break;
                }
            }
        }

        /**
         * Write to the connected OutStream.
         * @param buffer  The bytes to write
         */
        public void write(byte[] buffer) {
            try {
                mmOutStream.write(buffer);
            } catch (IOException e) {}
        }

        public void cancel() {
            try {
                mmSocket.close();
            } catch (IOException e) {}
        }
    }

	@Override
	public String getName() {
		return mName;
	}

	@Override
	public String getType() {
		return "BT";
	}

}
