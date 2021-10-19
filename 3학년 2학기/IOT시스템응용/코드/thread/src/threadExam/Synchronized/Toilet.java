package threadExam.Synchronized;

public class Toilet {
	public synchronized void openDoor(String name) {
		System.out.println(name);
		usingTime();
		System.out.println("아~~~! 시원해");
	}
	
	public void usingTime() {
		for(int i=0; i<1000000; i++) {
			if(i==10000) {
				System.out.println("끄으응");
			}
		}
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
