#include <iostream>
using namespace std;

int main()
{
    for (int i = 0; i < 10; i++)
    {
        for (int j = 1; j <= 10; j++)
        {
            cout << j + (i * 10) << "\t";
        }
        cout << endl;
    }
}
