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
        idx = s.find('a', idx) + 1; // 찾은 문자의 다음 인덱스부터 다시 탐색
    }
    cout << "문자 a는 " << cnt << "개 있습니다." << endl;
}