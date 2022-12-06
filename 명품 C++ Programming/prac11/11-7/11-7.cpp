#include <iostream>
#include <cctype>
#include <iomanip>
using namespace std;

int main()
{
    cout.setf(ios::left);
    for (int i = 0; i <= 3; i++) {
        cout << setw(10) << "dec";
        cout << setw(10) << "hexa";
        cout << setw(10) << "char";
    }
    cout << endl;
    for (int i = 0; i <= 3; i++) {
        cout << setw(10) << "___";
        cout << setw(10) << "____";
        cout << setw(10) << "____";
    }
    cout << endl;

    for (int i = 0; i < 128; i++) {
        if (i % 4 == 0 && i != 0)
            cout << endl;
        cout << setw(10) << dec << i;
        cout << setw(10) << hex << i;
        if (isprint(i))
            cout << setw(10) << (char)i;
        else
            cout << setw(10) << '.';
    }
}