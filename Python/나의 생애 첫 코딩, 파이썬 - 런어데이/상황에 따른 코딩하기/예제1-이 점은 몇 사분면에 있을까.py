x = int(input("x 좌표를 입력해주세요. "))
y = int(input("y 좌표를 입력해주세요. "))

if x > 0 and y > 0:
    print("(%d, %d)는 제%d사분면에 위치합니다." % (x, y, 1))
elif x < 0 and y > 0:
    print("(%d, %d)는 제%d사분면에 위치합니다." % (x, y, 2))
elif x < 0 and y < 0:
    print("(%d, %d)는 제%d사분면에 위치합니다." % (x, y, 3))
else:
    print("(%d, %d)는 제%d사분면에 위치합니다." % (x, y, 4))