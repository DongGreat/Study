# 나의 풀이
def solution(s1, s2):
    result = 0
    set_s1 = set(s1)
    for a in set_s1:
        result += min(s1.count(a), s2.count(a))
    return result

# 유저1
def solution(s1, s2):
    return sum(min(s1.count(x), s2.count(x)) for x in set(s1))

# 유저2
def solution(s1, s2):
    count = 0
    commons = set(s1) & set(s2) # &은 교집합 연산자로 set_s1 = abc, set_s2 = acd일 때의 교집합인 a와 c만 남으므로 연산 속도 줄음
    print(commons)
    for i in commons:
        count += min(s1.count(i), s2.count(i))
    return count