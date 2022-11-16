#include <iostream>
using namespace std;

#include "WordGame.h"

int main()
{
    cout << "끝말 잇기 게임을 시작합니다" << endl;
    cout << "게임에 참가하는 인원은 몇명입니까?";
    int n;
    cin >> n;

    WordGame wordgame(n);
    wordgame.play();
}