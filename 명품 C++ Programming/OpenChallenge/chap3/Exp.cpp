using namespace std;

#include "Exp.h"

Exp::Exp() {
	base = 1;
	exp = 1;
}

Exp::Exp(int base) {
	this->base = base;
	exp = 1;
}

Exp::Exp(int base, int exp) {
	this->base = base;
	this->exp = exp;
}

int Exp::getValue() {
	int result = 1;
	for (int i = 0; i < exp; i++) {
		result *= base;
	}
	return result;
}

int Exp::getBase() {
	return base;
}

int Exp::getExp() {
	return exp;
}

bool Exp::equals(Exp b) {
	if (getValue() == b.getValue()) {
		return true;
	}
	else {
		return false;
	}
}