#include <iostream>
#include <string>
using namespace std;

#include "WordGame.h"

void WordGame::play()
{
	string name;
	for (int i = 0; i < n; i++) {
		cout << "�������� �̸��� �Է��ϼ���. ��ĭ ����>>";
		cin >> name;
		p[i].setName(name);
	}
	cout << "�����ϴ� �ܾ�� �ƹ����Դϴ�" << endl;
	string a = "�ƹ���";
	string b;
	int cnt = 0;
	while (true) {
		cout << p[cnt % n].getName() << ">>";
		cin >> b;
		if (a.at(a.length() - 2) == b.at(0) && a.at(a.length() - 1) == b.at(1)) {
			a = b;
		}
		else {
			cout << "���� ����";
			break;
		}
		cnt++;
	}
}
