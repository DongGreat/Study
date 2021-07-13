print("영어 퀴즈 프로그램입니다.")

question = {"사과" : "apple", "코끼리" : "elephant", "별" : "star", "연필" : "pencil"}
question_keys = list(question.keys())
score = 0
count = 1
while question:
    a = input("%d번 문제) %s : " % (count, question_keys[count-1]))

    if a == question.get(question_keys[count-1]):
        print("정답입니다.")
        score += 10
        print("현재 점수 : %d\n" % score)
        del question[question_keys[count-1]]
        count += 1
    else:
        print("오답입니다. 다시 풀어주세요")
        score -= 5
        print("현재 점수 : %d\n" % score)
print("> 총 획득한 점수는 %d점입니다." % score)