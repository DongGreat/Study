#include <iostream>
using namespace std;

class Matrix {
    int num[4];
public:
    Matrix(int a = 0, int b = 0, int c = 0, int d = 0) { num[0] = a; num[1] = b; num[2] = c; num[3] = d; }
    void show() { cout << "Matrix = { " << num[0] << ' ' << num[1] << ' ' << num[2] << ' ' << num[3] << " }" << endl; }
    //Matrix operator+(Matrix m);
    //Matrix& operator+=(Matrix m);
    //bool operator==(Matrix m);
    friend Matrix operator+(Matrix op1, Matrix op2);
    friend void operator+=(Matrix& op1, Matrix op2);
    friend bool operator==(Matrix op1, Matrix op2);
};

//Matrix Matrix::operator+(Matrix m) {
//    Matrix temp;
//    for (int i = 0; i < 4; i++) {
//        temp.num[i] = this->num[i] + m.num[i];
//    }
//    return temp;
//}
//
//Matrix& Matrix::operator+=(Matrix m) {
//    for (int i = 0; i < 4; i++) {
//        this->num[i] += m.num[i];
//    }
//    return *this;
//}
//
//bool Matrix::operator==(Matrix m) {
//    for (int i = 0; i < 4; i++) {
//        if (this->num[i] != m.num[i]) return false;
//    }
//    return true;
//}

Matrix operator+(Matrix op1, Matrix op2) {
    Matrix temp;
    for (int i = 0; i < 4; i++) {
        temp.num[i] = op1.num[i] + op2.num[i];
    }
    return temp;
}

void operator+=(Matrix& op1, Matrix op2) {
    for (int i = 0; i < 4; i++) {
        op1.num[i] += op2.num[i];
    }
}

bool operator==(Matrix op1, Matrix op2) {
    for (int i = 0; i < 4; i++) {
        if (op1.num[i] != op2.num[i]) return false;
    }
    return true;
}

int main()
{
    Matrix a(1, 2, 3, 4), b(2, 3, 4, 5), c;
    c = a + b;
    a += b;
    a.show(); b.show(); c.show();
    if(a==c) cout << "a and c are the same" << endl;
}