#include <iostream>
using namespace std;

class Statistics {
    int* num;
    int index;
public:
    Statistics() { num = new int[10]; index = 0; }
    ~Statistics() { delete[] num; }
    bool operator!();
    void operator>>(int& avg);
    Statistics& operator<<(int n);
    void operator~();
};

bool Statistics::operator!() {
    if (index == 0) return true;
    else return false;
}

void Statistics::operator>>(int& avg) {
    int sum = 0;
    for (int i = 0; i < index; i++) {
        sum += num[i];
    }
    avg = sum / index;
}

Statistics& Statistics::operator<<(int n) {
    this->num[index++] = n;
    return *this;
}

void Statistics::operator~() {
    for (int i = 0; i < index; i++) {
        cout << num[i] << ' ';
    }
    cout << endl;
}

int main()
{
    Statistics stat;
    if (!stat) cout << "현재 통계 데이타가 없습니다." << endl;

    int x[5];
    cout << "5 개의 정수를 입력하라>>";
    for (int i = 0; i < 5; i++) cin >> x[i];

    for (int i = 0; i < 5; i++) stat << x[i];
    stat << 100 << 200;
    ~stat;

    int avg;
    stat >> avg;
    cout << "avg=" << avg << endl;
}