#include <iostream>
using namespace std;

int main()
{
    char ch;
    int count = 0;
    while (true) {
        cin.get(ch);
        if (cin.eof())
            break;
        cout.put(ch);
        if (ch == '\n')
            break;
        else if (ch == ' ')
            count++;
    }
    cout << "빈칸은 " << count << "개" << endl;
}