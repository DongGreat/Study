#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <ctime>
#include <cstdlib>
using namespace std;

int main()
{
    srand((unsigned)time(0));
    string line;
    vector<string> v;
    ifstream fin("C:\\Users\\sinzz\\Desktop\\Study\\명품 C++ Programming\\words.txt");
    if (!fin) {
        cout << "C:\\Users\\sinzz\\Desktop\\Study\\명품 C++ Programming\\words.txt 열기 오류" << endl;
    }
    while (getline(fin, line)) {
        v.push_back(line);
    }
    fin.close();

    cout << "--------------------------------" << endl;
    cout << "지금부터 행맨 게임을 시작합니다." << endl;
    cout << "--------------------------------" << endl;

    int n;
    string answer, example;
    char hide1, hide2, input;
    bool a;
    while (true) {
        a = false;
        n = rand() % v.size();
        answer = v[n];
        example = "";
        if (answer.size() > 2) {
            hide1 = answer[rand() % answer.size()];
            while (true) {
                hide2 = answer[rand() % answer.size()];
                if (hide1 != hide2)
                    break;
            }
        }
        else continue;
        for (int i = 0; i < answer.length(); i++) {
            if (answer[i] == hide1 || answer[i] == hide2)
                example.insert(i, "-");
            else
                example.append(answer, i, 1);
        }
        for (int i = 0; i < 5; i++) {
            cout << example << endl;
            cout << ">>";
            cin >> input;
            if (input == hide1) {
                for (int i = 0; i < answer.length(); i++) {
                    if (answer[i] == hide1)
                        example[i] = input;
                }
            }
            else if (input == hide2) {
                for (int i = 0; i < answer.length(); i++) {
                    if (answer[i] == hide2)
                        example[i] = input;
                }
            }
            if (example == answer) {
                a = true;
                break;
            }
        }
        if (!a) {
            cout << "5번 실패 하였습니다." << endl;
        }
        cout << answer << endl;
        cout << "Next(y/n)?";
        cin >> input;
        if (input == 'n')
            break;
    }
    cout << answer << endl << example;
}