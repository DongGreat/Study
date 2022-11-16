#pragma once
class Date
{
	int year, month, day;
	string date;
public:
	Date(int year, int month, int day);
	Date(string date);
	void show();
	int getYear();
	int getMonth();
	int getDay();
};

