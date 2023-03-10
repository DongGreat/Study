#include <iostream>
#include <string>
#include <cstdlib>
#include <ctime>
using namespace std;

class GameObject { // 추상 클래스
protected:
    int distance; // 한 번 이동 거리
    int x, y; // 현재 위치
public:
    GameObject(int startX, int startY, int distance) { // 초기 위치와 이동거리 설정
        this->x = startX; this->y = startY;
        this->distance = distance;
    }
    virtual ~GameObject() {}; // 가상 소멸자

    virtual void move() = 0; // 이동한 후 새로운 위치로 x, y 변경
    virtual char getShape() = 0; // 객체의 모양을 나타내는 문자 리턴

    int getX() { return x; }
    int getY() { return y; }
    bool collide(GameObject* p) {
        if (this->x == p->getX() && this->y == p->getY()) // 이 객체가 객체 p와 충돌했으면 true 리턴
            return true;
        else
            return false;
    }
};

class Human : public GameObject {
public:
    Human(int startX, int startY, int distance) : GameObject(startX, startY, distance) {}
    void move() {
        cout << "왼쪽(a), 아래(s), 위(d), 오른쪽(f) >> ";
        char key;
        cin >> key;
        switch (key)
        {
        case 'a':
            if (y != 0)
                y -= distance;
            break;
        case 's':
            if (x != 9)
                x += distance;
            break;
        case 'd':
            if (x != 0)
                x -= distance;
            break;
        case 'f':
            if (y != 19)
                y += distance;
            break;
        }
    }
    char getShape() { return 'H'; }
};

class Monster : public GameObject {
public:
    Monster(int startX, int startY, int distance) : GameObject(startX, startY, distance) { srand((unsigned)time(0)); }
    void move() {
        int n = rand() % 4;
        switch (n)
        {
        case 0:
            if (y >= 2)
                y -= distance;
            else if (y == 1)
                y--;
            break;
        case 1:
            if (x <= 7)
                x += distance;
            else if (x == 8)
                x++;
            break;
        case 2:
            if (x >= 2)
                x -= distance;
            else if (x == 1)
                x--;
            break;
        case 3:
            if (y <= 17)
                y += distance;
            else if (y == 18)
                y++;
            break;
        }
    }
    char getShape() { return 'M'; }
};

class Food : public GameObject {
public:
    Food(int startX, int startY, int distance) : GameObject(startX, startY, distance) { srand((unsigned)time(0)); }
    void move() {
        int n = rand() % 4;
        int cnt = 0;
        int move_count = 0;
        switch (n)
        {
        case 0:
            if (y != 0)
                y -= distance;
            break;
        case 1:
            if (x != 9)
                x += distance;
            break;
        case 2:
            if (x != 0)
                x -= distance;
            break;
        case 3:
            if (y != 19)
                y += distance;
            break;
        }
    }
    char getShape() { return '@'; }
};

class Game {
    string board[10][20];
    Human* human;
    Monster* monster;
    Food* food;
public:
    Game() {
        srand((unsigned)time(0));
        human = new Human(0, 0, 1);
        monster = new Monster(5, 5, 2);
        food = new Food(9, 9, 1);
        for (int i = 0; i < 10; i++) {
            for (int j = 0; j < 20; j++) {
                board[i][j] = "-";
            }
        }
    }
    ~Game() { delete[] human; delete[] monster; delete[] food; }
    void set() {
        for (int i = 0; i < 10; i++) {
            for (int j = 0; j < 20; j++) {
                board[i][j] = "-";
            }
        }
        board[food->getX()][food->getY()] = food->getShape();
        board[human->getX()][human->getY()] = human->getShape();
        board[monster->getX()][monster->getY()] = monster->getShape();
    }
    void show() {
        for (int i = 0; i < 10; i++) {
            for (int j = 0; j < 20; j++) {
                cout << board[i][j];
            }
            cout << endl;
        }
    }
    void run() {
        cout << "** Human의 Food 먹기 게임을 시작합니다. **" << endl << endl;
        int n, count = 0, move_count = 0;
        while (true) {
            set();
            show();
            human->move();
            monster->move();
            n = rand() % 5;
            if (n > 2 && move_count < 2 || count == 3 && move_count == 0 || count == 4 && move_count == 1) {
                food->move();
                move_count++;
            }
            cout << endl;

            if (human->collide(food)) {
                set();
                show();
                cout << "Human is Winner!!" << endl;
                break;
            }
            else if (monster->collide(human) || monster->collide(food)) {
                set();
                show();
                cout << "Game Over!!" << endl;
                break;
            }

            count++;
            if (count % 5 == 0) {
                count = 0;
                move_count = 0;
            }
        }
    }
};

int main()
{
    Game* game = new Game;
    game->run();
}