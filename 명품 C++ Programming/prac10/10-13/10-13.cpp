#include <iostream>
#include <string>
#include <map>
using namespace std;

int main()
{
    cout << "***** 점수관리 프로그램 HIGH SCORE을 시작합니다 *****" << endl;
    
    map<string, int> m;
    int n;
    string name;
    int score;
    while (true) {
        cout << "입력:1, 조회:2, 종료:3>> ";
        cin >> n;
        if (n == 1) {
            cout << "이름 암호>> ";
            cin >> name >> score;
            m.insert(make_pair(name, score));
        }
        if (n == 2) {
            cout << "이름>> ";
            cin >> name;
            if (m.find(name) == m.end()) {
                cout << "없음" << endl;
            }
            else {
                cout << name << "의 점수는 " << m[name] << endl;
            }
        }
        if (n == 3) {
            cout << "프로그램을 종료합니다..." << endl;
            break;
        }
    }
}