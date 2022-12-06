#include <iostream>
#include <string>
using namespace std;

class Phone {
    string name;
    string telnum;
    string address;
public:
    Phone(string name = "", string telnum = "", string address = "") {
        this->name = name;
        this->telnum = telnum;
        this->address = address;
    }
    friend istream& operator>>(istream& is, Phone& p);
    friend ostream& operator<<(ostream& os, Phone p);
};

istream& operator>>(istream& is, Phone& p) {
    cout << "이름:";
    getline(is, p.name);
    cout << "전화번호:";
    getline(is, p.telnum);
    cout << "주소:";
    getline(is, p.address);
    return is;
}

ostream& operator<<(ostream& os, Phone p) {
    os << "(" << p.name << "," << p.telnum << "," << p.address << ")";
    return os;
}

int main()
{
    Phone girl, boy;
    cin >> girl >> boy;
    cout << girl << endl << boy << endl;
}