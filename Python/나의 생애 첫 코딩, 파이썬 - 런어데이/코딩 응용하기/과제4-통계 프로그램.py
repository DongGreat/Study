import statistics as s

while True:
    # num = input("값을 입력하세요 : (예시_45 23 63 75 23) >> ").split()
    num = [int(x) for x in input("값을 입력하세요 : (예시_45 23 63 75 23) >> ").split()]
    a = int(input("알고 싶은 통계를 선택하세요. >> "))

    if a == 1:
        print("평균은 %.2f입니다.\n" % (s.mean(num)))
    elif a == 2:
        print("최댓값은 %.2f입니다.\n" % (max(num)))
    elif a == 3:
        print("최솟값은 %.2f입니다.\n" % (min(num)))
    elif a == 4:
        print("분산은 %.2f입니다.\n" % (s.pvariance(num)))
    elif a == 5:
        print("표준편차는 %.2f입니다.\n" % (s.pstdev(num)))
    elif a == 6:
        print("통계 프로그램\n")
        print("1. 평균")
        print("2. 최댓값")
        print("3. 최솟값")
        print("4. 분산")
        print("5. 표준편차")
        print("6. 사용 설명 보기")
        print("9. 프로그램 종료\n")
    elif a == 9:
        break