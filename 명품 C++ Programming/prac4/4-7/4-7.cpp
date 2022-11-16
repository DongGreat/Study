#include <iostream>
using namespace std;

#include "Circle.h"

int main()
{
    Circle* circleArray = new Circle[3];
    int radius, cnt = 0;
    for (int i = 0; i < 3; i++) {
        cout << "원 " << i + 1 << "의 반지름 >> ";
        cin >> radius;
        circleArray[i].setRadius(radius);
        if (circleArray[i].getArea() > 100) {
            cnt++;
        }
    }
    cout << "면적이 100보다 큰 원은 " << cnt << "개 입니다";
}