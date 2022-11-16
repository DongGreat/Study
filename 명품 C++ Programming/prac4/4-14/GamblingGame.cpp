#include <iostream>
#include <string>
#include <cstdlib>
#include <ctime>
using namespace std;

#include "GamblingGame.h"

void GamblingGame::run()
{
	srand((unsigned)time(0));

	cout << "***** 갬블링 게임을 시작합니다. *****" << endl;
	string name;
	cout << "첫번째 선수 이름>>";
	cin >> name;
	p[0].setName(name);
	cout << "두번째 선수 이름>>";
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
				cout << p[cnt % 2].getName() << "님의 승리!!" << endl;
				break;
			}
			else cout << "아쉽군요!" << endl;
		}
		cnt++;
	}
}
