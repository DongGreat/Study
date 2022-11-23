#include <iostream>
using namespace std;

class Matrix {
    int num[4];
public:
    Matrix(int a = 0, int b = 0, int c = 0, int d = 0) { num[0] = a; num[1] = b; num[2] = c; num[3] = d; }
    void show();
    //void operator>>(int* a);
    //void operator<<(int* a);
    friend void operator>>(Matrix m, int* a);
    friend void operator<<(Matrix& m, int* a);
};

void Matrix::show() {
    cout << "Matrix = { ";
    for (int i = 0; i < 4; i++) {
        cout << num[i] << ' ';
    }
    cout << '}' << endl;
}

//void Matrix::operator>>(int* a) {
//    for (int i = 0; i < 4; i++) a[i] = this->num[i];
//}
//
//void Matrix::operator<<(int* a) {
//    for (int i = 0; i < 4; i++) this->num[i] = a[i];
//}

void operator>>(Matrix m, int* a) {
    for (int i = 0; i < 4; i++) a[i] = m.num[i];
}

void operator<<(Matrix& m, int* a) {
    for (int i = 0; i < 4; i++) m.num[i] = a[i];
}

int main()
{
    Matrix a(4, 3, 2, 1), b;
    int x[4], y[4] = { 1, 2, 3, 4 };
    a >> x;
    b << y;
    for (int i = 0; i < 4; i++) cout << x[i] << ' ';
    cout << endl;
    b.show();
}