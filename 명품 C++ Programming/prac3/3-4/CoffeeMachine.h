#pragma once
class CoffeeMachine
{
	int coffee, water, sugar;
public:
	CoffeeMachine(int coffee, int water, int sugar);
	void drinkEspresso();
	void drinkAmericano();
	void drinkSugarCoffee();
	void fill();
	void show();
};

