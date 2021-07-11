a = int(input("시작할 수를 입력해주세요 : "))
b = int(input("끝나는 수를 입력해주세요 : "))

total = 0
for i in range(a, (b + 1)):
    total += i
print("답은 %d입니다." % total)