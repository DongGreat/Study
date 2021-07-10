print("자이로드롭은 130cm 이상만 탑승이 가능합니다.")
height = float(input("키를 입력하세요 : "))
standard = 130

if height < standard:
    print("탑승할 수 없습니다!!")
if height == standard:
    print("아슬아슬했네요~ 탑승할 수 있습니다!!")
if height > standard:
    print("탑승할 수 있습니다!!")

print("자이로드롭을 찾아주셔서 감사합니다.")