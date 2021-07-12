c="파이썬 격파"
d="시작"

print(c+d)
print(c[::-1]) # 문자열 거꾸로 만들기

print(d*3)

print(c[0])
print(c[3]) # 빈 칸도 문자
print(c[1:5]) # 1번 인덱스부터 4번 인덱스까지 가져와라
print(c[1:])
print(c[-1])

print(len(c)) # 문자열의 길이 구하기

print(c.count('파')) # 문자열에 있는 글자 개수 구하기
print(c.find('격')) # 문자열에서 글자의 위치 찾기
print(c.replace('격파', '정복')) # 문자열에서 특정 글자 바꾸기
print(c.split()) # 문자열을 리스트로 분리하기

e="파이썬 - 격파"
print(e.split('-'))