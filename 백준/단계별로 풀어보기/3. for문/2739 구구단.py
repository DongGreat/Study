N = int(input())

if 9 >= N >= 1:
    for i in range(1, 10):
        print("%d * %d = %d" % (N, i, N*i))