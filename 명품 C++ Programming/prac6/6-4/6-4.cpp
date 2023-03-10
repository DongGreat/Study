#include <iostream>
using namespace std;

class MyVector {
    int* mem;
    int size;
public:
    MyVector(int n = 100, int val = 0);
    ~MyVector() { delete[] mem; }
    void show();
};

MyVector::MyVector(int n, int val) {
    mem = new int[n];
    size = n;
    for (int i = 0; i < size; i++) mem[i] = val;
}

void MyVector::show()
{
    cout << "size = " << size << endl << "val = ";
    for (int i = 0; i < size - 1; i++) {
        cout << mem[i] << ", ";
    }
    cout << mem[size - 1];
    cout << endl;
}

int main()
{
    MyVector a, b(10), c(10, 20);
    a.show();
    cout << endl;
    b.show();
    cout << endl;
    c.show();
}