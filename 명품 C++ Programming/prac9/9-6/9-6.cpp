#include <iostream>
using namespace std;

class AbstractStack {
public:
    virtual bool push(int n) = 0;
    virtual bool pop(int& n) = 0;

    virtual int size() = 0;
};

class IntStack : public AbstractStack {
    int* n;
    int top;
public:
    IntStack() {
        this->n = new int[10];
        this->top = 0;
    }
    ~IntStack() { delete[] n; }
    bool push(int n) {
        if (size() < 10) { // 0 1 2 3 4
            this->n[top++] = n;
            return true;
        }
        else {
            cout << "Full" << endl;
            return false;
        }
    }
    bool pop(int& n) {
        if (size() > 0) {
            n = this->n[--top];
            return true;
        }
        else {
            cout << "Empty" << endl;
            return false;
        }
    }
    int size() { return top; }
    void show() {
        for (int i = 0; i < size(); i++) {
            cout << this->n[i];
        }
    }
};

int main()
{
    IntStack intStack;

    intStack.push(1);
    intStack.push(2);
    intStack.push(3);
    intStack.push(4);
    intStack.push(5);
    intStack.push(6);

    int n;
    intStack.pop(n);
    cout << n << endl;

    intStack.show();
}