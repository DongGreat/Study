#include <iostream>
#include <string>
#include <cstdlib>
#include <ctime>
using namespace std;

#include "GamblingGame.h"

void GamblingGame::run()
{
	srand((unsigned)time(0));

	cout << "***** ���� ������ �����մϴ�. *****" << endl;
	string name;
	cout << "ù��° ���� �̸�>>";
	cin >> name;
	p[0].setName(name);
	cout << "�ι�° ���� �̸�>>";
	cin >> name;
	p[1].setName(name);

	int num1, num2, num3;
	char ch;
	int cnt = 0;
	while (true) {
		cout << p[cnt % 2].getName() << ":";

		cin.get(ch);
		if (ch == '\n') {
			num1 = rand() % 3;
			num2 = rand() % 3;
			num3 = rand() % 3;
			cout << "\t\t" << num1 << '\t' << num2 << '\t' << num3 << '\t';
			if (num1 == num2 && num2 == num3) {
				cout << p[cnt % 2].getName() << "���� �¸�!!" << endl;
				break;
			}
			else cout << "�ƽ�����!" << endl;
		}
		cnt++;
	}
}
