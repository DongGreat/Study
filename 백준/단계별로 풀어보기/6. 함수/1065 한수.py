N = int(input())
hansu = 0

for X in range(1, N+1):
    if X <= 99:
        hansu += 1
    else:
        nums = list(map(int, str(X)))
        if nums[0] - nums[1] == nums[1] - nums[2]:
            hansu += 1

print(hansu)