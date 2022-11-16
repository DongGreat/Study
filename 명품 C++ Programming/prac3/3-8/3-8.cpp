#include <iostream>
#include <string>
using namespace std;

#include "Integer.h"

int main()
{
    Integer n(30);
    cout << n.get() << ' ';
    n.set(50);
    cout << n.get() << ' ';

    Integer m("300");
    cout << m.get() << ' ';
    cout << m.isEven();
}