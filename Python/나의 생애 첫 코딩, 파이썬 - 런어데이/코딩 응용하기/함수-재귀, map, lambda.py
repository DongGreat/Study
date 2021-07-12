# 재귀 함수
# * 자신이 자기를 호출하는 함수

def 한타(word):
    a = input(word + " : ")
    if a == word:
        print("정답입니다.")
    else:
        print("다시 입력하세요.")
        한타(word)
print("한글 타자 연습입니다. 다음에 제시된 단어를 입력하세요.")
한타("파이썬")
한타("트리케라톱스")

def total_1(num):
    if num == 1:
        return 1
    else:
        return num + total_1(num-1)
print(total_1(10))

# map() 함수
# * 리스트에 함수 수식을 모두 한꺼번에 적용하는 함수
# * map(함수명, 리스트)

def 홀짝(a):
    if a % 2 == 0:
        return(str(a) + "은(는) 짝수")
    else:
        return(str(a) + "은(는) 홀수")
list1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
list2 = list(map(홀짝, list1))
print(list2)

# lambda 표현식
# * 함수를 간단하게 한 줄로 만든 함수
# * 단 한 번만 실행이 필요한 경우에 사용

plus = lambda a, b : a + b # a, b가 매개변수 a + b가 리턴 값
a = plus(1, 2)
print(a)