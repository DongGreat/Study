# A, B, V = map(int, input().split())
# count = 0
# H = 0

# while True:
#     H = (A-B)*count
#     count += 1
#     if H+A >= V:
#         break

# print(count)

import math

A, B, V = map(int, input().split())
K = (V-B) / (A-B)
print(math.ceil(K))