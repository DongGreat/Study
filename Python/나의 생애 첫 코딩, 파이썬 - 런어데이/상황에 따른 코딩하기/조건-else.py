print("자이로드롭은 130cm이상만 탑승이 가능합니다.")
height = float(input("키를 입력하세요 : "))
standard = 130

if height < standard:
    print("탑승할 수 없습니다!!")
else:
    print("탑승할 수 있습니다!!")