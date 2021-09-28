def count_substr(str, A, B):
    count = 0
    n = len(str)
    for i in range(n-1):
        if str[i] == 'A':
            for j in range(i+1, n):
                if str[j] == 'B':
                    count += 1
    return count

def count_substr2(str, A, B):
    count = 0
    sum = 0
    n = len(str)
    for i in range(n):
        if str[i] == 'A':
            count += 1
        elif str[i] == 'B':
            print(1)
            sum += count
    return sum

A = "ADBAAEDBABB"
print(count_substr(A, 'A', 'B'))
print(count_substr2(A, 'A', 'B'))

