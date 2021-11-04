package com.dong.led_client;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;

public class MainActivity extends AppCompatActivity {
    Socket socket;
    OutputStream os;
    InputStream is;
    BufferedReader in;
    PrintWriter out;

    ConnectThread thread;

    Button btnConnect, btnOn, btnOff, btnDisconnect;
    EditText edServerIP;
    TextView tvMessage;

    Handler handler = new Handler();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        tvMessage = (TextView) findViewById(R.id.tvMessage);
        edServerIP = (EditText) findViewById(R.id.edServerIP);
        btnConnect = (Button) findViewById(R.id.btnConnect);
        btnDisconnect = (Button) findViewById(R.id.btnDisconnect);
        btnOn = (Button) findViewById(R.id.btnOn);
        btnOff = (Button) findViewById(R.id.btnOff);
        btnConnect.setEnabled(true);
        btnOn.setEnabled(false);
        btnOff.setEnabled(false);
        btnDisconnect.setEnabled(false);

        btnConnect.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                String addr = edServerIP.getText().toString().trim();

                thread = new ConnectThread(addr);
                thread.start();

                btnConnect.setEnabled(false);
                btnDisconnect.setEnabled(true);
                btnOn.setEnabled(true);
                btnOff.setEnabled(true);
            }
        });

        btnDisconnect.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                thread.setStop();

                tvMessage.setText("LED 상태 : ");
                btnConnect.setEnabled(true);
                btnDisconnect.setEnabled(false);
                btnOn.setEnabled(false);
                btnOff.setEnabled(false);
            }
        });

        btnOn.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                new Thread() {
                    public void run() {
                        out.println("on");
                        out.flush();

                        thread.readServer();
                    }
                }.start();
            }
        });

        btnOff.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                new Thread() {
                    public void run() {
                        out.println("off");
                        out.flush();

                        thread.readServer();
                    }
                }.start();
            }
        });
    }
    // 소켓 연결할 스레드 정의
    class ConnectThread extends Thread {
        String hostname;

        public ConnectThread(String addr) {
            hostname = addr;
        }

        public void run() {
            try {
                int port = 9000;

                socket = new Socket(hostname, port);
                os = socket.getOutputStream();
                is = socket.getInputStream();
                in = new BufferedReader(new InputStreamReader(is));
                out = new PrintWriter(os);
            } catch (IOException e) {
                e.printStackTrace();
                try {
                    socket.close();
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
            }

        }

        public void readServer() {
            try {
                final String msg1 = in.readLine();

                handler.post(new Runnable() {
                    @Override
                    public void run() {
                        tvMessage.setText("LED 상태 : " + msg1);
                    }
                });
            } catch (IOException e) {
                e.printStackTrace();
            }

        }

        public void setStop() {
            if(socket.isConnected()) {
                try {
                    socket.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}