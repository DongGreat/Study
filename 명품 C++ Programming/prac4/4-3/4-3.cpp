#include <iostream>
#include <string>
using namespace std;

int main()
{
    cout << "문자열 입력>> ";
    string s;
    getline(cin, s);
    int cnt = 0;
    for (int i = 0; i < s.length(); i++) {
        if (s.at(i) == 'a') {
            cnt++;
        }
    }
    cout << "문자 a는 " << cnt << "개 있습니다." << endl;
}