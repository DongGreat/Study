#include <iostream>
#include <string>
using namespace std;

int main()
{
    cout << "문자열 입력>> ";
    string s;
    getline(cin, s);

    int cnt = 0, idx = 0;
    while (s.find('a', idx) != -1) {
        cnt++;
        idx = s.find('a', idx) + 1;
    }
    cout << "문자 a는 " << cnt << "개 있습니다." << endl;
}