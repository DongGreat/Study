print("더하기 계산기\n")

a = float(input("첫 번째 수를 입력해주세요 : "))
b = float(input("두 번째 수를 입력해주세요 : "))
print("두 수의 합은 %.1f입니다.\n" % (a + b))

print("더치페이 계산기\n")

a = int(input("내야 할 금액은 얼마인가요? : "))
b = int(input("사람은 몇 명인가요? : "))
print("1인당 낼 돈 : %d" % (a / b))
print("부족한 돈 : %d원" % (a % b))