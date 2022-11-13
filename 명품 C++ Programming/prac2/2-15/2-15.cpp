#include <iostream>
#include <string>
using namespace std;

int main()
{
    string c;

    while (true) {
        cout << "? ";
        getline(cin, c);

        int num1 = atoi(c.substr(0, c.find(" ")).c_str());
        int num2 = atoi(c.substr(c.find(" ") + 3, c.back()).c_str());

        char op = c.at(c.find(" ") + 1);

        switch (op)
        {
        case '+':
            cout << c << " = " << num1 + num2 << endl;
            break;
        case '-':
            cout << c << " = " << num1 - num2 << endl;
            break;
        case '*':
            cout << c << " = " << num1 * num2 << endl;
            break;
        case '/':
            cout << c << " = " << num1 / num2 << endl;
            break;
        case '%':
            cout << c << " = " << num1 % num2 << endl;
            break;
        default:
            break;
        }
    }
}