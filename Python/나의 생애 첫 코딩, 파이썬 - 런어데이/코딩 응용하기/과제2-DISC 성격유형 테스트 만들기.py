count = 1
ans = []

def question(a, b, c, d):
    global count
    global ans
    print("=======================================================")
    print("문항 %d) 다음 중 가장 가까운 걸 선택해주세요." % count)
    sel = int(input("\t1: %s 2: %s 3: %s 4: %s" % (a, b, c, d)))
    ans.append(sel)
    count += 1

question("강력한", "표현력이 좋은", "절제하는", "꼼꼼한 : ")
question("개척적인", "흥미진진한", "만족스러운", "정확한 : ")
question("대담한", "활기찬", "기꺼이 하는", "정교한 : ")
question("논쟁을 좋아하는", "에측할 수 없는", "주저하는", "회의적인 : ")
question("무서움을 모르는", "사교적인", "참을성이 있는", "공손한 : ")
question("독립심이 강한", "설득력 있는", "온화한", "논리적인 : ")
question("결단력 있는", "차분한", "파티를 좋아하는", "신중한 : ")
question("고집 있는", "인기 있는", "인상 좋은", "완벽주의자 : ")
question("완고한", "변화가 많은", "느긋한", "수줍음을 타는 : ")
question("의지가 강한", "낙관적인", "친절한", "체계적인 : ")

cnt = []
for i in range(0, 4):
    cnt.append(ans.count(i + 1))

if (cnt.index(max(cnt)) + 1) == 1:
    print("당신은 D형입니다.")
elif (cnt.index(max(cnt)) + 1) == 2:
    print("당신은 I형입니다.")
elif (cnt.index(max(cnt)) + 1) == 3:
    print("당신은 S형입니다.")
elif (cnt.index(max(cnt)) + 1) == 4:
    print("당신은 C형입니다.")
else:
    print("검사가 잘못되었습니다.")