#include <iostream>
#include <string>
using namespace std;

class Buffer {
    string text;
public:
    Buffer(string text) { this->text = text; }
    void add(string next) { text += next; }
    void print() { cout << text << endl; }
};

Buffer& append(Buffer& buf, string text) {
    buf.add(text);
    return buf;
}

int main()
{
    Buffer buf("Hello");
    Buffer& temp = append(buf, "Guys");
    temp.print();
    buf.print();
    temp.add("OO"); // temp는 Buffer 객체 buf에 대한 참조라 temp를 바꾸면 buf도 바뀜
    buf.print();
    temp.print();
}
