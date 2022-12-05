#include <iostream>
#include <string>
#include <map>
using namespace std;

int main()
{
    cout << "***** 암호 관리 프로그램 WHO를 시작합니다 *****" << endl;

    map<string, string> m;
    int n;
    string name, pwd;
    while (true) {
        cout << "삽입:1, 검사:2, 종료:3>> ";
        cin >> n;
        if (n == 1) {
            cout << "이름 암호>> ";
            cin >> name >> pwd;
            m.insert(make_pair(name, pwd));
        }
        else if (n == 2) {
            cout << "이름? ";
            cin >> name;
            if (m.find(name) == m.end()) {
                cout << "없음" << endl;
            }
            else {
                while (true) {
                    cout << "암호? ";
                    cin >> pwd;
                    if (m[name] == pwd) {
                        cout << "통과!!" << endl;
                        break;
                    }
                    else {
                        cout << "실패~~" << endl;
                    }
                }
            }
        }
        else if (n == 3) {
            cout << "프로그램을 종료합니다..." << endl;
            break;
        }
    }
}