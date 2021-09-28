def sub(n):
    if n <= 1: 
        print(n)
        return n
    print(n)
    return sub(n-1) + sub(n-2)

def sum(n):
    print(n)
    if n<1: return 0
    else: return n + sum(n-1)

def asterisk(i):
    if i > 1:
        asterisk(i/2)
        asterisk(i/2)
    print("*", end='')

def mystery3(n):
    if n==1: return 1
    else: return mystery3(n-1) + 2 * n - 1

print(1 + 3*3 - 1)

print(mystery3(2))

"""
5
2.5
    1.25
        0.625   *
        0.625   *
        *
    1.25
        0.625   *
        0.625   *
        *
    *
2.5
    1.25
        0.625   *
        0.625   *
        *
    1.25
        0.625   *
        0.625   *
        *
    *
*
"""