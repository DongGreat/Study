#include <iostream>
#include <string>
using namespace std;

class Circle {
    string name;
    int radius;
public:
    Circle(int radius = 1, string name = "") {
        this->radius = radius; this->name = name;
    }
    friend istream& operator>>(istream& is, Circle& c);
    friend ostream& operator<<(ostream& os, Circle c);
};

istream& operator>>(istream& is, Circle& c) {
    cout << "반지름 >> ";
    is >> c.radius;
    cout << "이름 >> ";
    is >> c.name;
    return is;
}

ostream& operator<<(ostream& os, Circle c) {
    os << "(반지름" << c.radius << "인 " << c.name << ")";
    return os;
}

int main()
{
    Circle d, w;
    cin >> d >> w;
    cout << d << w << endl;
}