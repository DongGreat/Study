#include <iostream>
#include <string>
using namespace std;

class UI {
public:
    static int show_menu() {
        int n;
        cout << "삽입:1, 삭제:2, 모두보기:3, 종료:4 >> ";
        cin >> n;
        return n;
    }
    static int insert_shape() {
        int n;
        cout << "선:1, 원:2, 사각형:3 >> ";
        cin >> n;
        return n;
    }
    static int delete_index() {
        int n;
        cout << "삭제하고자 하는 도형의 인덱스 >> ";
        cin >> n;
        return n;
    }
};

class Shape {
protected:
    Shape* next;
public:
    Shape() { next = NULL; }
    virtual void draw() = 0;
    virtual ~Shape() {}
    Shape* add(Shape* p) {
        this->next = p;
        return p;
    }
    Shape* getNext() { return next; }
    void setNext(Shape* p) { this->next = p->next; }
};

class Line : public Shape {
public:
    void draw() { cout << "Line" << endl; }
};

class Circle : public Shape {
public:
    void draw() { cout << "Circle" << endl; }
};

class Rectangle : public Shape {
    void draw() { cout << "Rectangle" << endl; }
public:
};

class GraphicEditor {
    Shape* pStart;
    Shape* pLast;
    int count;
public:
    GraphicEditor() {
        pStart = pLast = NULL;
        count = 0;
    }
    void insertItem(int n) {
        Shape* p = NULL;
        switch (n) {
        case 1:
            if (count == 0) {
                pStart = new Line();
                pLast = pStart;
            }
            else {
                pLast = pLast->add(new Line());
            }
            count++;
            break;
        case 2:
            if (count == 0) {
                pStart = new Circle();
                pLast = pStart;
            }
            else {
                pLast = pLast->add(new Circle());
            }
            count++;
            break;
        case 3:
            if (count == 0) {
                pStart = new Rectangle();
                pLast = pStart;
            }
            else {
                pLast = pLast->add(new Rectangle());
            }
            count++;
            break;
        default:
            break;
        }
    }
    bool del(int n) {
        int k = 0;
        Shape* target_node = pStart;
        Shape* priv_node = NULL;
        if (n == 0) {
            pStart = pStart->getNext();
            delete target_node;
        }
        else {
            while ((target_node != NULL) && (k < n)) {
                priv_node = target_node;
                target_node = target_node->getNext();
                k++;
            }
            if (target_node == NULL) {
                cout << "없는 노드입니다.\n";
                return false;
            }
            else {
                priv_node->setNext(target_node);
                delete target_node;
            }
        }
        count--;
    }
    void show() {
        Shape* p = pStart;
        int i = 0;
        if (p == NULL) {
            cout << "List Empty" << endl;
        }
        else {
            while (p != NULL) {
                cout << i << ": ";
                p->draw();
                p = p->getNext();
                i++;
            }
        }
    }
    int run() {
        cout << "그래픽 에디터입니다.\n";
        while (true) {
            int num;
            num = UI::show_menu();
            switch (num) {
            case 1: {
                num = UI::insert_shape();
                insertItem(num);
                break;
            }
            case 2: {
                if (pStart == NULL) {
                    cout << "List Empty\n";
                    break;
                }
                num = UI::delete_index();
                del(num);
                break;
            }
            case 3: {
                show();
                break;
            }
            case 4: {
                exit(0);
            }
            default:
                cout << "메뉴를 잘못 선택하셨습니다.\n";
            }
        }
    }
};

int main()
{
    GraphicEditor* g_editor = new GraphicEditor;
    g_editor->run();
    delete g_editor;
}