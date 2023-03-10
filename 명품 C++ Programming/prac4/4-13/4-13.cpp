#include <iostream>
using namespace std;

class Histogram
{
	string s;
public:
	Histogram(string s) { this->s = s; this->s.append("\n"); }
	void put(string s);
	void putc(char c);
	void print();
};

void Histogram::put(string s)
{
	this->s.append(s);
}

void Histogram::putc(char c)
{
	s.push_back(c);
}

void Histogram::print()
{
	cout << s;

	int count = 0;
	int alphabet[26] = { 0 };
	for (int i = 0; i < s.length(); i++) {
		if (isalpha(s[i])) {
			count++;
			for (int j = 0; j < 26; j++) {
				if (tolower(s[i]) == (j + 'a')) {
					alphabet[j]++;
				}
			}
		}
	}

	cout << endl << endl << "총 알파벳 수 " << count << endl << endl;

	for (int i = 0; i < 26; i++)
	{
		cout << (char)('a' + i) << " (" << alphabet[i] << ")\t : ";
		for (int j = 0; j < alphabet[i]; j++) {
			cout << '*';
		}
		cout << endl;
	}
}

int main()
{
    Histogram elvisHisto("Wise men say, only fools rush in But I can't help, ");
    elvisHisto.put("falling in love with you");
    elvisHisto.putc('-');
    elvisHisto.put("Elvis Presley");
    elvisHisto.print();
}