name = input("이름을 입력해주세요 : ")
print(name)

name = input("주인공의 이름은 무엇입니까? ")
city = input(name +" (이)가 사는 마을은 어디입니까? ")
print("아주 먼 옛날, " + city + "(이)라는 마을에 " + name + " 이 있었어요. ")

# 입력받은 문자는 문자열로 저장되어 다른 타입으로 바꾸려면
weight = int(input("몸무게를 입력하세요 : "))
print("%d 이군요" % weight)

sight = float(input("시력을 입력하세요 : "))
print("%.1f 이군요" % sight)