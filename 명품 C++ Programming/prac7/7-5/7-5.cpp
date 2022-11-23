#include <iostream>
using namespace std;

class Color {
    int r, g, b;
public:
    Color(int a = 0, int b = 0, int c = 0) { this->r = a; this->g = b; this->b = c; }
    void show();
    //Color operator+(Color c);
    //bool operator==(Color c);
    friend Color operator+(Color op1, Color op2);
    friend bool operator==(Color op1, Color op2);
};

void Color::show() {
    cout << this->r << ' ' << this->g << ' ' << this->b << endl;
}

//Color Color::operator+(Color c) {
//    Color temp;
//    temp.r = this->r + c.r;
//    temp.g = this->g + c.g;
//    temp.b = this->b + c.b;
//    return temp;
//}
//
//bool Color::operator==(Color c) {
//    if (this->r == c.r && this->g == c.g && this->b == c.b) return true;
//    else return false;
//}

Color operator+(Color op1, Color op2) {
    Color temp;
    temp.r = op1.r + op2.r;
    temp.g = op1.g + op2.g;
    temp.b = op1.b + op2.b;
    return temp;
}

bool operator==(Color op1, Color op2) {
    if (op1.r == op2.r && op1.g == op2.g && op1.b == op2.b) return true;
    else return false;
}

int main()
{
    Color red(255, 0, 0), blue(0, 0, 255), c;
    c = red + blue;
    c.show();
    
    Color fuchsia(255, 0, 255);
    if (c == fuchsia) cout << "보라색 맞음";
    else cout << "보라색 아님";
}
