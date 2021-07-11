import random

print("무인도에 빠지셨습니다.")
print("주사위를 던져주세요!!")

while True:
    a = random.randint(1, 6)
    b = random.randint(1, 6)
    print("첫 번째 주사위 : %d" % a)
    print("두 번째 주사위 : %d\n" % b)

    if a == b:
        print("무인도를 탈출하셨습니다!")
        break
    else:
        input("다시 던져주세요!")