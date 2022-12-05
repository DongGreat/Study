#include <iostream>
using namespace std;

template <class T>
T* remove(T src[], int sizeSrc, T minus[], int sizeMinus, int& retSize) {
    T* tmp = new T[sizeSrc + sizeMinus];
    int j;
    for (int i = 0; i < sizeSrc; i++) {
        for (j = 0; j < sizeMinus; j++) {
            if (src[i] == minus[j]) {
                break;
            }
        }
        if (j == sizeMinus) {
            tmp[retSize++] = src[i];
        }
    }
    return tmp;
}

int main()
{
    double x[] = { 0.1, 0.2, 0.3, 0.4, 0.5 };
    double y[] = { 0.2, 0.4 };
    int retSize = 0;

    double* p = remove(x, 5, y, 2, retSize);
    for (int i = 0; i < retSize; i++) {
        cout << p[i] << ' ';
    }
}