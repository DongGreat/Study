#include <iostream>
#include <string>
#include <iomanip>
using namespace std;

class Material {
    string name;
    int size;
public:
    Material(string name = "", int size = 0) {
        this->name = name; this->size = size;
    }
    string getName() { return name; }
    int getSize() { return size; }
    void setMaterial(string name, int size) {
        this->name = name; this->size = size;
    }
    void consume() { size--; }
    void fill() { size = 3; }
};

class CoffeeMachine {
    Material* materials;
public:
    CoffeeMachine() {
        materials = new Material[5];
        materials[0].setMaterial("Coffee", 3);
        materials[1].setMaterial("Sugar", 3);
        materials[2].setMaterial("Cream", 3);
        materials[3].setMaterial("Water", 3);
        materials[4].setMaterial("Cup", 3);
    }
    ~CoffeeMachine() {
        delete[] materials;
    }
    bool orderCoffee() {
        if (materials[0].getSize() == 0 || materials[2].getSize() == 0 ||
            materials[3].getSize() == 0 || materials[4].getSize() == 0) {
            return false;
        }
        else {
            materials[0].consume();
            materials[2].consume();
            materials[3].consume();
            materials[4].consume();
            return true;
        }
    }
    bool orderSugar() {
        if (materials[0].getSize() == 0 || materials[1].getSize() == 0 ||
            materials[3].getSize() == 0 || materials[4].getSize() == 0) {
            return false;
        }
        else {
            materials[0].consume();
            materials[1].consume();
            materials[3].consume();
            materials[4].consume();
            return true;
        }
    }
    bool orderBlack() {
        if (materials[0].getSize() == 0 || materials[3].getSize() == 0 ||
            materials[4].getSize() == 0) {
            return false;
        }
        else {
            materials[0].consume();
            materials[3].consume();
            materials[4].consume();
            return true;
        }
    }
    void fill() {
        for (int i = 0; i < 5; i++)
            materials[i].fill();
    }
    void show() {
        for (int i = 0; i < 5; i++) {
            cout << setw(8) << materials[i].getName();
            for (int j = 0; j < materials[i].getSize(); j++) {
                cout << '*';
            }
            cout << endl;
        }
        cout << endl;
    }
    void run() {
        cout << "------명품 커피 자판기켭니다.------" << endl;
        show();
        int n;
        while (true) {
            cout << "보통 커피:0, 설탕 커피:1, 블랙 커피:2, 채우기:3, 종료:4>> ";
            cin >> n;
            if (n == 0) {
                if (orderCoffee()) {
                    cout << "맛있는 커피 나왔습니다~~" << endl;
                }
                else
                    cout << "재료가 부족합니다." << endl;
            }
            else if (n == 1) {
                if (orderSugar()) {
                    cout << "맛있는 설탕 커피 나왔습니다~~" << endl;
                }
                else
                    cout << "재료가 부족합니다." << endl;
            }
            else if (n == 2) {
                if (orderBlack()) {
                    cout << "맛있는 블랙 커피 나왔습니다~~" << endl;
                }
                else
                    cout << "재료가 부족합니다." << endl;
            }
            else if (n == 3) {
                fill();
                cout << "모든 통을 채웁니다.~~" << endl;
            }
            else if (n == 4) {
                break;
            }
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