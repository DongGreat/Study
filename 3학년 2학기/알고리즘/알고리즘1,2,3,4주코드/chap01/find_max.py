def find_max( A ): 
    max = A[0]
    for i in range(len(A)) :
        if A[i] > max :
            max = A[i]
    return max

array = [ 20, 34, 12, 93, 84, 39, 64, 55, 24 ]
print(array, "최댓값=", find_max(array))
