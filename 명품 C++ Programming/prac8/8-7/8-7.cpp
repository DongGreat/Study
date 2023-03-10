#include <iostream>
using namespace std;

class BaseMemory {
    char* mem;
protected:
    BaseMemory(int size) { mem = new char[size]; }
    ~BaseMemory() { delete[] mem; }
    char getMem(int index) { return mem[index]; }
    void setMem(int index, char c) { mem[index] = c; }
};

class ROM : protected BaseMemory {
public:
    ROM(int size, char c[], int arr_size) : BaseMemory(size) { 
        for (int i = 0; i < arr_size; i++) {
            setMem(i, c[i]);
        }
    }
    char read(int index) { return getMem(index); }
};

class RAM : protected BaseMemory {
public:
    RAM(int size) : BaseMemory(size) {}
    char read(int index) { return getMem(index); }
    void write(int index, char c) { setMem(index, c); }
};

int main()
{
    char x[5] = { 'h', 'e', 'l', 'l', 'o' };
    ROM biosROM(1024 * 10, x, 5);
    RAM mainMemory(1024 * 1024);

    for (int i = 0; i < 5; i++) mainMemory.write(i, biosROM.read(i));
    for (int i = 0; i < 5; i++) cout << mainMemory.read(i);
}