#include <iostream>
using namespace std;

//int big(int a, int b) {
//    if (a > b) {
//        if (a < 100) return a;
//        else return 100;
//    }
//    else {
//        if (b < 100) return b;
//        else return 100;
//    }
//}
//
//int big(int a, int b, int max) {
//    if (a > b) {
//        if (a < max) return a;
//        else return max;
//    }
//    else {
//        if (b < max) return b;
//        else return max;
//    }
//}

int big(int a, int b, int max = 100) {
    if (a > b) {
        if (a < max) return a;
        else return max;
    }
    else {
        if (b < max) return b;
        else return max;
    }
}

int main()
{
    int x = big(3, 5);
    int y = big(300, 60);
    int z = big(30, 60, 50);
    cout << x << ' ' << y << ' ' << z << endl;
}