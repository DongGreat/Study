C = int(input())

for i in range(C):
    N = list(map(int, input().split(" ")))
    avg = sum(N[1:]) / N[0]
    count = 0

    for s in N[1:]:
        if s > avg:
            count += 1

    print("%.3f%%" % ((count/N[0])*100))