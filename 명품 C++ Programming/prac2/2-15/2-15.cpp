#include <iostream>
#include <string>
using namespace std;

int main()
{
    char s[100];
    char* op;
    char* context = NULL; // context에는 분리된 후 남은 문자열이 들어간다
    int num1, num2;

    while (true) {
        cout << "? ";
        cin.getline(s, 100);

        num1 = atoi(strtok_s(s, " ", &context));
        op = strtok_s(NULL, " ", &context); // 첫번째 인자에 NULL이 들어가면 먼저 자른 문자열의 다음부터 탐색
        num2 = atoi(strtok_s(NULL, " ", &context));

        switch (*op)
        {
        case '+':
            cout << num1 << " " << *op << " " << num2 << " = " << num1 + num2 << endl;
            break;
        case '-':
            cout << s << " = " << num1 - num2 << endl;
            break;
        case '*':
            cout << s << " = " << num1 * num2 << endl;
            break;
        case '/':
            cout << s << " = " << num1 / num2 << endl;
            break;
        case '%':
            cout << s << " = " << num1 % num2 << endl;
            break;
        default:
            break;
        }
    }
}