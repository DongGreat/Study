#include <iostream>
using namespace std;

template <class T>
T* remove(T src[], int sizeSrc, T minus[], int sizeMinus, int& retSize) {
    retSize = sizeSrc;
    for (int i = 0; i < sizeSrc; i++) {
        for (int j = 0; j < sizeMinus; j++) {
            if (src[i] == minus[j]) {
                src[i] = NULL;
                retSize--;
                break;
            }
        }
    }
    if (retSize == 0) return 0;
    
    T* tmp = new T[retSize];
    int n = 0;
    for (int i = 0; i < sizeSrc; i++) {
        if (src[i] != NULL) {
            tmp[n] = src[i];
            n++;
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