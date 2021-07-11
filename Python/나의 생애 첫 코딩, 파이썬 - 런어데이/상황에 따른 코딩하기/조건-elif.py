sight = float(input("시력을 입력하세요 : "))

if sight >= 1.2:
    print("눈이 상당히 좋으시네요.")
elif sight >= 0.6:
    print("눈이 나쁘지는 않지만 조심하세요!!")
elif sight >= 0.2:
    print("눈이 조금 안 좋네요. 안경 써야겠어요. ㅠ")
else:
    print("눈이 상당히 나빠요. 게임은 절대 금지!!")

# else와 if를 합침