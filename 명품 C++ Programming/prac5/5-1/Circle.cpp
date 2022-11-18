#include "Circle.h"

int Circle::getRadius()
{
	return radius;
}

void Circle::swap(Circle& a, Circle& b)
{
	Circle temp = a;
	a = b;
	b = temp;
}
