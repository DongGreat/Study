#include <iostream>
#include <string>
using namespace std;

class Histogram {
    string text;
public:
    Histogram(string s = "") { text = s; }
    Histogram& operator<<(string s);
    Histogram& operator<<(char c);
    void operator!();
};

Histogram& Histogram::operator<<(string s) {
    text += s;
    return *this;
}

Histogram& Histogram::operator<<(char c) {
    text += c;
    return *this;
}

void Histogram::operator!() {
    cout << text << endl;

    int count = 0;
    int cnt[26] = { 0, };
    for (int i = 0; i < text.length(); i++) {
        if (isalpha(text[i])) {
            count++;
            for (int j = 0; j < 26; j++) {
                if (tolower(text[i]) - 97 == j) {
                    cnt[j]++;
                    break;
                }
            }
        }
    }
    cout << endl << "총 알파벳 수 " << count << endl;


    for (int i = 0; i < 26; i++) {
        cout << (char)(i + 'a') << ':';
        for (int j = 0; j < cnt[i]; j++) {
            cout << '*';
        }
        cout << endl;
    }
}

int main()
{
    Histogram song("Wise men say, \nonly fools rush in but I can't help, \n");
    song << "falling" << " in love with you." << "- by ";
    song << 'k' << 'i' << 't';
    !song;
}