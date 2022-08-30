# 나의 풀이
def solution(statues):
    return max(statues) - len(statues) - min(statues) + 1

# 유저1
def solution(statues):
    return sum([1 for i in range(min(statues), max(statues)) if i not in statues]) # 6, 3, 2, 8에서 2와 8의 범위에 없는 숫자만큼 카운트해서 4, 5, 7의 3개가 카운트

# 유저2
def solution(statues):
    counter = 0
    statues.sort()
    for a in range(len(statues) - 1):
        if statues[a] + 1 == statues[a+1]:
            continue
        else:
            counter = counter + (statues[a+1] - statues[a] - 1) # 6 - 3 - 1 = 2
    return counter