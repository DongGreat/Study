package echoExam;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class EchoServer {
	
	private ServerSocket server;
	
	public EchoServer(int port) throws IOException {
		server = new ServerSocket(port); // 듣기 소켓이 생성(포트 번호까지 바인딩 된)
	}
	
	public void service() throws IOException {
		System.out.println("EchoServer is ready");
		
		Socket client = server.accept();
		
		InputStream is = client.getInputStream();
		OutputStream os = client.getOutputStream();
		BufferedReader in = new BufferedReader(new InputStreamReader(is));
		PrintWriter out = new PrintWriter(os, true);
		
		while(true) {
			String msg = in.readLine();
			System.out.println(msg);
			if(msg.equals("bye")) {
				break;
			}
			out.println(">>" + msg);
		}
	}
	
	public void close() throws IOException {
		server.close();
	}

	public static void main(String[] args) {
		EchoServer es;
		try {
			es = new EchoServer(1289);
			es.service();
			es.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
