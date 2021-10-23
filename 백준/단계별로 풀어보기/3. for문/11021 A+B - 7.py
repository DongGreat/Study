T = int(input())

for i in range(1, T+1):
    A, B = map(int, input().split(" "))
    if A > 0 and B < 10:
        sum = A + B
        print(f"Case #{i}: {sum}")