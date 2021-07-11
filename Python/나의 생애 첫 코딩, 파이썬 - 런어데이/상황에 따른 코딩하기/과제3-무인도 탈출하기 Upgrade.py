import random

print("무인도에 빠지셨습니다.")
print("주사위를 던져주세요!!")

count = 1
while count <= 3:
    a = random.randint(1, 6)
    b = random.randint(1, 6)
    print("첫 번째 주사위 : %d" % a)
    print("두 번째 주사위 : %d\n" % b)

    if a != b:
        if count == 3:
            input("%d번의 기회 동안 같은 수가 나오지 않았으므로 다음 회에 무인도를 탈출합니다." % count)
            break
        input("다시 던져주세요!!")
        count += 1
    elif a == b:
        print("무인도를 %d회 시도 끝에 탈출했습니다." % count)
        break