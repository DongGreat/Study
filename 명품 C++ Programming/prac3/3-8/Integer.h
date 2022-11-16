#include <string>

#pragma once
class Integer
{
	int n;
public:
	Integer(int n) { this->n = n; }
	Integer(string s) { this->n = stoi(s); }
	int get();
	void set(int a);
	bool isEven();
};

inline int Integer::get() {
	return n;
}

inline void Integer::set(int a) {
	n = a;
}

inline bool Integer::isEven() {
	if (n % 2 == 0) {
		return true;
	}
	else {
		return false;
	}
}