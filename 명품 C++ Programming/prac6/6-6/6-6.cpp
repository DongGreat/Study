#include <iostream>
using namespace std;

class ArrayUtility2 {
public:
    static int* concat(int s1[], int s2[], int size);
    static int* remove(int s1[], int s2[], int size, int& retSize);
};

int main()
{
    int x[5], y[5];
    int* z;
    int retSize;

    cout << "정수를 5개 입력하라. 배열 x에 삽입한다>>";
    for (int i = 0; i < 5; i++) cin >> x[i];
    cout << "정수를 5개 입력하라. 배열 y에 삽입한다>>";
    for (int i = 0; i < 5; i++) cin >> y[i];

    z = ArrayUtility2::concat(x, y, 10);
    cout << "합친 정수 배열을 출력한다" << endl;
    for (int i = 0; i < 10; i++) cout << z[i] << ' ';
    cout << endl;

    z = ArrayUtility2::remove(x, y, 5, retSize);
    cout << "배열 x[]에서 y[]를 뺀 결과를 출력한다. 개수는 " << retSize << endl;
    for (int i = 0; i < retSize; i++) cout << z[i] << ' ';
}

int* ArrayUtility2::concat(int s1[], int s2[], int size)
{
    int* s3 = new int[size];
    for (int i = 0; i < size / 2; i++) {
        s3[i] = s1[i];
    }
    for (int i = 0; i < size / 2; i++) {
        s3[i + size / 2] = s2[i];
    }
    return s3;
}

int* ArrayUtility2::remove(int s1[], int s2[], int size, int& retSize)
{
    retSize = 0;
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            if (s1[i] == s2[j]) {
                s1[i] = NULL;
                break;
            }
        }
    }

    for (int i = 0; i < size; i++) {
        if (s1[i] != NULL) retSize++;
    }

    int* s3 = new int[retSize];
    int n = 0;
    for (int i = 0; i < size; i++) {
        if (s1[i] != NULL) {
            s3[n] = s1[i];
            n++;
        }
    }

    if (retSize == 0) return NULL;
    return s3;
}
