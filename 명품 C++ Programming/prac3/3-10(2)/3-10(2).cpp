#include <iostream>
using namespace std;

#include "Add.h"
#include "Sub.h"
#include "Mul.h"
#include "Div.h"

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