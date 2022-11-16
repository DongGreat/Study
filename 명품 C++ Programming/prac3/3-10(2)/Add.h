#pragma once
class Add
{
	int a, b;
public:
	Add() { a = b = 1; }
	void setValue(int x, int y);
	int calculate();
};

