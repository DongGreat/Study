import math

T = int(input())

for i in range(T):
    H, W, N = map(int, input().split())
    floor = N%H
    num = math.ceil(N/H)

    if N % H == 0:
        num = N//H
        floor = H

    print((floor*100) + num)

# H, W, N = map(int, input().split())
# print(N//H+1, math.ceil(N/H))
# print(N%H)

# if N%H == 0:
#     num = N//H
#     floor = H
# print(num, floor)
