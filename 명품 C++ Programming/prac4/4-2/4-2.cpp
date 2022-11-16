#include <iostream>
using namespace std;

int main()
{
    cout << "정수 5개 입력>> ";
    int n = 5;
    int* p = new int[n];
    double sum = 0;
    for (int i = 0; i < n; i++) {
        cin >> p[i];
        sum += p[i];
    }
    cout << "평균 " << sum / n;
}