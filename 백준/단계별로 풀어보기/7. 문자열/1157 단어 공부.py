word = input().lower()
word_list = list(set(word))
count = []

for x in word_list:
    count.append(word.count(x))

if count.count(max(count)) > 1:
    print("?")
else:
    print(word_list[count.index(max(count))].upper())