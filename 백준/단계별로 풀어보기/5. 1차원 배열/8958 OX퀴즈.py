T = int(input())

for i in range(T):
    OX = list(input())
    count = 0
    sum = 0

    for j in range(len(OX)):
        if OX[j] == 'O':
            count += 1
            sum += count
        else:
            count = 0

    print(sum)