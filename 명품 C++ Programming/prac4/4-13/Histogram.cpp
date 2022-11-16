#include <iostream>
using namespace std;

#include "Histogram.h"

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
	int cnt[26] = { 0, };
	for (int i = 0; i < s.length(); i++) {
		if (isalpha(s[i])) {
			count++;
			for (int j = 0; j < 26; j++) {
				if (tolower(s[i]) == (j + 'a')) {
					cnt[j]++;
				}
			}
		}
	}

	cout << endl << endl << "ÃÑ ¾ËÆÄºª ¼ö " << count << endl << endl;
	
	for (int i = 0; i < 26; i++)
	{
		cout << (char)('a' + i) << " (" << cnt[i] << ")\t : ";
		for (int j = 0; j < cnt[i]; j++) {
			cout << '*';
		}
		cout << endl;
	}
}
