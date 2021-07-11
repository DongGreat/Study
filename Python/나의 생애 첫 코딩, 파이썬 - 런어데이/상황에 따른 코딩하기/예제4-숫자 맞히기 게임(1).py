import random

a = int(input("주사위를 던져서 나온 숫자를 맞혀주세요. : "))
b = random.randint(1, 6)
count = 1

while a != b:
    a = int(input("틀렸습니다. 다시 맞혀주세요. : "))
    count += 1
print("정답입니다. %d번만에 맞히셨습니다." % count)