finkl = input("핑클 이름은? ")
names = ["성유리", "이효리", "옥주현", "이진"]

if finkl in names:
    print(finkl + "은(는) 핑클 멤버가 맞습니다")
else:
    print(finkl + "은(는) 핑클 멤버가 아닙니다")

# A in OOO - OOO 안에 A가 있는지 여부

eng_dic = {"사과":"apple", "오렌지":"orange", "딸기":"strawberry", "포도":"grape"}

q = input("알고 싶은 단어가 무엇입니까? ")
if q in eng_dic:
    print(q + "은(는) 영어로 " + eng_dic[q] + "입니다.")
else:
    print("죄송합니다. 사전에 없는 단어입니다.")