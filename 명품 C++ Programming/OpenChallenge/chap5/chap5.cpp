#include <iostream>
#include <string>
using namespace std;

#include "Morse.h"

int main()
{
    cout << "아래에 영문 텍스트를 입력하세요. 모스 부호로 바꿉니다." << endl;
    string text, morse;
    getline(cin, text);
    Morse m;
    m.text2Morse(text, morse);
    cout << morse << endl << endl;
    cout << "모스 부호를 다시 영문 텍스트로 바꿉니다." << endl;
    if (m.morse2Text(morse, text)) {
        cout << text << endl;
    }
}