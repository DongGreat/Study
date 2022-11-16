#include <iostream>
using namespace std;

#include "Sample.h"

void Sample::read()
{
	for (int i = 0; i < size; i++) {
		cin >> p[i];
	}
}

void Sample::write()
{
	for (int i = 0; i < size; i++) {
		cout << p[i] << ' ';
	}
	cout << endl;
}

int Sample::big()
{
	int max = p[0];
	for (int i = 0; i < size; i++) {
		if (p[i] >= max) max = p[i];
	}
	return max;
}

Sample::~Sample()
{
	delete[] p;
}
