#include "Player.h"

#pragma once
class GamblingGame
{
	Player* p;
public:
	GamblingGame() { p = new Player[2]; }
	void run();
};

