#include "Tower.h"

Tower::Tower() {
	height = 1;
}

Tower::Tower(int height) {
	this->height = height;
}

int Tower::getHeight() {
	return height;
}