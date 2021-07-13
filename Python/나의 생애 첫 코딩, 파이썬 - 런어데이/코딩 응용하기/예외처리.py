# 예외 처리
# * 코드를 실행하는 도중 오류로 인해 중단되는 경우를 대비

age = int(input("나이를 숫자로 입력하세요 : "))
print(age)

try:
    age = int(input("나이를 숫자로 입력하세요 : "))
except:
    age = 0
print(age)

try:
    age = int(input("나이를 숫자로 입력하세요 : "))
except Exception as e: # 에러 메시지를 보여주는 역할
    age = 0
    print(e)
print(age)