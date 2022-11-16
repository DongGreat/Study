#include <iostream>
using namespace std;

#include "Circle.h"
#include "CircleManager.h"

int main()
{
    cout << "원의 개수 >> ";
    int n;
    cin >> n;
    CircleManager cm(4);
    cm.searchByName();
    cm.searchByArea();
}