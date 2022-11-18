#include <iostream>
#include <string>
using namespace std;

class Book {
    string title;
    int price;
public:
    Book(string title, int price);
    ~Book();
    Book(const Book& b);
    void set(string title, int price);
    void show() { cout << title << ' ' << price << "원" << endl; }
};

int main()
{
    Book cpp("명품C++", 10000);
    Book java = cpp;
    java.set("명품자바", 12000);
    cpp.show();
    java.show();
}

Book::Book(string title, int price)
{
    this->title = title;
    this->price = price;
}

Book::~Book()
{
}

Book::Book(const Book& b)
{
    this->title = b.title;
    this->price = b.price;
}

void Book::set(string title, int price)
{
    this->title = title;
    this->price = price;
}
