#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;

#include "Random.h"

Random::Random()
{
	srand((unsigned)time(0));
}

int Random::next()
{
	int n = rand();
	return n;
}

int Random::nextInRange(int a, int b)
{
	int n = rand() % (b - a + 1) + a;
	return n;
}
