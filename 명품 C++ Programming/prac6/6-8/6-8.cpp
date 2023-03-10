#include <iostream>
#include <string>
using namespace std;

class Trace {
    static string* tag;
    static string* debug;
    static int count;
public:
    static void put(string _tag, string _debug);
    static void print(string _tag = "");
};
string* Trace::tag = new string[100];
string* Trace::debug = new string[100];
int Trace::count = 0;

void Trace::put(string _tag, string _debug)
{
    tag[count] = _tag;
    debug[count] = _debug;
    count++;
}

void Trace::print(string _tag)
{
    if (_tag.empty()) {
        cout << "----- 모든 Trace 정보를 출력합니다. -----" << endl;
        for (int i = 0; i < count; i++) {
            cout << tag[i] << ":" << debug[i] << endl;
        }
    }
    else {
        cout << "----- " << _tag << "태그의 Trace 정보를 출력합니다. -----" << endl;
        for (int i = 0; i < count; i++) {
            if (tag[i] == _tag) {
                cout << tag[i] << ":" << debug[i] << endl;
            }
        }
    }
}

void f() {
    int a, b, c;
    cout << "두 개의 정수를 입력하세요>>";
    cin >> a >> b;
    Trace::put("f()", "정수를 입력 받았음"); // 디버깅 정보 저장
    c = a + b;
    Trace::put("f()", "합 계산"); // 디버깅 정보 저장
    cout << "합은 " << c << endl;
}

int main()
{
    Trace::put("main()", "프로그램 시작합니다"); // 디버깅 정보 저장
    f();
    Trace::put("main()", "종료"); // put()의 첫 번째 매개 변수는 태그이고
                                  // 두 번째 매개 변수는 디버깅 정보이다.
    Trace::print("f()"); // "f()" 태그를 가진 디버깅 정보를 모두 출력한다.
    Trace::print(); // 모든 디버깅 정보를 출력한다.
}