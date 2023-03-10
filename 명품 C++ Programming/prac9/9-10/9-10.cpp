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
    Shape* next;
protected:
    virtual void draw() = 0;
public:
    Shape() { next = NULL; }
    void paint() { draw(); }
    Shape* getNext() { return next; } // 없으면 NULL
    Shape* add(Shape* p) {
        this->next = p;
        return p;
    }
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
public:
    void draw() { cout << "Rectangle" << endl; }
};

class GraphicEditor {
    Shape* pStart;
    Shape* pLast;
public:
    GraphicEditor() {
        pStart = pLast = NULL;
    }
    ~GraphicEditor() {
        Shape* p = pStart;
        while (p != pStart) {
            Shape* q = p->getNext(); // 다음 도형 주소 기억
            delete p; // 현재 도형 객체 소멸
            p = q; // 다음 도형의 주소를 p에 저장
        }
    }
    void insertShape(int n) {
        switch (n) { // 1은 Line, 2는 Circle, 3은 Rectangle
        case 1:
            if (pStart == NULL) { // 처음 생성
                pStart = new Line();
                pLast = pStart;
            }
            else { // 이미 있으면
                pLast = pLast->add(new Line()); // 마지막에 객체 추가
            }
            break;
        case 2:
            if (pStart == NULL) {
                pStart = new Circle();
                pLast = pStart;
            }
            else {
                pLast = pLast->add(new Circle());
            }
            break;
        case 3:
            if (pStart == NULL) {
                pStart = new Rectangle();
                pLast = pStart;
            }
            else {
                pLast = pLast->add(new Rectangle());
            }
            break;
        default:
            break;
        }
    }
    bool deleteIndex(int index) { // 인덱스 위치를 지우고 이전 노드를 다음 노드와 연결
        int i = 0;
        Shape* p = pStart;
        Shape* pre = pStart;
        if (index == 0) { // 지우는 게 0번 인덱스면 pStart를 다음 노드에 연결하고 현재 위치의 객체 삭제
            pStart = pStart->getNext();
            delete p;
        }
        else {
            while (p != NULL && i < index) {
                pre = p;
                p = p->getNext();
                i++;
            }
            if (p == NULL) {
                cout << "없는 노드입니다." << endl;
                return false;
            }
            else if (p->getNext() == NULL) { // 이거 추가하니까 마지막 인덱스 삭제하고 삽입 안 되는 문제 해결됨
                pre->add(NULL);
                pLast = pre;
                delete p;
            }
            else {
                pre->add(p->getNext()); // 이전 노드를 현재 노드의 다음 노드로 연결
                delete p; // 현재 노드의 객체 삭제
                // 마지막 인덱스를 삭제한 후 다시 삽입할 때 삽입이 되지 않는 문제 발생
            }
        }
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
                p->paint();
                p = p->getNext();
                i++;
            }
        }
    }
    int run() {
        cout << "그래픽 에디터입니다." << endl;
        while (true) {
            int num;
            num = UI::show_menu();
            switch (num) {
            case 1: {
                num = UI::insert_shape();
                insertShape(num);
                break;
            }
            case 2: {
                if (pStart == NULL) {
                    cout << "List Empty" << endl;
                    break;
                }
                num = UI::delete_index();
                deleteIndex(num);
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
                cout << "메뉴를 잘못 선택하셨습니다." << endl;
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