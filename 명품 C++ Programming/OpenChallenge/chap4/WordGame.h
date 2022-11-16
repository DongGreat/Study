#include "Player.h"

#pragma once
class WordGame
{
	Player* p;
	int n;
public:
	WordGame(int n) { this->n = n; p = new Player[n]; }
	~WordGame() { delete[] p; }
	void play();
};

