#include <iostream>
using namespace std;

template <class T>
T* concat(T a[], int sizea, T b[], int sizeb) {
    T* p = new T[sizea + sizeb];
    for (int i = 0; i < sizea; i++) {
        p[i] = a[i];
    }
    for (int i = 0; i < sizeb; i++) {
        p[i + sizea] = b[i];
    }
    return p;
}

int main()
{
    double x[] = { 0.1, 0.2, 0.3 };
    double y[] = { 1, 2, 3 };

    double* p = concat(x, 3, y, 3);
    for (int i = 0; i < 6; i++) {
        cout << p[i] << ' ';
    }
}