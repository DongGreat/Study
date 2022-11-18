#pragma once
class Circle
{
	int radius;
public:
	Circle(int r) { this->radius = r; }
	int getRadius();
	void swap(Circle& c1, Circle& c2);
};

