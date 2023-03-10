#include <iostream>
#include <string>
using namespace std;

class Product {
    int id;
    string description, producer;
    int price;
public:
    Product(int id, string description, string producer, int price) { 
        this->id = id; this->description = description; this->producer = producer; this->price = price; id++;
    }
    int getId() { return id; }
    string getDescription() { return description; }
    string getProducer() { return producer; }
    int getPrice() { return price; }
    virtual void show() = 0;
};

class Book : public Product {
    int isbn;
    string author, bookTitle;
public:
    Book(int id, string description, string producer, int price, int isbn, string author, string bookTitle)
        : Product(id, description, producer, price) {
        this->isbn = isbn; this->author = author; this->bookTitle = bookTitle;
    }
    int getIsbn() { return isbn; }
    string getAuthor() { return author; }
    string getBookTitle() { return bookTitle; }
    void show() {
        cout << "--- 상품ID : " << getId() << endl;
        cout << "상품설명 : " << getDescription() << endl;
        cout << "생산자 : " << getProducer() << endl;
        cout << "가격 : " << getPrice() << endl;
        cout << "ISBN : " << isbn << endl;
        cout << "책제목 : " << bookTitle << endl;
        cout << "저자 : " << author << endl;
    }
};

class CompactDisc : public Product {
    string singer, songTitle;
public:
    CompactDisc(int id, string description, string producer, int price, string singer, string songTitle)
        : Product(id, description, producer, price) {
        this->singer = singer; this->songTitle = songTitle;
    }
    void show() {
        cout << "--- 상품ID : " << getId() << endl;
        cout << "상품설명 : " << getDescription() << endl;
        cout << "생산자 : " << getProducer() << endl;
        cout << "가격 : " << getPrice() << endl;
        cout << "앨범제목 : " << songTitle << endl;
        cout << "가수 : " << singer << endl;
    }
};

class ConversationBook : public Book {
    string language;
public:
    ConversationBook(int id, string description, string producer, int price, int isbn, string author, string bookTitle, string language)
        : Book(id, description, producer, price, isbn, author, bookTitle) {
        this->language = language;
    }
    void show() {
        cout << "--- 상품ID : " << getId() << endl;
        cout << "상품설명 : " << getDescription() << endl;
        cout << "생산자 : " << getProducer() << endl;
        cout << "가격 : " << getPrice() << endl;
        cout << "ISBN : " << getIsbn() << endl;
        cout << "책제목 : " << getBookTitle() << endl;
        cout << "저자 : " << getAuthor() << endl;
        cout << "언어 : " << language << endl;
    }
};

int main()
{
    cout << "***** 상품 관리 프로그램을 작동합니다 *****" << endl;
    Product* product[100];
    string description, producer, author, bookTitle, singer, songTitle, language;
    int price, isbn;
    int id = 0, n;
    while (id < 100) {
        cout << "상품 추가(1), 모든 상품 조회(2), 끝내기(3) ? ";
        cin >> n;
        if (n == 1) {
            cout << "상품 종류 책(1), 음악CD(2), 회화책(3) ? ";
            cin >> n;
            cin.ignore();
            if (n == 1) {
                cout << "상품설명>>";
                getline(cin, description);
                cout << "생산자>>";
                getline(cin, producer);
                cout << "가격>>";
                cin >> price;
                cin.ignore();
                cout << "책제목>>";
                getline(cin, bookTitle);
                cout << "저자>>";
                getline(cin, author);
                cout << "ISBN>>";
                cin >> isbn;
                cin.ignore();
                Book* b = new Book(id, description, producer, price, isbn, author, bookTitle);
                product[id++] = b;
            }
            else if (n == 2) {
                cout << "상품설명>>";
                getline(cin, description);
                cout << "생산자>>";
                getline(cin, producer);
                cout << "가격>>";
                cin >> price;
                cin.ignore();
                cout << "앨범제목>>";
                getline(cin, songTitle);
                cout << "가수>>";
                getline(cin, singer);
                CompactDisc* cd = new CompactDisc(id, description, producer, price, singer, songTitle);
                product[id++] = cd;
            }
            else if (n == 3) {
                cout << "상품설명>>";
                getline(cin, description);
                cout << "생산자>>";
                getline(cin, producer);
                cout << "가격>>";
                cin >> price;
                cin.ignore();
                cout << "책제목>>";
                getline(cin, bookTitle);
                cout << "저자>>";
                getline(cin, author);
                cout << "언어>>";
                getline(cin, language);
                cout << "ISBN>>";
                cin >> isbn;
                cin.ignore();
                ConversationBook* cb = new ConversationBook(id, description, producer, price, isbn, author, bookTitle, language);
                product[id++] = cb;
            }
            cout << endl;
        }
        else if (n == 2) {
            for (int i = 0; i < id; i++) {
                product[i]->show();
            }
            cout << endl;
        }
        else if (n == 3) {
            break;
        }
    }
    delete[] product;
}