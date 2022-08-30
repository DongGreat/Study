# 나의 풀이
def solution(inputArray):
    result = []
    max_len = len(max(inputArray, key=len))
    for i in range(len(inputArray)):
        if len(inputArray[i]) == max_len:
            result.append(inputArray[i])
    return result

# 유저1
def solution(inputArray):
    m = max(len(s) for s in inputArray)
    r = [s for s in inputArray if len(s) == m]
    return r

# 유저2
def solution(inputArray):
    return [i for i in inputArray if len(i) == len(max(inputArray, key=len))]