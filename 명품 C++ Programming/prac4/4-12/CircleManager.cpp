#include <iostream>
using namespace std;

#include "CircleManager.h"

CircleManager::CircleManager(int size)
{
	this->size = size;
	p = new Circle[size];
	string name;
	int radius;
	for (int i = 0; i < size; i++) {
		cout << "원 " << i + 1 << "의 이름과 반지름 >> ";
		cin >> name >> radius;
		p[i].setCircle(name, radius);
	}
}

CircleManager::~CircleManager()
{
	delete[] p;
}

void CircleManager::searchByName()
{
	cout << "검색하고자 하는 원의 이름 >> ";
	string name;
	cin >> name;
	for (int i = 0; i < size; i++) {
		if (!p[i].getName().compare(name)) {
			cout << name << "의 면적은 " << p[i].getArea() << endl;
		}
	}
}

void CircleManager::searchByArea()
{
	cout << "최소 면적을 정수로 입력하세요 >> ";
	int num;
	cin >> num;
	cout << num << "보다 큰 원을 검색합니다." << endl;
	for (int i = 0; i < size; i++) {
		if (p[i].getArea() > num) {
			cout << p[i].getName() << "의 면적은 " << p[i].getArea() << ",";
		}
	}
	cout << endl;
}
