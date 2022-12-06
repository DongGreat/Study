#include <iostream>
#include <cmath>
#include <iomanip>
using namespace std;

int main()
{
    cout.setf(ios::left);
    cout << setw(15) << "Number";
    cout << setw(15) << "Suqare";
    cout << setw(15) << "Square Root" << endl;
    for (int i = 0; i <= 45; i += 5) {
        cout << setw(15) << setfill('_') << i;
        cout << setw(15) << setfill('_') << i * i;
        cout << setw(15) << setfill('_') << setprecision(3) << sqrt(i);
        cout << endl;
    }
}