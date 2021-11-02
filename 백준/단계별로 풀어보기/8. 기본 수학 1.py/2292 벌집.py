# 1         1       1
# 2 7       6       2
# 8 19      12      3
# 20 37     18      4

N = int(input())
nums = 1
count = 1

while N > nums:
    nums += 6 * count
    count += 1

print(count)