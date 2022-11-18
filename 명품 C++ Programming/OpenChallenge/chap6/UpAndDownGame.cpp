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
	cout << "Up & Down 게임을 시작합니다." << endl;
	
	Person p[2];
	p[0].setName("김인수");
	p[1].setName("오은경");

	n = rand() % 100;
	int num = 0;
	int cnt = 0;
	while (true) {
		cout << "답은 " << min << "과 " << max << "사이에 있습니다." << endl;
		cout << p[cnt % 2].getName() << ">>";
		cin >> num;
		if (num == n) {
			cout << p[cnt % 2].getName() << "가 이겼습니다!!";
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
