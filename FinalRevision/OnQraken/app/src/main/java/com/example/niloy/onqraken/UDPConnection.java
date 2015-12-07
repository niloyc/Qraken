package com.example.niloy.onqraken;

import android.content.Context;
import android.net.wifi.WifiManager;
import android.os.Handler;
import android.util.Log;
import android.widget.Toast;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/**
 * Created by niloy on 7/12/2015.
 */
public class UDPConnection {
    private static final String tag = ".UDPConnection";

    private Handler mHandler;
    private WifiManager wm;
    private Context mContext;
    private String clientIP = "";
    private int port = 0;

    private String myIP;
    private DatagramSocket socket;

    private boolean runReceiver;

    UDPConnection(Handler handler, Context context, String ip, int port){
        mHandler = handler;
        mContext = context;
        wm = (WifiManager) context.getSystemService(Context.WIFI_SERVICE);
        clientIP = ip;
        this.port = port;
    }

    public String getIP(){
        return myIP;
    }

    //Start threads for listening and sending

    //Listen

    //Send

    public void start(){
        if(wm == null){
            Toast.makeText(mContext,"No Wifi service found", Toast.LENGTH_LONG).show();
            return;
        }

        if(!wm.isWifiEnabled()){
            Toast.makeText(mContext,"Enable Wifi", Toast.LENGTH_LONG).show();
            return;
        }

        if(!setupSocket()) {
            Toast.makeText(mContext, "Failed to setup Socket", Toast.LENGTH_LONG).show();
            return;
        }

        //Start receiver
        runReceiver = true;
        new Thread(new receiver()).start();
    }

    private boolean setupSocket(){
        if(socket != null){
            socket.disconnect();
            socket.close();
            socket = null;
        }

        try {
            socket = new DatagramSocket(port);
            socket.setReuseAddress(true);
            socket.setSoTimeout(50);
        }catch (SocketException e){
            return false;
        }

        return true;
    }

    private class receiver implements Runnable {

        @Override
        public void run() {
            Log.d(tag, "Starting Receiver");

            byte[] data = new byte[4096];
            DatagramPacket recvData = new DatagramPacket(data, data.length);

            //Find ip address of this phone
            int ip = wm.getDhcpInfo().ipAddress;
            byte[] ipAddress = ByteBuffer.allocate(Integer.SIZE/Byte.SIZE).order(ByteOrder.LITTLE_ENDIAN).putInt(ip).array();

            try{
                myIP = InetAddress.getByAddress(ipAddress).getHostName();
                mHandler.obtainMessage(MainActivity.MESSAGE_PHONE_IP).sendToTarget();
            }catch (UnknownHostException e){
                e.printStackTrace();
            }

            while(runReceiver){
                if(socket != null){
                    try {
                        socket.receive(recvData);
                        messageReceived(recvData);
                    }catch (IOException e){
                        //e.printStackTrace();
                    }
                }
            }
        }
    }

    public void sendMessage(final String msg){
        if(clientIP.equals("") || port == 0){
            return;
        }

        final byte[] bytes = msg.getBytes();
        try{
            final DatagramPacket packet = new DatagramPacket(bytes, bytes.length, InetAddress.getByName(clientIP), port);
            new Thread(new Runnable() {
                @Override
                public void run() {
                    try {
                        socket.send(packet);
                    }catch (IOException e){
                        e.printStackTrace();
                    }catch (NullPointerException e){
                        setupSocket();
                    }
                }
            }).start();
        }catch (UnknownHostException e){
            e.printStackTrace();
        }
    }


    private void messageReceived(DatagramPacket receivedPacket){
        if(receivedPacket==null)
            return;

        String msg = new String(receivedPacket.getData(), receivedPacket.getOffset(), receivedPacket.getLength());
        mHandler.obtainMessage(MainActivity.MESSAGE_UDP_RECEIVED, msg).sendToTarget();

        if(clientIP.equals("")){
            if(receivedPacket.getAddress()!=null) {
                clientIP = receivedPacket.getAddress().getHostName();
                Log.d(tag, "Setting client ip to: " + clientIP);
            }
        }
    }

    public void stop(){

    }

}
