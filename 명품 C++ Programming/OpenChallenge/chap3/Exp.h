#pragma once
class Exp
{
private:
	int base;
	int exp;
public:
	Exp();
	Exp(int base);
	Exp(int base, int exp);
	int getValue();
	int getBase();
	int getExp();
	bool equals(Exp b);
};

