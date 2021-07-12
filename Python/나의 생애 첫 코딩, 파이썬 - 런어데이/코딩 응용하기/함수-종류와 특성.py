# 함수의 사용 이유
# 재사용성
# 유지보수
# 가독성

# 함수의 종류
# 내장 함수
# * 파이썬에 내장된 함수
# * print, input, int, abs, type 등등
# 외장 함수
# * 파이썬 외부 모듈에 있는 함수
# * randint, sleep, localtime 등등
# 사용자 정의 함수
# * 사용자가 직접 만든 함수
# * subway, total

# 함수의 독립성 - 지역 변수와 전역 변수
# 전역 변수
# * 함수 밖에서 만든 변수
# * 함수와 무관하게 코드 전반적으로 쓰임
# 지역 변수
# * 함수 안에서 만들어진 임시로 사용하는 변수
# * 함수를 실행했을 때만 잠깐 만들어졌다가 함수가 종료되면 없어짐, 따라서 함수 밖에서는 쓰일 수가 없음

a = 1 # 전역 변수
def jijun():
    a = 10 # 지역 변수
    return a
print(jijun())
print(a)

# a = 1
# def jijun():
#     global a # 전역 변수 a를 함수 안에서 사용할 수 있게 불러옴
#     a = 10
#     return a
# print(jijun())
# print(a)