#include <iostream>
using namespace std;

istream& pos(istream& is) {
    cout << "위치는? ";
    return is;
}

int main()
{
    int x, y;
    cin >> pos >> x;
    cin >> pos >> y;
    cout << x << ',' << y << endl;
}