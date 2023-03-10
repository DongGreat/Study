#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    cout << "새 암호를 입력하세요>>";
    char a[100];
    cin >> a;

    cout << "새 암호를 다시 한 번 입력하세요>>";
    char b[100];
    cin >> b;

    if (strcmp(a, b) == 0) {
        cout << "같습니다";
    }
    else {
        cout << "같지 않습니다";
    }
}