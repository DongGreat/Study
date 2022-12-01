#include <iostream>
#include <string>
#include <cstdlib>
#include <ctime>
using namespace std;

class GameObject {
protected:
    int distance;
    int x, y;
public:
    GameObject(int startX, int startY, int distance) {
        this->x = startX; this->y = startY;
        this->distance = distance;
    }
    virtual ~GameObject() {};

    virtual void move() = 0;
    virtual char getShape() = 0;

    int getX() { return x; }
    int getY() { return y; }
    bool collide(GameObject* p) {
        if (this->x == p->getX() && this->y == p->getY())
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
            break;
        case 1:
            if (x <= 7)
                x += distance;
            break;
        case 2:
            if (x >= 2)
                x -= distance;
            break;
        case 3:
            if (y <= 17)
                y += distance;
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