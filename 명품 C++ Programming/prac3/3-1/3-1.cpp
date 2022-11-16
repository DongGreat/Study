#include <iostream>
using namespace std;

#include "Tower.h"

int main()
{
    Tower myTower; // 1 미터
    Tower seoulTower(100); // 100미터
    cout << "높이는 " << myTower.getHeight() << "미터" << endl;
    cout << "높이는 " << seoulTower.getHeight() << "미터" << endl;
}