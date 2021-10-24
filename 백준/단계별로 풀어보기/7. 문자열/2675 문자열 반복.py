T = int(input())
for i in range(T):
    R, S = list(map(str, input().split(" ")))
    T = ''

    for x in S:
        T += x*int(R)

    print(T)