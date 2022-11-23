#include <iostream>
using namespace std;

class Stack {
    int* num;
    int top;
public:
    Stack() { num = new int[10]; top = 0; }
    ~Stack() { delete[] num; }
    Stack& operator<<(int n);
    void operator>>(int& n);
    bool operator!();
};

Stack& Stack::operator<<(int n) {
    num[top++] = n;
    return *this;
}

void Stack::operator>>(int& n) {
    n = num[--top];
}

bool Stack::operator!() {
    if (top == 0) return true;
    else return false;
}

int main()
{
    Stack stack;
    stack << 3 << 5 << 10;
    while (true) {
        if (!stack) break;
        int x;
        stack >> x;
        cout << x << ' ';
    }
    cout << endl;
}