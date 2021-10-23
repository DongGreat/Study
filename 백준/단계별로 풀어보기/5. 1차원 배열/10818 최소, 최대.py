N = int(input())
array = list(map(int, input().split(" ")))
a_max = array[0]
a_min = array[0]

for i in range(1, N):
    if a_max < array[i]:
        a_max = array[i]
    if a_min > array[i]:
        a_min = array[i]

print(a_min, a_max)