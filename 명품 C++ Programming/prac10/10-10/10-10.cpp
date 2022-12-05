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
    bool compare(string capital) {
        if (this->capital == capital) return true;
        else return false;
    }
};

int main()
{
    vector<Nation> v;
    v.push_back(Nation("대한민국", "서울"));
    v.push_back(Nation("중국", "베이징"));
    v.push_back(Nation("북한", "평양"));
    v.push_back(Nation("미국", "워싱턴"));
    v.push_back(Nation("대만", "타이베이"));
    v.push_back(Nation("캐나다", "오타와"));
    v.push_back(Nation("스위스", "제네바"));
    v.push_back(Nation("프랑스", "파리"));
    v.push_back(Nation("이집트", "카이로"));
    
    cout << "***** 나라의 수도 맞추기 게임을 시작합니다. *****" << endl;
    int n;
    string nation, capital;
    bool sw = false;
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
                for (int i = 0; i < v.size(); i++) {
                    if (v[i].getNation() == nation) {
                        cout << "already exists !!" << endl;
                        sw = true;
                        break;
                    }
                }
                if (sw) {
                    sw = false;
                    continue;
                }
                v.push_back(Nation(nation, capital));
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
                else if (v.at(random).getCapital() == capital)
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