#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main()
{
    fstream fin("c:\\windows\\system.ini", ios::in);
    if (!fin) {
        cout << "파일 열기 실패" << endl;
        return 0;
    }

    string line;
    int i = 1;
    while (getline(fin, line))
        cout << i++ << " : " << line << endl;
    fin.close();
}