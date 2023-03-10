#include <iostream>
#include <string>
using namespace std;

class Printer {
    string model, manufacturer;
    int printedCount, availableCount;
public:
    Printer(string model, string manufacturer, int availableCount) {
        this->model = model; this->manufacturer = manufacturer; this->availableCount = availableCount; this->printedCount = 0;
    }
    string getModel() { return model; }
    string getManufacturer() { return manufacturer; }
    int getAvailableCount() { return availableCount; }
    bool print(int pages) {
        if (availableCount >= pages) {
            this->availableCount -= pages;
            this->printedCount += pages;
            return true;
        }
        else {
            return false;
        }
    }
};

class InkJetPrinter : public Printer{
    int availableInk;
public:
    InkJetPrinter(string model, string manufacturer, int availableCount, int availableInk) : Printer(model, manufacturer, availableCount) {
        this->availableInk = availableInk;
    }
    void show() { cout << getModel() << " ," << getManufacturer() << " ,남은 종이 " << getAvailableCount() << "장 ,남은 잉크 " << availableInk << endl; }
    void printInkJet(int pages) {
        if(availableInk < pages) {
            cout << "잉크가 부족하여 프린트할 수 없습니다." << endl;
        }
        else {
            if (print(pages)) {
                availableInk -= pages;
                cout << "프린트하였습니다." << endl;
            }
            else {
                cout << "용지가 부족하여 프린트할 수 없습니다." << endl;
            }
        }
    }
};

class LaserPrinter : public Printer{
    int availableToner;
public:
    LaserPrinter(string model, string manufacturer, int availableCount, int availableToner) : Printer(model, manufacturer, availableCount) {
        this->availableToner = availableToner;
    }
    void show() { cout << getModel() << " ," << getManufacturer() << " ,남은 종이 " << getAvailableCount() << "장 ,남은 토너 " << availableToner << endl; }
    void printLaser(int pages) {
        if (availableToner == 0) {
            cout << "토너가 부족하여 프린트할 수 없습니다." << endl;
        }
        else {
            if (print(pages)) {
                availableToner--;
                cout << "프린트하였습니다." << endl;
            }
            else {
                cout << "용지가 부족하여 프린트할 수 없습니다." << endl;
            }
        }
    }
};

int main()
{
    InkJetPrinter* ink = new InkJetPrinter("Officejet V40", "HP", 5, 10);
    LaserPrinter* laser = new LaserPrinter("SCX-6x45", "삼성전자", 3, 20);

    cout << "현재 작동중인 2대의 프린터는 아래와 같다" << endl;
    cout << "잉크젯 : ";
    ink->show();
    cout << "레이저 : ";
    laser->show();
    cout << endl;

    int n, pages;
    char c;
    while (true) {
        cout << "(1:잉크젯, 2:레이저)와 매수 입력>>";
        cin >> n >> pages;
        if (n == 1) {
            ink->printInkJet(pages);
        }
        else if (n == 2) {
            laser->printLaser(pages);
        }
        ink->show();
        laser->show();

        cout << "계속 프린트 하시겠습니까(y/n)>>";
        cin >> c;
        if (c == 'n')
            break;
        cout << endl;
    }
}