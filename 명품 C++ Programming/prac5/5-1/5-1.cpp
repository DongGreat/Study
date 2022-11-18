#include <iostream>
using namespace std;

#include "Circle.h"

int main()
{
    Circle c1(1), c2(10);
    cout << c1.getRadius() << ", " << c2.getRadius() << endl;
    c1.swap(c1, c2);
    cout << c1.getRadius() << ", " << c2.getRadius() << endl;
}