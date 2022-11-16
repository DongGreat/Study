#include <iostream>
using namespace std;

#include "SelectableRandom.h"

int main()
{
    SelectableRandom even_r(1);
    SelectableRandom odd_r(0);
    cout << "-- 0에서" << RAND_MAX << "까지의 짝수 랜덤 정수 10 개 --" << endl;
    for (int i = 0; i < 10; i++) {
        int n = even_r.next();
        cout << n << ' ';
    }
    cout << endl << endl << "-- 2에서 " << "9 까지의 랜덤 홀수 정수 10 개 --" << endl;
    for (int i = 0; i < 10; i++) {
        int n = odd_r.nextInRange(2, 9);
        cout << n << ' ';
    }
    cout << endl;
}