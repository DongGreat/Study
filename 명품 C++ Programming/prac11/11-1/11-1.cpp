#include <iostream>
using namespace std;

int main()
{
    int ch; // EOF와의 비교를 위해 int 타입으로 선언
    int count = 0;
    while ((ch = cin.get()) != EOF) {
        cout.put(ch); // 읽은 문자 출력
        if (ch == '\n')
            break;
        if (ch == 'a')
            count++;
    }
    cout << "a는 " << count << "개" << endl;
}