# 나의 풀이
def solution(n):
    sum1 = 0
    sum2 = 0
    a = list(str(n)[:int(len(str(n))/2)])
    b = list(str(n)[:int(len(str(n))/2)-1:-1])
    for x in a:
        sum1 += int(x)
    for x in b:
        sum2 += int(x)
    return sum1 == sum2

# 유저1
def solution(n):
    s = str(n)
    pivot = len(s)//2 # 절반
    left, right = s[:pivot], s[pivot:] # 절반까지 슬라이싱, 절반부터 슬라이싱 // 나는 너무 괴상하게 슬라이싱 함
    return sum(map(int, left)) == sum(map(int, right)) # map 함수에 대해 숙지할 것

# 유저2
def solution(n):
    s = [int(x) for x in str(n)]
    l = int(len(s)/2)    
    return sum(s[:l]) == sum(s[l:])

# 유저3
def solution(n):
    n = list(map(int,str(n)))
    l = len(n)//2
    return sum(n[:l]) == sum(n[l:])