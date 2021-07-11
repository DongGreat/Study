names = ["성유리", "이효리", "옥주현", "이진"]

for i in names:
    print(i)

# in 뒤에 있는 값이 리스트면 그 값들이 하나씩 i 변수에 들어감

number = [1, 2, 3, 4, 5, 6, 7, 8]

for j in number:
    if j % 2 == 0: # 짝수일 경우에만
        print(j)

for i in range(2, 10):
    for j in range(1, 10):
        print("%d X %d = %d" % (i, j, i * j))