#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    char a[100];
    while (true) {
        cout << "종료하고싶으면 yes를 입력하세요>>";
        cin.getline(a, 100);
        if (strcmp(a, "yes") == 0) {
            cout << "종료합니다...";
            break;
        }
    }
}