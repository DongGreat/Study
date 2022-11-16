#include <iostream>
#include <string>
using namespace std;

#include "Date.h"

Date::Date(int year, int month, int day)
{
	this->year = year;
	this->month = month;
	this->day = day;
}

Date::Date(string date)
{
	this->date = date;
}

void Date::show()
{
	int y = stoi(date.substr(0, date.find('/')));

	date.erase(0, date.find('/') + 1);
	int m = stoi(date.substr(0, date.find('/')));

	date.erase(0, date.find('/') + 1);
	int d = stoi(date.substr(0, date.find('/')));
	
	cout << y << "³â" << m << "¿ù" << d << "ÀÏ" << endl;
}

int Date::getYear()
{
	return year;
}

int Date::getMonth()
{
	return month;
}

int Date::getDay()
{
	return day;
}
