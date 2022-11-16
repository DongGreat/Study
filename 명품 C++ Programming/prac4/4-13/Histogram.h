#include <string>
using namespace std;

#pragma once
class Histogram
{
	string s;
public:
	Histogram(string s) { this->s = s; this->s.append("\n"); }
	void put(string s);
	void putc(char c);
	void print();
};

