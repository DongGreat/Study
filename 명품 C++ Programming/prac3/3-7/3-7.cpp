#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;

class SelectableRandom
{
    int even_odd;
public:
    SelectableRandom(int even_odd);
    int next();
    int nextInRange(int a, int b);
};

SelectableRandom::SelectableRandom(int even_odd)
{
	this->even_odd = even_odd; // 1이면 짝수 0이면 홀수
	srand((unsigned)time(0));
}

int SelectableRandom::next()
{
	int n;
	if (even_odd == 1) {
		do
		{
			n = rand();
		} while (n % 2 == 1); // 랜덤 값이 홀수면 다시 반복
		return n; // 짝수 리턴
	}
	else {
		do
		{
			n = rand();
		} while (n % 2 == 0);
		return n;
	}
}

int SelectableRandom::nextInRange(int a, int b)
{
	int n;
	if (even_odd == 1) {
		do
		{
			n = rand() % (b - a + 1) + a;
		} while (n % 2 == 1);
		return n;
	}
	else {
		do
		{
			n = rand() % (b - a + 1) + a;
		} while (n % 2 == 0);
		return n;
	}
}

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