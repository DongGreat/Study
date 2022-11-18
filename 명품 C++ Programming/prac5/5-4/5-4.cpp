#include <iostream>
using namespace std;

bool bigger(int a, int b, int& big);

int main()
{
    int a, b, big;
    cout << "정수 2개 입력>> ";
    cin >> a >> b;
    if (bigger(a, b, big)) {
        cout << "두 정수가 같습니다";
    }
    else {
        cout << big << endl;
    }
}

bool bigger(int a, int b, int& big)
{
    if (a == b) return true;
    else {
        if (a > b) {
            cout << "a가 더 큽니다, ";
            big = a;
        }
        else {
            cout << "b가 더 큽니다, ";
            big = b;
        }
        return false;
    }
}
