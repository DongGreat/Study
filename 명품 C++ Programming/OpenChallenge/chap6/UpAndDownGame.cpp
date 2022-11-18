#include <iostream>
#include <ctime>
#include <cstdlib>
using namespace std;

#include "UpAndDownGame.h"

int UpAndDownGame::n;
int UpAndDownGame::min = 0;
int UpAndDownGame::max = 99;

UpAndDownGame::UpAndDownGame()
{
	srand((unsigned)time(0));
}

void UpAndDownGame::run()
{
	cout << "Up & Down ������ �����մϴ�." << endl;
	
	Person p[2];
	p[0].setName("���μ�");
	p[1].setName("������");

	n = rand() % 100;
	int num = 0;
	int cnt = 0;
	while (true) {
		cout << "���� " << min << "�� " << max << "���̿� �ֽ��ϴ�." << endl;
		cout << p[cnt % 2].getName() << ">>";
		cin >> num;
		if (num == n) {
			cout << p[cnt % 2].getName() << "�� �̰���ϴ�!!";
			break;
		}
		else if (num < n) {
			min = num;
		}
		else {
			max = num;
		}
		cnt++;
	}
}
