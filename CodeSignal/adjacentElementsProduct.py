# 나의 풀이
def solution(inputArray):
    max = inputArray[0] * inputArray[1]
    for i in range(1, len(inputArray)-1):
        a = inputArray[i] * inputArray[i+1]
        if max < a:
            max = a
    return max

# 유저1
def solution(inputArray):
    return max([inputArray[i] * inputArray[i+1] for i in range(len(inputArray)-1)])

# 유저2
def solution(inputArray):
    best = inputArray[0] * inputArray[1]
    for i in range(1, len(inputArray) - 1):
        temp = inputArray[i] * inputArray[i + 1]
        if temp > best:
            best = temp
    return best