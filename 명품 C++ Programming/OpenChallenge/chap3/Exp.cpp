using namespace std;

#include "Exp.h"

Exp::Exp() {
	base = 1;
	jisu = 1;
}

Exp::Exp(int base) {
	this->base = base;
}

Exp::Exp(int base, int jisu) {
	this->base = base;
	this->jisu = jisu;
}

int Exp::getValue() {
	int result = base;
	for (int i = 1; i < jisu; i++) {
		result *= base;
	}
	return result;
}

int Exp::getBase() {
	return base;
}

int Exp::getExp() {
	return jisu;
}

bool Exp::equals(Exp b) {
	if (getValue() == b.getValue()) {
		return true;
	}
	else {
		return false;
	}
}