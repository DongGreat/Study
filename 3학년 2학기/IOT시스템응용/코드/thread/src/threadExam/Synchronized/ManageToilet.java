package threadExam.Synchronized;

public class ManageToilet {

	public static void main(String[] args) {
		Toilet t = new Toilet();
		
		Family father = new Family("�ƹ���", t);
		Family mother = new Family("��Ӵ�", t);
		Family brother = new Family("��", t);
		Family sister = new Family("����", t);
		Family me = new Family("��", t);
		
		father.start();
		mother.start();
		brother.start();
		sister.start();
		me.start();
	}

}
