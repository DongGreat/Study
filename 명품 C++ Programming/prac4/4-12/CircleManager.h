#include "Circle.h"

#pragma once
class CircleManager
{
	Circle* p;
	int size;
public:
	CircleManager(int size);
	~CircleManager();
	void searchByName();
	void searchByArea();
};

