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
        if (s.compare("exit") == 0) break;

        idx = rand() % s.length();

        int n = rand();
        if (n % 2 == 0) {
            alpha = rand() % 26 + 'a';
        }
        else {
            alpha = rand() % 26 + 'A';
        }

        s.replace(idx, 1, alpha);
        cout << s << endl;
    }
}