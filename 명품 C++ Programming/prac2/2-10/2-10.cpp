#include <iostream>
#include <string>
using namespace std;

int main()
{
    cout << "문자열 입력>>";
    
    string s;
    getline(cin, s);

    for (int i = 1; i <= s.length(); i++)
    {
        cout << s.substr(0, i) << endl;
    }
}