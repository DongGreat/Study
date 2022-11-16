#include <iostream>
using namespace std;

class Add
{
	int a, b;
public:
	Add() { a = b = 1; }
	void setValue(int x, int y);
	int calculate();
};

class Sub
{
	int a, b;
public:
	Sub() { a = b = 1; }
	void setValue(int x, int y);
	int calculate();
};

class Mul
{
	int a, b;
public:
	Mul() { a = b = 1; }
	void setValue(int x, int y);
	int calculate();
};

class Div
{
	int a, b;
public:
	Div() { a = b = 1; }
	void setValue(int x, int y);
	int calculate();
};

int main()
{
	Add a;
	Sub s;
	Mul m;
	Div d;

	int num1, num2;
	char op;

    while (true) {
        cout << "두 정수와 연산자를 입력하세요>>";
        cin >> num1 >> num2 >> op;
        switch (op) {
		case '+':
			a.setValue(num1, num2);
			cout << a.calculate() << endl;
			break;
		case '-':
			s.setValue(num1, num2);
			cout << s.calculate() << endl;
			break;
		case '*':
			m.setValue(num1, num2);
			cout << m.calculate() << endl;
			break;
		case '/':
			d.setValue(num1, num2);
			cout << d.calculate() << endl;
			break;
        }
    }
}

void Add::setValue(int x, int y)
{
	a = x;
	b = y;
}

int Add::calculate()
{
	return a + b;
}

void Sub::setValue(int x, int y)
{
	a = x;
	b = y;
}

int Sub::calculate()
{
	return a - b;
}

void Mul::setValue(int x, int y)
{
	a = x;
	b = y;
}

int Mul::calculate()
{
	return a * b;
}

void Div::setValue(int x, int y)
{
	a = x;
	b = y;
}

int Div::calculate()
{
	return a / b;
}