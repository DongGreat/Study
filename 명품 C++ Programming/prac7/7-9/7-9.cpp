#include <iostream>
using namespace std;

class Circle {
    int radius;
public:
    Circle(int radius = 0) { this->radius = radius; }
    void show() { cout << "radius = " << radius << "인 원" << endl; }
    friend Circle operator+(int x, Circle op2);
};

Circle operator+(int x, Circle op2) {
    op2.radius += x;
    return op2;
}

int main()
{
    Circle a(5), b(4);
    b = 1 + a;
    a.show();
    b.show();
}