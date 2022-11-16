#include <iostream>
#include <string>
using namespace std;

#include "Person.h"

int main()
{
    cout << "이름과 전화번호를 입력해 주세요" << endl;
    Person* personArray = new Person[3];
    string name, tel;
    for (int i = 0; i < 3; i++) {
        cout << "사람 " << i + 1 << ">>";
        cin >> name >> tel;
        personArray[i].set(name, tel);
    }

    cout << "모든 사람의 이름은 ";
    for (int i = 0; i < 3; i++) {
        cout << personArray[i].getName() << ' ';
    }
    cout << endl;

    cout << "전화번호를 검색합니다. 이름을 입력하세요>>";
    string s;
    cin >> s;
    for (int i = 0; i < 3; i++) {
        if (!personArray[i].getName().compare(s)) {
            cout << "전화번호는 " << personArray[i].getTel();
        }
    }
}