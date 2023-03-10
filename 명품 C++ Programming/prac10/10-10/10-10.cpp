#include <iostream>
#include <string>
#include <vector>
using namespace std;

class Nation {
    string nation, capital;
public:
    Nation(string nation = "", string capital = "") {
        this->nation = nation;
        this->capital = capital;
    }
    string getNation() {
        return nation;
    }
    string getCapital() {
        return capital;
    }
    bool compareNation(string nation) {
        if (this->nation == nation) return true;
        else return false;
    }
    bool compareCapital(string capital) {
        if (this->capital == capital) return true;
        else return false;
    }
};

int main()
{
    srand((unsigned)time(0));

    vector<Nation> v;
    v.push_back(Nation("미국", "워싱턴"));
    v.push_back(Nation("네덜란드", "암스테르담"));
    v.push_back(Nation("아르헨티나", "부에노스아이레스"));
    v.push_back(Nation("크로아티아", "자그레브"));
    v.push_back(Nation("브라질", "브라질리아"));
    v.push_back(Nation("잉글랜드", "런던"));
    v.push_back(Nation("프랑스", "파리"));
    v.push_back(Nation("모로코", "라바트"));
    v.push_back(Nation("포르투갈", "리스본"));
    
    cout << "***** 나라의 수도 맞추기 게임을 시작합니다. *****" << endl;
    int n;
    string nation, capital; // 나라, 수도
    bool b; // 이미 벡터에 있는 나라인지 확인하기 위함
    while (true) {
        cout << "정보 입력: 1, 퀴즈: 2, 종료: 3 >> ";
        cin >> n;
        if (n == 1) {
            cout << "현재 " << v.size() << "개의 나라가 입력되어 있습니다." << endl;
            cout << "나라와 수도를 입력하세요(no no 이면 입력끝)" << endl;
            while (true) {
                cout << v.size() + 1 << ">>";
                cin >> nation >> capital;
                if (nation == "no" && capital == "no") break;
                b = true;
                for (int i = 0; i < v.size(); i++) {
                    if (v[i].compareNation(nation)) { // 이미 있는 나라이면
                        cout << "already exists !!" << endl;
                        b = false;
                        break;
                    }
                }
                if (b) { // 없는 나라이면 벡터에 추가
                    v.push_back(Nation(nation, capital));
                }
            }
        }
        else if (n == 2) {
            int random;
            string capital;
            while (true) {
                random = rand() % v.size();
                cout << v.at(random).getNation() << "의 수도는?";
                cin >> capital;
                if (capital == "exit") break;
                else if (v.at(random).compareCapital(capital))
                    cout << "Correct !!" << endl;
                else
                    cout << "No !!" << endl;
            }
        }
        else if (n == 3) {
            break;
        }
    }
}