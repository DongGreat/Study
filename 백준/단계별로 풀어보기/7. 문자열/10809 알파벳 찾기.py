S = input()
alphabet = list(range(97, 123))     # a = 97, z = 122

for x in alphabet:
    print(S.find(chr(x)), end=" ")

# find 함수는 문자열에서 사용 가능하고 찾는 문자가
#  문자열에 포함되지 않은 경우 -1을 출력
# index 함수는 문자열뿐만 아니라 iterable 자료형에서도
#  사용 가능하지만 찾는 문자가 문자열에 포함되지 않은 경우
#  AttributeError가 발생