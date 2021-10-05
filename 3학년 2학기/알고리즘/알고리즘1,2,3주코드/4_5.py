def insertion_sort2(A, n):
    for i in range(1, n):
        j = i-1
        while j>=0 and A[j] > A[j+1]:
            A[j], A[j+1] = A[j+1], A[j]
            j -= 1
    return A  

a = ['A', 'L', 'G', 'O', 'R', 'I', 'T', 'H', 'M']
print(a)
print(insertion_sort2(a, len(a)))