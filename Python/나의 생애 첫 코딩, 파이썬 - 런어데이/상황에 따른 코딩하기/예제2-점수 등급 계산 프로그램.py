score = int(input("점수를 입력해주세요 : "))

if score >= 90:
    print("점수는 %d입니다." % score)
    print("등급은 1등급입니다.")
elif score >= 80:
    print("점수는 %d입니다." % score)
    print("등급은 2등급입니다.")
elif score >= 70:
    print("점수는 %d입니다." % score)
    print("등급은 3등급입니다.")
elif score >= 60:
    print("점수는 %d입니다." % score)
    print("등급은 4등급입니다.")
else:
    print("점수는 %d입니다." % score)
    print("등급은 5등급입니다.")