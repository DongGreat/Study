#include <iostream>
#include <string>
using namespace std;

#include "Account.h"

Account::Account(string name, int id, int balance)
{
	this->name = name;
	this->id = id;
	this->balance = balance;
}

string Account::getOwner()
{
	return name;
}

void Account::deposit(int money)
{
	balance += money;
}

int Account::withdraw(int money)
{
	balance -= money;
	return money;
}

int Account::inquiry()
{
	return balance;
}
