﻿#include <iostream>
using namespace std;

#include "Sample.h"

int main()
{
    Sample s(10);
    s.read();
    s.write();
    cout << "가장 큰 수는 " << s.big() << endl;
}