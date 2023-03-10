#include <iostream>
using namespace std;

int main()
{
    char ch; // cin.get(char&)을 이용하는 사례
    int count = 0;
    while (true) {
        cin.get(ch); // 문자 읽기
        if (cin.eof()) // EOF를 만나면 읽기 종료
            break;
        cout.put(ch); // ch의 문자 출력
        if (ch == '\n')
            break;
        else if (ch == ' ')
            count++;
    }
    cout << "빈칸은 " << count << "개" << endl;
}