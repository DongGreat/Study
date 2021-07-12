# a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

a = []
for i in range(1, 41):
    a.append(i)
b = list(map(lambda x : '짝' if x % 3 == 0 else x, a)) # 람다 표현식에서는 실행 코드가 앞에 나오고 그 다음이 조건이 나온다
print(b)

a = []
for i in range(1, 101):
    a.append(i)
b = list(map(lambda x : '짝' if ('3' in str(x)) or ('6' in str(x)) or ('9' in str(x)) else x, a)) # 람다 표현식에서는 실행 코드가 앞에 나오고 그 다음이 조건이 나온다
print(b)