#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    cout << "영문 텍스트를 입력하세요. 히스토그램을 그립니다." << endl;
    cout << "텍스트의 끝은 ; 입니다. 10000개까지 가능합니다." << endl;

    int count = 0;
    int alphabet[26] = { 0 };

    char s[10000];
    cin.getline(s, 10000, ';');

    for (int i = 0; i < strlen(s); i++) {
        if (isalpha(s[i]) != 0) {
            // cnt[tolower(s[i]) - 97]++;
            for (int j = 0; j < 26; j++) {
                if (tolower(s[i]) == (j + 'a')) {
                    alphabet[j]++;
                }
            }
            count++;
        }
    }
    cout << "총 알파벳 수 " << count << endl << endl;

    for (int i = 0; i < 26; i++) {
        cout << (char)(i + 'a') << " (" << alphabet[i] << ")\t: ";
        for (int j = 1; j <= alphabet[i]; j++) {
            cout << "*";
        }
        cout << endl;
    }
}