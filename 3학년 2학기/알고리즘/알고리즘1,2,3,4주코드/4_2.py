def insertion_sort(arr):
    for a in range(1, len(arr)):
            for b in range(a, 0, -1):
                if arr[b] < arr[b-1]:
                    arr[b], arr[b-1] = arr[b-1], arr[b]
                else:
                    break
    return arr

a = ['A', 'L', 'G', 'O', 'R', 'I', 'T', 'H', 'M']
print(a)
print(insertion_sort(a))

for i in range(1, len(a)):
    print()
    for j in range(i, 0, -1):
        print(a[j-1], end='')