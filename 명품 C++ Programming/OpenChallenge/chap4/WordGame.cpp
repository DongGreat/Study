#include <iostream>
#include <string>
using namespace std;

#include "WordGame.h"

void WordGame::play()
{
	string name;
	for (int i = 0; i < n; i++) {
		cout << "참가자의 이름을 입력하세요. 빈칸 없이>>";
		cin >> name;
		p[i].setName(name);
	}
	cout << "시작하는 단어는 아버지입니다" << endl;
	string a = "아버지";
	string b;
	int cnt = 0;
	while (true) {
		cout << p[cnt % n].getName() << ">>";
		cin >> b;
		if (a.at(a.length() - 2) == b.at(0) && a.at(a.length() - 1) == b.at(1)) {
			a = b;
		}
		else {
			cout << "게임 종료";
			break;
		}
		cnt++;
	}
}
