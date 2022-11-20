#include <iostream>
#include <string>
using namespace std;

class Trace {
    static string* tag;
    static string* debug;
    static int index;
public:
    static void put(string _tag, string _debug);
    static void print(string _tag = "");
};

string* Trace::tag = new string[100];
string* Trace::debug = new string[100];
int Trace::index = 0;

void f() {
    int a, b, c;
    cout << "두 개의 정수를 입력하세요>>";
    cin >> a >> b;
    Trace::put("f()", "정수를 입력 받았음");
    c = a + b;
    Trace::put("f()", "합 계산");
    cout << "합은 " << c << endl;
}

int main()
{
    Trace::put("main()", "프로그램 시작합니다");
    f();
    Trace::put("main()", "종료");

    Trace::print("f()");
    Trace::print();
}

void Trace::put(string _tag, string _debug)
{
    tag[index] = _tag;
    debug[index] = _debug;
    index++;
}

void Trace::print(string _tag)
{
    if (_tag.empty()) {
        cout << "----- 모든 Trace 정보를 출력합니다. -----" << endl;
        for (int i = 0; i < index; i++) {
            cout << tag[i] << ":" << debug[i] << endl;
        }
    }
    else {
        cout << "----- " << _tag << "태그의 Trace 정보를 출력합니다. -----" << endl;
        for (int i = 0; i < index; i++) {
            if (tag[i] == _tag) {
                cout << tag[i] << ":" << debug[i] << endl;
            }
        }
    }
}
