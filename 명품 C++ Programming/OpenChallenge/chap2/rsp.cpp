#include <iostream>
#include <string>
using namespace std;

int main() {
	cout << "���� ���� �� ������ �մϴ�. ����, ����, �� �߿��� �Է��ϼ���." << endl;

	string s;
	cout << "�ι̿�>>";
	cin >> s; // �ι̿��� �Է��� ���ڿ�

	string t;
	cout << "�ٸ���>>";
	cin >> t;
	
	if (s == "����" && t == "��" || s == "����" && t == "����" || s == "��" && t == "����")
	{
		cout << "�ι̿��� �̰���ϴ�." << endl;
	}
	else if (s == t)
	{
		cout << "�����ϴ�." << endl;
	}
	else
	{
		cout << "�ٸ����� �̰���ϴ�." << endl;
	}
}