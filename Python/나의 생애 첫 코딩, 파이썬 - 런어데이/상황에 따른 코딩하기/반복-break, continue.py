for i in range(1, 6, 1):
    print("숫자 세기 : %d" % i)
    if i > 3:
        break
print("숫자는 총 %d개" % i)

# break - if 조건에 만족하면 반복문을 나와라

for i in range(1, 11):
    if i % 3 == 0:
        continue
    print(i)

# continue - if 조건에 만족하면 반복문의 처음으로 다시 돌아가라
# 실제 코드에서 continue는 별로 안 쓰이지만 break는 자주 쓰임