#include <iostream>
#include <string>
#include <ctime>
#include <cstdlib>
#include <vector>
using namespace std;

class Word {
    string en;
    string ko;
public:
    Word(string en, string ko) {
        this->en = en;
        this->ko = ko;
    }
    string getEn() { return en; }
    string getKo() { return ko; }
};

int main()
{
    cout << "영어 어휘 테스트를 시작합니다. 1~4 외 다른 입력시 종료합니다." << endl;

    vector<Word> v;
    v.push_back(Word("baby", "아기"));
    v.push_back(Word("human", "인간"));
    v.push_back(Word("society", "사회"));
    v.push_back(Word("photo", "사진"));
    v.push_back(Word("painting", "그림"));
    v.push_back(Word("love", "사랑"));
    v.push_back(Word("emotion", "감정"));
    v.push_back(Word("doll", "인형"));
    v.push_back(Word("animal", "동물"));
    v.push_back(Word("bear", "곰"));
    v.push_back(Word("lover", "애인"));
    v.push_back(Word("trade", "거래"));

    srand((unsigned)time(0));
    string example[4] = { "" }; // 4개의 한글 보기
    string en, ko;
    int n;
    while (true) {
        cout << "어휘 삽입: 1, 어휘 테스트: 2, 프로그램 종료: 그외키 >> ";
        cin >> n;
        cin.ignore();
        if (n == 1) {
            cout << "영어 단어에 exit를 입력하면 입력 끝" << endl;
            while (true) {
                cout << "영어 >>";
                getline(cin, en);
                if (en == "exit") break;
                cout << "한글 >>";
                getline(cin, ko);
                v.push_back(Word(en, ko));
            }
        }
        else if (n == 2) {
            while (true) {
                int index = rand() % v.size(); // vector의 값 중 하나의 인덱스
                cout << v[index].getEn() << "?" << endl;
                int ansIndex = rand() % 4; // 정답 인덱스
                example[ansIndex] = v[index].getKo();
                for (int i = 0; i < 4; i++) {
                    if (i != ansIndex) { // 정답 인덱스는 제외
                        while (true) {
                            n = rand() % v.size();
                            // 다른 보기들과 중복되지 않은 값이면
                            if (example[0] != v[n].getKo() &&
                                example[1] != v[n].getKo() &&
                                example[2] != v[n].getKo() &&
                                example[3] != v[n].getKo()) {
                                example[i] = v[n].getKo();
                                break;
                            }
                        }
                    }
                }

                for (int i = 0; i < 4; i++) {
                    cout << "(" << i + 1 << ") " << example[i] << ' ';
                }
                cout << ":>";

                int answer;
                cin >> answer;
                if (answer >= 1 && answer <= 4) {
                    if (ansIndex == answer - 1) { // 정답 인덱스와 사용자가 입력한 번호 - 1이 같으면 정답
                        cout << "Excellent !!" << endl;
                    }
                    else {
                        cout << "No. !!" << endl;
                    }
                }
                else {
                    break;
                }

                for (int i = 0; i < 4; i++) { // 보기 초기화(위의 중복되지 않은 값 조건에 걸리기에)
                    example[i] = "";
                }
            }
        }
        else break;
    }
}