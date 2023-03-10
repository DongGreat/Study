#include <iostream>
#include <string>
#include <vector>
using namespace std;

class Book {
    int year;
    string title, author;
public:
    Book(int year = 0, string title = "", string author = "") {
        this->year = year;
        this->title = title;
        this->author = author;
    }
    string getAuthor() { return author; }
    int getYear() { return year; }
    void show() {
        cout << year << "년도, " << title << ", " << author << endl;
    }
};

int main()
{
    vector<Book> v;
    cout << "입고할 책을 입력하세요. 년도에 -1을 입력하면 입고를 종료합니다." << endl;
    int year, count = 0;
    string title, author;
    while (true) {
        cout << "년도>>";
        cin >> year;
        cin.ignore();
        if (year == -1) {
            cout << "총 입고된 책은 " << count << "권입니다." << endl;
            break;
        }
        cout << "책이름>>";
        getline(cin, title);
        cout << "저자>>";
        getline(cin, author);
        v.push_back(Book(year, title, author));
        count++;
    }

    cout << "검색하고자 하는 저자 이름을 입력하세요>>";
    getline(cin, author);
    for (int i = 0; i < v.size(); i++) {
        if (author == v.at(i).getAuthor()) {
            v.at(i).show();
        }
    }

    cout << "검색하고자 하는 년도를 입력하세요>>";
    cin >> year;
    for (int i = 0; i < v.size(); i++) {
        if (year == v.at(i).getYear()) {
            v.at(i).show();
        }
    }
}
