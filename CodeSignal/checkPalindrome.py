# 나의 풀이
def solution(inputString):
    return inputString == inputString[::-1] # 원래의 문자와 역순의 문자를 비교해서 True인지 False인지 반환

# 유저1
def solution(inputString):
    for i in range(len(inputString) // 2): # 5를 넣으면 2
        if inputString[i] != inputString[-i - 1]: # 1부터 시작하는 숫자와 -1부터 시작하는 숫자의 인덱스인 문자를 비교
            return False
    return True