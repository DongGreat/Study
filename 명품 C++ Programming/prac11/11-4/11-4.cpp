#include <iostream>
using namespace std;

int main()
{
    int ch;
    while ((ch = cin.get()) != EOF) {
        if (ch == ';') {
            cin.ignore(100, '\n');
            cout << endl;
        }
        else
            cout.put(ch);
    }
}