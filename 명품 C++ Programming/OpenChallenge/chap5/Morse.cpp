#include <iostream>

#include "Morse.h"

Morse::Morse()
{
	alphabet[0] = { ".-" }; alphabet[1] = { "-..." }; alphabet[2] = { "-.-." }; alphabet[3] = { "-.." };
	alphabet[4] = { "." }; alphabet[5] = { "..-." }; alphabet[6] = { "--." }; alphabet[7] = { "...." };
	alphabet[8] = { ".." }; alphabet[9] = { ".---" }; alphabet[10] = { "-.-" }; alphabet[11] = { ".-.." };
	alphabet[12] = { "--" }; alphabet[13] = { "-." }; alphabet[14] = { "---" }; alphabet[15] = { ".--." };
	alphabet[16] = { "--.-" }; alphabet[17] = { ".-." }; alphabet[18] = { "..." }; alphabet[19] = { "-" };
	alphabet[20] = { "..-" }; alphabet[21] = { "...-" }; alphabet[22] = { ".--" }; alphabet[23] = { "-..-" };
	alphabet[24] = { "-.--" }; alphabet[25] = { "--.." };
	digit[0] = { "-----" }; digit[1] = { ".----" }; digit[2] = { "..---" }; digit[3] = { "...--" };
	digit[4] = { "....-" }; digit[5] = { "....." }; digit[6] = { "-...." }; digit[7] = { "--..." };
	digit[8] = { "----.." }; digit[9] = { "----." };
	slash = "-..-.";
	question = "..--..";
	comma = "--..--";
	period = ".-.-.-";
	plus = ".'.'.";
	equal = "-...-";
}

void Morse::text2Morse(string text, string& morse)
{
	for (int i = 0; i < text.length(); i++) {
		if (isalpha(text[i])) {
			if (isupper(text[i])) {
				morse.append(alphabet[text[i] - 'A']);
				morse.append(" ");
			}
			else if (islower(text[i])) {
				morse.append(alphabet[text[i] - 'a']);
				morse.append(" ");
			}
		}
		else if (isdigit(text[i])) {
			morse.append(digit[text[i] - '0']);
			morse.append(" ");
		}
		else {
			switch (text[i]) {
			case '/':
				morse.append(slash);
				morse.append(" ");
				break;
			case '?':
				morse.append(question);
				morse.append(" ");
				break;
			case ',':
				morse.append(comma);
				morse.append(" ");
				break;
			case '.':
				morse.append(period);
				morse.append(" ");
				break;
			case '+':
				morse.append(plus);
				morse.append(" ");
				break;
			case '=':
				morse.append(equal);
				morse.append(" ");
				break;
			case ' ':
				morse.append("  ");
				break;
			}
		}
	}
}

bool Morse::morse2Text(string morse, string& text)
{
	// morse를 바꿔서 text랑 일치하면 메인에서 text cout

	string al[26] = { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
					"l", "m", "n", "o", "p", "q", "r", "s" , "t", "u", "v"
					"w", "x", "y", "z" };
	string di[10] = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" };

	int before = 0;
	int pos;
	string s;
	string retext;
	while (true) {
		pos = morse.find(" ", before);
		s = morse.substr(before, pos - before);
		before = pos + 1;

		for (int i = 0; i < 26; i++) {
			if (s == alphabet[i]) {
				retext.append(al[i]);
				break;
			}
		}
		for (int i = 0; i < 10; i++) {
			if (s == digit[i]) {
				retext.append(di[i]);
				break;
			}
		}
		if (s == slash)	retext.append("/");
		else if (s == question) retext.append("?");
		else if (s == comma) retext.append(",");
		else if (s == period) retext.append(".");
		else if (s == plus) retext.append("+");
		else if (s == equal) retext.append("=");
		else if (morse[pos] == ' ' && morse[pos + 1] == ' ' && morse[pos + 2] == ' ') {
			retext.append(" ");
			pos += 2;
		}

		if (pos == morse.size() - 1) break;
	}
	if (retext == text) {
		text = retext;
		return true;
	}
	else return false;
}
