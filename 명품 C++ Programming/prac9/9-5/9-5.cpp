#include <iostream>
using namespace std;

class AbstractGate {
protected:
    bool x, y;
public:
    void set(bool x, bool y) { this->x = x; this->y = y; }
    virtual bool operation() = 0;
};

class ORGate : public AbstractGate {
public:
    bool operation() {
        if (x || y) return true; // 둘 중 하나라도 참일 경우 1
        else return false;
    }
};

class XORGate : public AbstractGate {
public:
    bool operation() {
        if (x != y) return true; // 두 값이 다를 경우 1
        else return false;
    }
};

class ANDGate : public AbstractGate {
public:
    bool operation() {
        if (x && y) return true; // 둘 다 참일 경우 1
        else return false;
    }
};

int main()
{
    ANDGate andGate;
    ORGate orGate;
    XORGate xorGate;

    andGate.set(true, false);
    orGate.set(true, false);
    xorGate.set(true, false);
    cout.setf(ios::boolalpha);
    cout << andGate.operation() << endl;
    cout << orGate.operation() << endl;
    cout << xorGate.operation() << endl;
}