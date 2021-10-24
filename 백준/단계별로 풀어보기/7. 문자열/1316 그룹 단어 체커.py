N = int(input())
group_word = 0

for i in range(N):
    word = input()      # aabba
    error = 0

    for j in range(len(word)-1):    # 다음 인덱스와 비교할 때 범위가 초과하기에 1회 덜 반복
        if word[j] != word[j+1]:    # 현재 글자와 다음 글자가 다를 때
            new_word = word[j+1:]   # bba // 현재 인덱스+1부터 새 문자열을 만듦
            if new_word.count(word[j]) > 0: # 새 문자열에 현재 글자가 있다면
                error += 1

    if error == 0:
        group_word += 1

print(group_word)