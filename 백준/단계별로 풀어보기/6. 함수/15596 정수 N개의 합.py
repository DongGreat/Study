def solve(n):
    sum = 0

    for a in n:
        sum += a
        
    return sum

n = [1, 2, 3]
print(solve(n))