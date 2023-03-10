#include <iostream>
#include <string>
using namespace std;

class Console {
public:
    static int SelectMenu();
    static int SelectTime();
    static int InputSeatNum();
    static string InputName();
};

int Console::SelectMenu() {
    cout << "예약:1, 취소:2, 보기:3, 끝내기:4>> ";
    int n;
    cin >> n;
    cin.ignore();
    return n;
}

int Console::SelectTime() {
    cout << "07시:1, 12시:2, 17시:3>> ";
    int n;
    cin >> n;
    cin.ignore();
    return n;
}

int Console::InputSeatNum() {
    cout << "좌석 번호>> ";
    int n;
    cin >> n;
    cin.ignore();
    return n - 1;
}

string Console::InputName() {
    cout << "이름 입력>> ";
    string s;
    getline(cin, s);
    return s;
}

class Seat {
    string name;
public:
    Seat(string name = "---") { this->name = name; }
    string getName() { return name; }
    void reservation(string name) { this->name = name; }
    void cancle() { this->name = "---"; }
};

class Schedule {
    Seat* seats;
    string time;
public:
    Schedule(string time = "") {
        this->time = time;
        this->seats = new Seat[8];
    }
    string getTime() { return time; }
    void setTime(string time) { this->time = time; }
    void reservation(string name, int seat_num) {
        if (seats[seat_num].getName() == "---")
            seats[seat_num].reservation(name);
        else
            cout << "이미 예약된 좌석입니다. 다른 좌석을 선택해 주세요." << endl;
    }
    void cancle(string name, int seat_num) {
        if (seats[seat_num].getName() == name) {
            seats[seat_num].cancle();
        }
        else {
            cout << "이름을 다시 확인해 주세요." << endl;
        }
    }
    void show() {
        cout << time << ":\t";
        for (int i = 0; i < 8; i++) {
            cout << seats[i].getName() << '\t';
        }
        cout << endl;
    }
};

class AirlineBook {
    Schedule* schedules;
public:
    AirlineBook() {
        this->schedules = new Schedule[3];
        schedules[0].setTime("07시");
        schedules[1].setTime("12시");
        schedules[2].setTime("17시");
    }
    ~AirlineBook() { delete[] schedules; }
    void run() {
        cout << "***** 한성항공에 오신것을 환영합니다 *****" << endl << endl;
        int n;
        string name;
        int seat_num;
        while (true) {
            n = Console::SelectMenu();
            if (n == 1) {
                n = Console::SelectTime();
                switch (n) {
                case 1:
                    schedules[0].show();
                    seat_num = Console::InputSeatNum();
                    name = Console::InputName();
                    schedules[0].reservation(name, seat_num);
                    break;
                case 2:
                    schedules[1].show();
                    seat_num = Console::InputSeatNum();
                    name = Console::InputName();
                    schedules[1].reservation(name, seat_num);
                    break;
                case 3:
                    schedules[2].show();
                    name = Console::InputName();
                    seat_num = Console::InputSeatNum();
                    schedules[2].reservation(name, seat_num);
                    break;
                }
            }
            else if (n == 2) {
                n = Console::SelectTime();
                switch (n) {
                case 1:
                    schedules[0].show();
                    seat_num = Console::InputSeatNum();
                    name = Console::InputName();
                    schedules[0].cancle(name, seat_num);
                    break;
                case 2:
                    schedules[1].show();
                    seat_num = Console::InputSeatNum();
                    name = Console::InputName();
                    schedules[1].cancle(name, seat_num);
                    break;
                case 3:
                    schedules[2].show();
                    seat_num = Console::InputSeatNum();
                    name = Console::InputName();
                    schedules[2].cancle(name, seat_num);
                    break;
                }
            }
            else if (n == 3) {
                for (int i = 0; i < 3; i++) {
                    schedules[i].show();
                }
                cout << endl;
            }
            else if (n == 4) {
                cout << "예약 시스템을 종료합니다." << endl;
                break;
            }
            cout << endl;
        }
    }
};

int main()
{
    AirlineBook airlinebook;
    airlinebook.run();
}