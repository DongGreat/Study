package echoExam;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

public class EchoClient {
	
	private Socket socket;
	
	public EchoClient(String host, int port) throws UnknownHostException, IOException {
		socket = new Socket(host, port);
	}
	
	public void echo() throws IOException {
		OutputStream os = socket.getOutputStream();
		InputStream is = socket.getInputStream();
		BufferedReader in = new BufferedReader(new InputStreamReader(is)); // 서버로 부터 온 애를 받아들이는
		PrintWriter out = new PrintWriter(os, true);
		BufferedReader con = new BufferedReader(new InputStreamReader(System.in)); // 사용자로부터 입력받은
		
		while(true) {
			String msg = con.readLine();
			out.println(msg);
			if(msg.equals("bye")) {
				break;
			}
			System.out.println(in.readLine());
		}
	}
	
	public void close() throws IOException {
		socket.close();
	}

	public static void main(String[] args) {
		EchoClient ec;
		System.out.println("메시지를 입력하세요");
		try {
			ec = new EchoClient("localhost", 1289);
			ec.echo();
			ec.close();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
