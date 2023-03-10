#include <iostream>
using namespace std;

class AbstractStack {
public:
    virtual bool push(int n) = 0;
    virtual bool pop(int& n) = 0;

    virtual int size() = 0;
};

class IntStack : public AbstractStack {
    int* mem;
    int capacity;
    int top;
public:
    IntStack(int capacity) {
        this->capacity = capacity;
        this->mem = new int[capacity];
        this->top = 0;
    }
    ~IntStack() { delete[] mem; }
    bool push(int n) {
        if (top < capacity) {
            this->mem[top++] = n;
            return true;
        }
        else {
            cout << "stack is full" << endl;
            return false;
        }
    }
    bool pop(int& n) {
        if (top > 0) {
            n = this->mem[--top];
            return true;
        }
        else {
            cout << "stack is empty" << endl;
            return false;
        }
    }
    int size() { return capacity; }
};

int main()
{
    IntStack intStack(5);

    for (int i = 0; i < 6; i++) {
        if (intStack.push(i + 1))
            cout << "push " << i + 1 << endl;
    }

    int n;
    for (int i = 0; i < 6; i++) {
        if (intStack.pop(n))
            cout << "pop " << n << endl;
    }
}