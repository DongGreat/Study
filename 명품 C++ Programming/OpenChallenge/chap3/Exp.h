#pragma once
class Exp
{
private:
	int base;
	int jisu;
public:
	Exp();
	Exp(int base);
	Exp(int base, int jisu);
	int getValue();
	int getBase();
	int getExp();
	bool equals(Exp b);
};

