def partition(A, left, right):
    x = A[right]
    i = left - 1
    for j in range(left, right):
        if A[j] <= x:
            i += 1
            A[i], A[j] = A[j], A[i]
    A[i+1], A[right] = A[right], A[i+1]
    return i + 1

def quick_select_iter(a, left, right, k):
    while left <= right:
        pos = partition(a, left, right)
        if (pos == k-1):
            return a[pos]
        elif (pos > k-1):
            right = pos-1
        else:
            left = pos+1

A = [12, 5, 7, 9, 18, 3, 8]
print(quick_select_iter(A, 0, 6, 3))