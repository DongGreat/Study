# 나의 풀이
def solution(n):
    if n == 1:
        return n
    return solution(n - 1) + (n - 1) * 4

# 유저1
def solution(n):
    return n**2 + (n-1)**2

# 유저2
def solution(n):
    return 2*n*(n-1)+1

# 유저3
def solution(n):
    result = 1
    for i in range(n):
        result += 4 * i
    return result