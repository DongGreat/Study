#include <iostream>
#include <string>
using namespace std;

class Printer {
protected:
    string model, manufacturer;
    int printedCount, availableCount;
public:
    Printer(string model, string manufacturer, int availableCount) {
        this->model = model;
        this->manufacturer = manufacturer;
        this->availableCount = availableCount;
        printedCount = 0;
    }
    virtual void print(int pages) = 0;
    virtual void show() = 0;
};

class InkjetPrinter : public Printer {
    int availableInk;
public:
    InkjetPrinter(string model, string manufacturer, int availableCount, int availableInk) : Printer(model, manufacturer, availableCount) {
        this->availableInk = availableInk;
    }
    void print(int pages) {
        if (availableCount >= pages && availableInk >= pages) {
            availableCount -= pages;
            availableInk -= pages;
            cout << "프린트하였습니다." << endl;
        }
        else if (availableCount < pages && availableInk < pages) {
            cout << "용지와 잉크가 부족하여 프린트할 수 없습니다." << endl;
        }
        else if (availableCount < pages) {
            cout << "용지가 부족하여 프린트할 수 없습니다." << endl;
        }
        else if (availableInk < pages) {
            cout << "잉크가 부족하여 프린트할 수 없습니다." << endl;
        }
    }
    void show() {
        cout << model << " ," << manufacturer << " ,남은 종이 " << availableCount << "장 ,남은 잉크 " << availableInk << endl;
    }
};

class LaserPrinter : public Printer {
    int availableToner;
public:
    LaserPrinter(string model, string manufacturer, int availableCount, int availableToner) : Printer(model, manufacturer, availableCount) {
        this->availableToner = availableToner;
    }
    void print(int pages) {
        if (availableCount >= pages && availableToner >= 1) {
            availableCount -= pages;
            availableToner --;
            cout << "프린트하였습니다." << endl;
        }
        else if (availableCount < pages && availableToner < 1) {
            cout << "용지와 토너가 부족하여 프린트할 수 없습니다." << endl;
        }
        else if (availableCount < pages) {
            cout << "용지가 부족하여 프린트할 수 없습니다." << endl;
        }
        else if (availableToner < 1) {
            cout << "토너가 부족하여 프린트할 수 없습니다." << endl;
        }
    }
    void show() {
        cout << model << " ," << manufacturer << " ,남은 종이 " << availableCount << "장 ,남은 잉크 " << availableToner << endl;
    }
};

int main()
{
    Printer* printer[2];
    printer[0] = new InkjetPrinter("Officejet V40", "HP", 5, 10);
    printer[1] = new LaserPrinter("SCX-6x45", "삼성전자", 3, 20);
    cout << "현재 작동중인 2대의 프린터는 아래와 같다" << endl;
    cout << "잉크젯 : ";
    printer[0]->show();
    cout << "레이저 : ";
    printer[1]->show();
    cout << endl;

    int n, pages;
    char c;
    while (true) {
        cout << "프린터(1:잉크젯, 2:레이저)와 매수 입력>>";
        cin >> n >> pages;
        if (n == 1) {
            printer[0]->print(pages);
        }
        else if (n == 2) {
            printer[1]->print(pages);
        }
        printer[0]->show();
        printer[1]->show();

        cout << "계속 프린트 하시겠습니까(y/n)>>";
        cin >> c;
        if (c == 'n') {
            break;
        }
        cout << endl;
    }

    for (int i = 0; i < 2; i++)
        delete printer[i];
}