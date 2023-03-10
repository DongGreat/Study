#include <iostream>
#include <fstream>
using namespace std;

int main()
{
    ifstream fin("c:\\windows\\system.ini");
    if (!fin) {
        cout << "파일 열기 실패" << endl;
        return 0;
    }

    int ch;
    while ((ch = fin.get()) != EOF)
        cout << (char)toupper(ch);
    fin.close();
}