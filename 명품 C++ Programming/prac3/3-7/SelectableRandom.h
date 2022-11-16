#pragma once
class SelectableRandom
{
	int isEven;
public:
	SelectableRandom(int even_odd);
	int next();
	int nextInRange(int a, int b);
};

