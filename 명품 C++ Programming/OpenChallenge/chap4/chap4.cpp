#include <iostream>
using namespace std;

class Player
{
    string name;
public:
    void setName(string name) { this->name = name; }
    string getName() { return name; }
};

class WordGame
{
    Player* p;
    int n;
public:
    WordGame(int n) { this->n = n; p = new Player[n]; }
    ~WordGame() { delete[] p; }
    void play();
};

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
			cout << p[cnt % n].getName() << " 패배";
			break;
		}
		cnt++;
	}
}

int main()
{
    cout << "끝말 잇기 게임을 시작합니다" << endl;
    cout << "게임에 참가하는 인원은 몇명입니까?";
    int n;
    cin >> n;

    WordGame wordgame(n);
    wordgame.play();
}