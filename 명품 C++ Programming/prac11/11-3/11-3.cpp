#include <iostream>
using namespace std;

int main()
{
    char ch;
    cin.ignore(100, ';');
    while (true) {
        cin.get(ch);
        if (cin.eof())
            break;
        cout.put(ch);
        if (ch == '\n')
            cin.ignore(100, ';');
    }
}