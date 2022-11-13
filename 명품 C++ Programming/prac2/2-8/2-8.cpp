#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    cout << "5 명의 이름을 ';'으로 구분하여 입력하세요" << endl << ">>";
    
    int maxlen = 0;
    char name[100];
    char longname[100];
    for (int i = 1; i <= 5; i++)
    {
        cin.getline(name, 100, ';');
        cout << i << " : " << name << endl;
        if (maxlen < strlen(name))
        {
            maxlen = strlen(name);
            strcpy_s(longname, name);
        }
    }
    cout << "가장 긴 이름은 " << longname;
}