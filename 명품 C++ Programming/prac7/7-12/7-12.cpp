#include <iostream>
using namespace std;

class SortedArray {
    int size;
    int* p;
    void sort();
public:
    SortedArray();
    SortedArray(SortedArray& src);
    SortedArray(int p[], int size);
    ~SortedArray();
    SortedArray operator+(SortedArray& op2);
    SortedArray& operator=(const SortedArray& op2);
    void show();
};

void SortedArray::sort() {
    int temp;
    for (int i = 0; i < this->size; i++) {
        for (int j = 0; j < this->size - 1; j++) {
            if (p[j] > p[j + 1]) {
                temp = p[j + 1];
                p[j + 1] = p[j];
                p[j] = temp;
            }
        }
    }
}

SortedArray::SortedArray() {
    size = 0;
    p = NULL;
}

SortedArray::SortedArray(SortedArray& src) {
    this->size = src.size;
    this->p = new int[this->size];
    for (int i = 0; i < this->size; i++) {
        this->p[i] = src.p[i];
    }
}

SortedArray::SortedArray(int p[], int size) {
    this->size = size;
    this->p = new int[this->size];
    for (int i = 0; i < this->size; i++) {
        this->p[i] = p[i];
    }
}

SortedArray::~SortedArray() {
    delete[] p;
}

SortedArray SortedArray::operator+(SortedArray& op2) {
    SortedArray temp;
    temp.size = this->size + op2.size;
    temp.p = new int[temp.size];
    for (int i = 0; i < this->size; i++) {
        temp.p[i] = this->p[i];
    }
    for (int i = this->size; i < temp.size; i++) {
        temp.p[i] = op2.p[i - this->size];
    }
    return temp;
}

SortedArray& SortedArray::operator=(const SortedArray& op2) {
    delete[] p;
    this->size = op2.size;
    this->p = new int[this->size];
    for (int i = 0; i < this->size; i++) {
        this->p[i] = op2.p[i];
    }
    return *this;
}

void SortedArray::show() {
    sort();
    cout << "배열 출력 : ";
    for (int i = 0; i < this->size; i++) {
        cout << p[i] << ' ';
    }
    cout << endl;
}

int main()
{
    int n[] = { 2, 20, 6 };
    int m[] = { 10, 7, 8, 30 };
    SortedArray a(n, 3), b(m, 4), c;

    c = a + b;

    a.show();
    b.show();
    c.show();
}