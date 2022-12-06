#include <iostream>
#include <iomanip>
using namespace std;

class CoffeeMachine {
    int coffee, sugar, cream, water, cup;
public:
    CoffeeMachine() {
        coffee = sugar = cream = water = cup = 3;
    }
    void orderCoffee() {
        coffee--; cream--; water--; cup--;
    }
    void orderSugar() {
        coffee--; sugar--; water--; cup--;
    }
    void orderBlack() {
        coffee--; water--; cup--;
    }
    void fill() {
        coffee = sugar = cream = water = cup = 3;
    }
    bool isEnough() {
        if (coffee == 0 || sugar == 0 || cream == 0 || water == 0 || cup == 0)
            return false;
        else
            return true;
    }
    void show() {
        cout << setw(8) << "Coffee";
        for (int i = 0; i < coffee; i++) cout << '*';
        cout << endl;
        cout << setw(8) << "Sugar";
        for (int i = 0; i < sugar; i++) cout << '*';
        cout << endl;
        cout << setw(8) << "Cream";
        for (int i = 0; i < cream; i++) cout << '*';
        cout << endl;
        cout << setw(8) << "Water";
        for (int i = 0; i < water; i++) cout << '*';
        cout << endl;
        cout << setw(8) << "Cup";
        for (int i = 0; i < cup; i++) cout << '*';
        cout << endl << endl;
    }
    void run() {
        cout << "------명품 커피 자판기랍니다.------" << endl;
        show();
        int n;
        while (true) {
            cout << "보통 커피:0, 설탕 커피:1, 블랙 커피:2, 채우기:3, 종료:4>> ";
            cin >> n;
            if (n == 0) {
                if (isEnough()) {
                    orderCoffee();
                    cout << "맛있는 커피 나왔습니다~~" << endl;
                }
                else
                    cout << "재료가 부족합니다." << endl;
            }
            else if (n == 1) {
                if (isEnough()) {
                    orderSugar();
                    cout << "맛있는 설탕 커피 나왔습니다~~" << endl;
                }
                else
                    cout << "재료가 부족합니다." << endl;
            }
            else if (n == 2) {
                if (isEnough()) {
                    orderBlack();
                    cout << "맛있는 블랙 커피 나왔습니다~~" << endl;
                }
                else
                    cout << "재료가 부족합니다." << endl;
            }
            else if (n == 3) {
                fill();
                cout << "모든 통을 채웁니다.~~" << endl;
            }
            else if (n == 4) break;
            show();
        }
    }
};

int main()
{
    cout.setf(ios::left);
    CoffeeMachine c;
    c.run();
}