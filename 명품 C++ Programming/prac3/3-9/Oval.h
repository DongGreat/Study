#pragma once
class Oval
{
	int width, height;
public:
	Oval();
	Oval(int width, int height);
	~Oval();
	int getWidth();
	int getHeight();
	void set(int w, int h);
	void show();
};

