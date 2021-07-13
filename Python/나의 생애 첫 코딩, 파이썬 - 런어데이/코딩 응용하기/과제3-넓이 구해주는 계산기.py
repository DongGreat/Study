print("넓이 구해주는 프로그램\n")
print("1. 사다리꼴 넓이")
print("2. 사각형의 넓이")
print("3. 삼각형의 넓이")
print("4. 원 넓이(파이 = 3.14)")
print("5. 메뉴 보기")
print("6. 프로그램 종료\n")

while True:
    q = int(input("넓이를 구하고자 하는 도형을 선택하세요. >> "))

    if q == 1:
        a = int(input("밑변의 길이를 입력하세요 >> "))
        b = int(input("윗변의 길이를 입력하세요 >> "))
        c = int(input("높이의 길이를 입력하세요 >> "))
        print("사다리꼴의 넓이는 %.2f입니다.\n" % ((a + b) * c / 2))
    elif q == 2:
        a = int(input("밑변의 길이를 입력하세요 >> "))
        b = int(input("높이의 길이를 입력하세요 >> "))
        print("사각형의 넓이는 %.2f입니다.\n" % (a * b))
    elif q == 3:
        a = int(input("밑변의 길이를 입력하세요 >> "))
        b = int(input("높이의 길이를 입력하세요 >> "))
        print("삼각형의 넓이는 %.2f입니다.\n" % (a * b / 2))
    elif q == 4:
        a = int(input("반지름의 길이를 입력하세요 >> "))
        print("원의 넓이는 %.2f입니다.\n" % (a * a * 3.14))
    elif q == 5:
        print("넓이 구해주는 프로그램\n")
        print("1. 사다리꼴 넓이")
        print("2. 사각형의 넓이")
        print("3. 삼각형의 넓이")
        print("4. 원 넓이(파이 = 3.14)")
        print("5. 메뉴 보기")
        print("6. 프로그램 종료\n")
    elif q == 6:
        break