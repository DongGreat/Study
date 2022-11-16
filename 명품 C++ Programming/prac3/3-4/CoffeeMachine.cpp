#include <iostream>
using namespace std;

#include "CoffeeMachine.h"

CoffeeMachine::CoffeeMachine(int coffee, int water, int sugar)
{
	this->coffee = coffee;
	this->water = water;
	this->sugar = sugar;
}

void CoffeeMachine::drinkEspresso()
{
	coffee -= 1;
	water -= 1;
}

void CoffeeMachine::drinkAmericano()
{
	coffee -= 1;
	water -= 2;
}

void CoffeeMachine::drinkSugarCoffee()
{
	coffee -= 1;
	water -= 2;
	sugar -= 1;
}

void CoffeeMachine::fill()
{
	coffee = 10;
	water = 10;
	sugar = 10;
}

void CoffeeMachine::show()
{
	cout << "커피 머신 상태, 커피:" << coffee << "\t 물:" << water << "\t설탕:" << sugar << endl;
}
