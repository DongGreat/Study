#include <iostream>
#include <string>
using namespace std;

class Date
{
	int year, month, day;
public:
	Date(int year, int month, int day);
	Date(string date);
	void show();
	int getYear();
	int getMonth();
	int getDay();
};

Date::Date(int year, int month, int day)
{
	this->year = year;
	this->month = month;
	this->day = day;
}

Date::Date(string date)
{
	this->year = stoi(date.substr(0, date.find('/')));
	date.erase(0, date.find('/') + 1);
	this->month = stoi(date.substr(0, date.find('/')));
	date.erase(0, date.find('/') + 1);
	this->day = stoi(date.substr(0, date.find('/')));
}

void Date::show()
{
	cout << year << "년" << month << "월" << day << "일" << endl;
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

int main()
{
    Date birth(2014, 3, 20);
    Date independenceDay("1945/8/15");
    independenceDay.show();
    cout << birth.getYear() << ',' << birth.getMonth() << ',' << birth.getDay() << endl;
}