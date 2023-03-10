#include <iostream>
#include <fstream>
using namespace std;

int main()
{
    ifstream fin("c:\\windows\\system.ini");
    ofstream fout("c:\\Users\\sinzz\\Desktop\\Study\\명품 C++ Programming\\system.txt");

    if (!fin || !fout) {
        cout << "파일 열기 실패" << endl;
        return 0;
    }

    int ch;
    while ((ch = fin.get()) != EOF)
        fout << (char)toupper(ch);

    fin.close();
    fout.close();
}