#include <iostream>
using namespace std;

class Tower
{
	int height;
public:
	Tower();
	Tower(int height);
	int getHeight();
};

Tower::Tower() {
	height = 1;
}

Tower::Tower(int height) {
	this->height = height;
}

int Tower::getHeight() {
	return height;
}

int main()
{
    Tower myTower; // 1 미터
    Tower seoulTower(100); // 100미터
    cout << "높이는 " << myTower.getHeight() << "미터" << endl;
    cout << "높이는 " << seoulTower.getHeight() << "미터" << endl;
}