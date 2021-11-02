A, B, C = map(int, input().split())
count = 1

if B < C:
    print(A // (C-B) + 1)
else:
    print(-1)