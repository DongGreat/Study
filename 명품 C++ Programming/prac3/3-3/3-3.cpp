#include <iostream>
#include <string>
using namespace std;

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

int main()
{
    Account a("kitae", 1, 5000);
    a.deposit(50000);
    cout << a.getOwner() << "의 잔액은 " << a.inquiry() << endl;
    int money = a.withdraw(20000);
    cout << a.getOwner() << "의 잔액은 " << a.inquiry() << endl;
}