import sys

T = int(sys.stdin.readline())

if 1000000 >= T >= 1:
    for i in range(T):
        A, B = map(int, sys.stdin.readline().split(" "))
        if 1000 >= A >= 1 and 1000 >= B >= 1:
            print(A + B)