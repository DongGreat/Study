# 나의 풀이
import numpy as np

def solution(matrix):
    sum = 0
    for j in range(np.shape(matrix)[1]):
        for i in range(np.shape(matrix)[0]):
            if matrix[i][j] == 0:
                break
            else:
                sum += matrix[i][j]
    return sum

# 유저1
def solution(m):
    r = len(m)
    c = len(m[0])
    total=0
    for j in range(c):
        for i in range(r):
            if m[i][j]!=0:
                total+=m[i][j]
            else:
                break
    return total

# 유저2
def solution(matrix):
    sum = 0
    for i in range(len(matrix)):
        for j in range(len(matrix[i])):
            if matrix[i][j] == 0 and i+1 < len(matrix):
                matrix[i+1][j] = 0
            sum += matrix[i][j]
    return sum