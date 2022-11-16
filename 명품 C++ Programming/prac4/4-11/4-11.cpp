#include <iostream>
using namespace std;

class Container {
    int size;
public:
    Container() { size = 10; }
    void fill();
    void consume();
    int getSize();
};

class CoffeeVendingMachine {
    Container tong[3];
    void fill();
    void selectEspresso();
    void selectAmericano();
    void selectSugarCoffee();
    void show();
public:
    void run();
};

int main()
{
    CoffeeVendingMachine machine;
    machine.run();
}

void Container::fill()
{
    size = 10;
}

void Container::consume()
{
    size--;
}

int Container::getSize()
{
    return size;
}

void CoffeeVendingMachine::fill()
{
    for (int i = 0; i < 3; i++) {
        tong[i].fill();
    }
    cout << "커피 " << tong[0].getSize() << ", 물 " << tong[1].getSize() << ", 설탕 " << tong[2].getSize() << endl;
}

void CoffeeVendingMachine::selectEspresso()
{
    if (tong[0].getSize() < 1 || tong[1].getSize() < 1) {
        cout << "원료가 부족합니다." << endl;
        return;
    }
    tong[0].consume();
    tong[1].consume();
    cout << "에스프레소 드세요" << endl;
}

void CoffeeVendingMachine::selectAmericano()
{
    if (tong[0].getSize() < 1 || tong[1].getSize() < 2) {
        cout << "원료가 부족합니다." << endl;
        return;
    }
    tong[0].consume();
    tong[1].consume();
    tong[1].consume();
    cout << "아메리카노 드세요" << endl;
}

void CoffeeVendingMachine::selectSugarCoffee()
{
    if (tong[0].getSize() < 1 || tong[1].getSize() < 2 || tong[2].getSize() < 1) {
        cout << "원료가 부족합니다." << endl;
        return;
    }
    tong[0].consume();
    tong[1].consume();
    tong[1].consume();
    tong[2].consume();
    cout << "설탕커피 드세요" << endl;
}

void CoffeeVendingMachine::show()
{
    cout << "커피 " << tong[0].getSize() << ", 물 " << tong[1].getSize() << ", 설탕 " << tong[2].getSize() << endl;
}

void CoffeeVendingMachine::run()
{
    int n;
    cout << "***** 커피자판기를 작동합니다. *****" << endl;
    while (true) {
        cout << "메뉴를 눌러주세요(1:에스프레소, 2:아메리카노, 3:설탕커피, 4:잔량보기, 5:채우기)>> ";
        cin >> n;
        switch (n)
        {
        case 1:
            selectEspresso();
            break;
        case 2:
            selectAmericano();
            break;
        case 3:
            selectSugarCoffee();
            break;
        case 4:
            show();
            break;
        case 5:
            fill();
            break;
        default:
            break;
        }
    }
}
