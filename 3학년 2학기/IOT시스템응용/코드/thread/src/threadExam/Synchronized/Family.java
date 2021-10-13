package threadExam.Synchronized;

public class Family extends Thread{
	Toilet toilet;
	String who;
	
	public Family(String name, Toilet t) {
		who = name;
		toilet = t;
	}
	
	public void run() {
		toilet.openDoor(who);
	}
}
