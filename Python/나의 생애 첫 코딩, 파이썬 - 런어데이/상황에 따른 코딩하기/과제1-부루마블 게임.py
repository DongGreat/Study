import random

print("부루마불 게임\n")

input("엔터키를 누르면 주사위를 던집니다.\n")

while True:
    a = random.randint(1, 6)
    b = random.randint(1, 6)
    print("첫 번째 주사위 : %d" % a)
    print("두 번째 주사위 : %d\n" % b)
    if a == b:
        print("같은 수가 나왔습니다.")
        input("엔터키를 누르면 주사위를 던집니다.\n")
        c = random.randint(1, 6)
        d = random.randint(1, 6)
        print("세 번째 주사위 : %d" % c)
        print("네 번째 주사위 : %d\n" % d)
        print("%d칸 이동하세요!!" % (a + b + c + d))
    else:
        print("%d칸 이동하세요!!" % (a + b))
    break