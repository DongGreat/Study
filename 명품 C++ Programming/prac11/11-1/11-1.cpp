#include <iostream>
using namespace std;

int main()
{
    int ch;
    int count = 0;
    while ((ch = cin.get()) != EOF) {
        cout.put(ch);
        if (ch == 'a')
            count++;
        if (ch == '\n')
            break;
    }
    cout << "a는 " << count << "개" << endl;
}