#include <iostream>
using namespace std;

class Circle
{
    int radius;
public:
    void setRadius(int radius);
    double getArea();
};

void Circle::setRadius(int radius)
{
    this->radius = radius;
}

double Circle::getArea()
{
    return 3.14 * radius * radius;
}

int main()
{
    int n;
    cout << "원의 개수 >> ";
    cin >> n;
    Circle* circle = new Circle[n];
    int radius, cnt = 0;
    for (int i = 0; i < n; i++) {
        cout << "원 " << i + 1 << "의 반지름 >> ";
        cin >> radius;
        circle[i].setRadius(radius);
        if (circle[i].getArea() > 100) {
            cnt++;
        }
    }
    cout << "면적이 100보다 큰 원은 " << cnt << "개 입니다";
    delete[] circle;
}