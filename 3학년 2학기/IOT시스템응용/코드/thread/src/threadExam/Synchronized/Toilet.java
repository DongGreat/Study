package threadExam.Synchronized;

public class Toilet {
	public synchronized void openDoor(String name) {
		System.out.println(name);
		usingTime();
		System.out.println("��~~~! �ÿ���");
	}
	
	public void usingTime() {
		for(int i=0; i<1000000; i++) {
			if(i==10000) {
				System.out.println("������");
			}
		}
	}
}
