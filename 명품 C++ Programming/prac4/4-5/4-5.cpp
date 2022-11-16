#include <iostream>
#include <string>
#include <cstdlib>
#include <ctime>
using namespace std;

int main()
{
    srand((unsigned)time(0));

    cout << "아래에 한 줄을 입력하세요.(exit를 입력하면 종료합니다)" << endl;
    string s, alpha;
    int idx;
    while (true) {
        cout << ">>";
        getline(cin, s);
        if (!s.compare("exit")) break;

        idx = rand() % s.length();
        alpha = rand() % 26 + 'a';

        s.replace(idx, 1, alpha);
        cout << s << endl;
    }
}