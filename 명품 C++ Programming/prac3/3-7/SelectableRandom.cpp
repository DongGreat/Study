#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;

#include "SelectableRandom.h"

SelectableRandom::SelectableRandom(int isEven)
{
	this->isEven = isEven; // 1ÀÌ¸é Â¦¼ö 0ÀÌ¸é È¦¼ö
	srand((unsigned)time(0));
}

int SelectableRandom::next()
{
	int n;
	if (isEven == 1) {
		do
		{
			n = rand();
		} while (n % 2 == 1);
		return n;
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
	if (isEven == 1) {
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
