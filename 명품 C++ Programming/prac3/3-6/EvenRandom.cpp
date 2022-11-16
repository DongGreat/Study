#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;

#include "EvenRandom.h"

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
