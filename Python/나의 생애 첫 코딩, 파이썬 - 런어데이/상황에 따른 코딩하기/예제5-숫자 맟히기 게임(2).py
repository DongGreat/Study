import random

num = random.randint(1, 100)
count = 1

print("숫자 맞히기 게임을 시작합니다.")

while True:
    ans = int(input("숫자를 입력하세요 : "))
    if ans < num:
        print("제가 생각하는 수는 그보다 커요.")
        count += 1
    elif ans > num:
        print("제가 생각하는 수는 그보다 작아요.")
        count += 1
    else:
        print("정답입니다. 제가 생각했던 수는 %d입니다." % num)
        print("%d번만에 맞히셨습니다." % count)
        break