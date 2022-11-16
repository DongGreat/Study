#pragma once
class Account
{
	string name;
	int id, balance;
public:
	Account(string name, int id, int balance);
	string getOwner();
	void deposit(int money);
	int withdraw(int money);
	int inquiry();
};

