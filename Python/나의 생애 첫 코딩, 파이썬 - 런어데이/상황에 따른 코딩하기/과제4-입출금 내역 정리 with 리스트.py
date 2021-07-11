money = []
while True:
    a = int(input("입금은 1, 출금은 2, 입출금 내역 조회는 3, 종료는 4를 눌러주세요. : "))
    if a == 1:
        deposit = int(input("입금하려는 금액을 입력해주세요. : "))
        money.append(deposit)
        print("%d원이 입금되었습니다." % deposit)
        print("현재 잔액은 %d원입니다." % sum(money))
        print("입출금 횟수는 %d회입니다." % len(money))
    elif a == 2:
        withdraw = int(input("출금하려는 금액을 입력해주세요. : "))
        money.append(-withdraw)
        print("%d원이 출금되었습니다." % withdraw)
        print("현재 잔액은 %d원입니다." % sum(money))
        print("입출금 횟수는 %d회입니다." % len(money))
    elif a == 3:
        for i in range(0, len(money)):
            print("%d회차 : %d" % ((i + 1), money[i]))
    elif a == 4:
        break
    else:
        print("잘못된 번호를 입력하셨습니다.")