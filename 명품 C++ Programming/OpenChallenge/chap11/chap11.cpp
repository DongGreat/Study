#include <iostream>
#include <string>
#include <ctime>
#include <cstdlib>
using namespace std;

class AbstractPlayer {
    string name;
protected:
    static string gbb[3];
public:
    AbstractPlayer(string name) {
        this->name = name;
        gbb[0] = "가위"; gbb[1] = "바위"; gbb[2] = "보";
    }
    virtual string turn() = 0;
    string getName() { return name; }
};

string AbstractPlayer::gbb[3] = {};

class Human : public AbstractPlayer {
public:
	Human(string name) : AbstractPlayer(name) {}
	string turn() {
        string s;
        while (true) {
            cout << getName() << ">>";
            getline(cin, s);
            if (s == "가위") {
                return gbb[0];
                break;
            }
            else if (s == "바위") {
                return gbb[1];
                break;
            }
            else if (s == "보") {
                return gbb[2];
                break;
            }
        }
	}
};

class Computer : public AbstractPlayer {
public:
    Computer(string name = "Computer") : AbstractPlayer(name) {
        srand((unsigned)time(0));
    }
    string turn() {
        int n = rand() % 3;
        cout << getName() << ": " << gbb[n] << endl;
        return gbb[n];
    }
};

int main()
{
    cout << "***** 컴퓨터와 사람이 가위 바위 보 대결을 펼칩니다. *****" << endl;

    cout << "선수 이름을 입력하세요>>";
    string name;
    getline(cin, name);

    Human* h = new Human(name);
    Computer* c = new Computer();
    string gbbH, gbbC;
    while (true) {
        gbbH = h->turn();
        gbbC = c->turn();
        if (gbbH == "가위" && gbbC == "보" || gbbH == "바위" && gbbC == "가위" || gbbH == "보" && gbbC == "바위") {
            cout << h->getName() << " is winner." << endl;
        }
        else if (gbbH == gbbC) {
            cout << "the same" << endl;
        }
        else {
            cout << c->getName() << " is winner." << endl;
        }
    }
}