#pragma once
class Sub
{
	int a, b;
public:
	Sub() { a = b = 1; }
	void setValue(int x, int y);
	int calculate();
};

