package com.example.niloy.onqraken;

import android.os.Handler;
import android.os.Message;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity implements View.OnClickListener{


    public static final int MESSAGE_UDP_STARTED = 0x01;
    public static final int MESSAGE_UDP_RECEIVED = 0x10;
    public static final int MESSAGE_PHONE_IP = 0x100;

    private final Handler mHandler = new Handler(){
        @Override
        public void handleMessage(Message msg) {
            switch (msg.what){
                case MESSAGE_UDP_STARTED:
                    break;

                case MESSAGE_UDP_RECEIVED:
                    received.setText((String)msg.obj);
                    break;

                case MESSAGE_PHONE_IP:
                    getActionBar().setSubtitle("Listening on: " + connection.getIP());
                    break;
            }

            super.handleMessage(msg);
        }
    };

    UDPConnection connection;
    Button start, send;
    TextView received;
    EditText toSend;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

    }

    @Override
    protected void onResume() {
        super.onResume();
        start = (Button) findViewById(R.id.btn_start);
        send = (Button) findViewById(R.id.btn_send);
        received = (TextView) findViewById(R.id.received);
        toSend = (EditText) findViewById(R.id.text_send);

        start.setOnClickListener(this);
        send.setOnClickListener(this);
        connection = new UDPConnection(mHandler, getApplicationContext(), "", 5555);
    }

    @Override
    public void onClick(View v) {
        if(v.equals(start)){
            connection.start();
        }else if(v.equals(send)){
            if(toSend.getText()!=null || toSend.getText().toString().equals("")){
                connection.sendMessage(toSend.getText().toString());
            }
        }
    }
}
