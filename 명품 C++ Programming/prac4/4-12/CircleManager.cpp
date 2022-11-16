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
		cout << "�� " << i + 1 << "�� �̸��� ������ >> ";
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
	cout << "�˻��ϰ��� �ϴ� ���� �̸� >> ";
	string name;
	cin >> name;
	for (int i = 0; i < size; i++) {
		if (!p[i].getName().compare(name)) {
			cout << name << "�� ������ " << p[i].getArea() << endl;
		}
	}
}

void CircleManager::searchByArea()
{
	cout << "�ּ� ������ ������ �Է��ϼ��� >> ";
	int num;
	cin >> num;
	cout << num << "���� ū ���� �˻��մϴ�." << endl;
	for (int i = 0; i < size; i++) {
		if (p[i].getArea() > num) {
			cout << p[i].getName() << "�� ������ " << p[i].getArea() << ",";
		}
	}
	cout << endl;
}
