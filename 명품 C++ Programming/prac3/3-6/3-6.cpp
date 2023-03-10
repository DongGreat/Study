#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;

class EvenRandom
{
public:
    EvenRandom();
    int next();
    int nextInRange(int a, int b);
};

EvenRandom::EvenRandom()
{
    srand((unsigned)time(0));
}

int EvenRandom::next()
{
    int n;
    do
    {
        n = rand();
    } while (n % 2 == 1);
    return n;
}

int EvenRandom::nextInRange(int a, int b)
{
    int n;
    do
    {
        n = rand() % (b - a + 1) + a;
    } while (n % 2 == 1);
    return n;
}

int main()
{
    EvenRandom r;
    cout << "-- 0에서" << RAND_MAX << "까지의 랜덤 정수 10 개 --" << endl;
    for (int i = 0; i < 10; i++) {
        int n = r.next();
        cout << n << ' ';
    }
    cout << endl << endl << "-- 2에서 " << "10 까지의 랜덤 정수 10 개 --" << endl;
    for (int i = 0; i < 10; i++) {
        int n = r.nextInRange(2, 10);
        cout << n << ' ';
    }
    cout << endl;
}