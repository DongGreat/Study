#include <iostream>
#include <string>
#include <vector>
using namespace std;

class Shape {
protected:
    virtual void draw() = 0;
public:
    void paint() { draw(); }
};

class Circle : public Shape {
protected:
    virtual void draw() { cout << "Circle" << endl; }
};

class Rect : public Shape {
protected:
    virtual void draw() { cout << "Rectangle" << endl; }
};

class Line : public Shape {
protected:
    virtual void draw() { cout << "Line" << endl; }
};

int main()
{
    cout << "그래픽 에디터입니다." << endl;
    vector<Shape*> v;
    int n, index;
    while (true) {
        cout << "삽입:1, 삭제:2, 모두보기:3, 종료:4 >> ";
        cin >> n;
        if (n == 1) {
            cout << "선:1, 원:2, 사각형:3 >> ";
            cin >> n;
            switch (n)
            {
            case 1:
                v.push_back(new Line());
                break;
            case 2:
                v.push_back(new Circle());
                break;
            case 3:
                v.push_back(new Rect());
                break;
            default:
                break;
            }
        }
        else if (n == 2) {
            cout << "삭제하고자 하는 도형의 인덱스 >> ";
            cin >> index;
            if (index < 0 || index >= v.size()) {
                cout << "잘못된 인덱스입니다." << endl;
                continue;
            }
            vector<Shape*>::iterator it;
            it = v.begin();
            for (int i = 0; i < index; i++)
                it++;
            Shape* p = *it;
            it = v.erase(it);
            delete p;
        }
        else if (n == 3) {
            for (int i = 0; i < v.size(); i++) {
                cout << i << ": ";
                v[i]->paint();
            }
        }
        else if (n == 4) {
            break;
        }
    }
}