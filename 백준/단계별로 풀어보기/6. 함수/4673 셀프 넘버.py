def d():
    array = []
    n = 0

    for i in range(1, 10001):
        if i >= 1000:
            n = i + (i//1000) + (i//100%10) + (i//10%10) + (i%10)
            array.append(n)
        elif i >= 100:
            n = i +(i//100) + (i//10%10) + (i%10)
            array.append(n)
        elif i >= 10:
            n = i +(i//10%10) + (i%10)
            array.append(n)
        else:
            n = i + i
            array.append(n)
    
    for i in range(1, 10001):
        if i not in array:
            print(i)

d()