#include <iostream>
using namespace std;

template <class T>
T biggest(T data[], int n) {
    T max = 0;
    for (int i = 0; i < n; i++) {
        if (data[i] > max) {
            max = data[i];
        }
    }
    return max;
}

int main()
{
    int x[] = { 1, 10, 100, 5, 4 };
    cout << biggest(x, 5) << endl;
    double y[] = { 6.4, 3.3, -200.6, 7.7, 8.8, 20.3 };
    cout << biggest(y, 6);
}