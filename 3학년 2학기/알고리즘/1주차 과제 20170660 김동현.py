# 1. 제어문

# * 분기(branching): if, else, elif
value = 2
if value % 2 == 0:
    print("짝수입니다.")
else:
    print("홀수입니다.")

score = 90
if score >= 90:
    print("합격입니다.")
    print("장학금 대상입니다.")
# print("장학금 대상입니다.")

score = 50
if score >= 90:
    grade = "A"
elif score >= 80:
    grade = "B"
elif score >= 70:
    grade = "C"
elif score >= 60:
    grade = "D"
else:
    grade = "F" 
print(grade)

# * 반복(looping)
dan = 3
for n in range(2, 10, 1):
    print("%2d x %2d = " % (dan, n), dan*n)

dan = 4
n = 2
while n < 10:
    print("%2d x %2d = " % (dan, n), dan*n)
    n += 1

# * Range()
for n in range(5):          # n: 0, 1, 2, 3, 4
    print(n, end=' ')
print()
for n in range(2, 10):      # n: 2, 3, ..., 9
    print(n, end=' ')
print()
for n in range(10, 3, -2):  # n: 10, 8, 6, 4
    print(n, end=' ')
print()
for item in [12, 33, 52, 26, 99]:   # 리스트의 모든 항목에 대해 반복
    print("값 =", item, end=' ')             # 12, 33, 52, 26, 99 출력
print()
for c in "Game Over !":             # 문자열의 각 문자에 대해
    print("값 =", c, end=' ')
print()
mySet = set([12, 33, 52, 33, 99])   # 집합 자료형은 중복을 허용하지 않고 순서가 없다.
for e in mySet:
    print("값 =", e, end=' ')
print()
myDict = {'A': 12, 'B': 33, 'C': 52, 'D': 26, 'E': 99}
for e in myDict:
    print("키 =", e, end=' ')
    print("값 =", myDict[e])

# 2. 자료구조(리스트, 딕셔너리, 집합)

# * 리스트(list) - 스마트한 배열
big3 = []
lotto = [23, 34, 11, 42, 9]
big4 = ['제이플라', '도티', '대도서관', '보람튜브']
print("lotto[1] = ", lotto[1])
big4[2] = '블랙핑크'
print(big4)
big3.append("알라딘")
big3.append("엘사")
big3.append("안나")
print(big3)
'''
s.append(item)              항목 item을 리스트 s의 맨 뒤에 추가한다.
s.extend(lst)               리스트 lst를 s에 추가한다.
s.count(item)               리스트에서 항목 item의 개수를 세고 그 개수를 반환한다.
s.index(item, [시작], [종료])   리스트에서 item을 찾아 가장 작은 인덱스를 반환한다. 탐색의 시작 위치와 종료 위치를 지정할 수도 있다.
s.insert(pos, item)         pos 위치에 항목 item을 삽입한다.
s.pop(pos)                  pos 위치의 항목을 s에서 꺼내고 반환한다.
s.remove(item)              항목 item을 s에서 제거한다.
s.reverse()                 리스트 항목의 순서를 뒤집는다.
s.sort([key], [reverse])    항목을 정렬한다
'''

# * 딕셔너리(dict) - 키(key)와 관련된 값(value)로 이루어진 항목(entry)들의 집합
map = {'김연아': '피겨', '류현진': '야구', '쿠드롱': '당구', '메시': '축구'}
print(map)
print("쿠드롱이 뭐하는 사람이지? ", map['쿠드롱'])
map['나달'] = '테니스'  # 맵에 항목 추가
map.update({'최민영': '여자야구', '고진영': '골프'})    # 여러 항목 추가
print(map)

# * 집합(set) - set과 frozenset(내용을 변경할 수 없는 set)
s1 = {1, 2, 3}              # 집합 객체
s2 = {2, 3, 4, 5}           # 집합 객체
s3 = s1.union(s2)           # 합집합
s4 = s1.intersection(s2)    # 교집합
s5 = s1 - s2                # 차집합
print("s1: ", s1)
print("s2: ", s2)
print("s3: ", s3)
print("s4: ", s4)
print("s5: ", s5)
s5 = {3.14}             # 원소가 하나인 집합
map = {3.14: 'Phi'}     # 엔트리가 하나인 딕셔너리