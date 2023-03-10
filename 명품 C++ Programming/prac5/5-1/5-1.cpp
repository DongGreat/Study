#include <iostream>
using namespace std;

class Circle
{
	int radius;
public:
	Circle(int r) { this->radius = r; }
	int getRadius();
	void swap(Circle& c1, Circle& c2);
};

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

int main()
{
    Circle c1(1), c2(10);
    cout << c1.getRadius() << ", " << c2.getRadius() << endl;
    c1.swap(c1, c2);
    cout << c1.getRadius() << ", " << c2.getRadius() << endl;
}