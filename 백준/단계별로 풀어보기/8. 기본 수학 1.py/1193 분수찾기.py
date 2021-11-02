# X = int(input())
# array = []

# for i in range(1, X+1):
#     if i == 1:
#         array.append(str(i) + '/' + str(i))
#     elif i%2 == 0:
#         for j in range(i):
#             array.append(str(j+1) + '/' + str(i-j))
#     else:
#         for j in range(i):
#             array.append(str(i-j) + '/' + str(j+1))

# print(array[X-1])

X = int(input())
line = 1

while X > line:
    X -= line           # X = 13, 12, 10, 7, 3
    line += 1           # line = 1, 2, 3, 4, 5

if line % 2 == 0:
    A = X
    B = line - X + 1
else:
    A = line - X + 1    # 5 - 3 + 1 = 3
    B = X               # 3

print(str(A) + '/' + str(B))