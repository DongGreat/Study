H, M = map(int, input().split())

if 23 >= H >= 0 and 59 >= M >= 0:
    if M - 45 < 0 and H - 1 < 0:
        print(H + 24 - 1, M + 60 - 45)
    elif M - 45 < 0:
        print(H - 1, M + 60 - 45)
    else:
        print(H, M - 45)