#include <iostream>
using namespace std;

void half(double& n);

int main()
{
    double n = 20;
    half(n);
    cout << n;
}

void half(double& n)
{
    n /= 2;
}
