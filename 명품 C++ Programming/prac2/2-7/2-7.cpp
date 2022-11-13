#include <iostream>
#include <string>
using namespace std;

int main()
{
    string a;
    while (true)
    {
        cout << "종료하고싶으면 yes를 입력하세요>>";
        getline(cin, a);
        if (a.compare("yes") == 0)
        {
            cout << "종료합니다...";
            break;
        }
    }
}