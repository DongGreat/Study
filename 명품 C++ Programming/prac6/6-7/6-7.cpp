#include <iostream>
#include <ctime>
#include <cstdlib>
using namespace std;

class Random {
public:
    static void seed() { srand((unsigned)time(0)); }
    static int nextInt(int min = 0, int max = 32767);
    static char nextAlphabet();
    static double nextDouble();
};

int main()
{
    Random::seed();

    int min = 51, max = 100;
    cout << min << "에서 " << max << "까지 랜덤한 정수 10개를 출력합니다" << endl;;
    for (int i = 0; i < 10; i++) {
        cout << Random::nextInt(min, max) << ' ';
    }
    cout << endl;

    cout << "알파벳을 랜덤하게 10개 출력합니다" << endl;
    for (int i = 0; i < 10; i++) {
        cout << Random::nextAlphabet() << ' ';
    }
    cout << endl;

    cout << "랜덤한 실수를 10개 출력합니다" << endl;
    for (int i = 0; i < 10; i++) {
        cout << Random::nextDouble() << ' ';
    }
}

int Random::nextInt(int min, int max)
{
    return rand() % (max - min + 1) + min;
}

char Random::nextAlphabet()
{
    if (rand() % 2 == 0) return rand() % 26 + 'a';
    else return rand() % 26 + 'A';
}

double Random::nextDouble()
{
    return (double)rand() / RAND_MAX;
}
