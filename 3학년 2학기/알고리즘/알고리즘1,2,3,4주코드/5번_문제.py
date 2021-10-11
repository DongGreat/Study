def bubble_sort(arr):
    for i in range(len(arr)-1, 0, -1):
        for j in range(i):
            if arr[j] == '흑' and arr[j+1] == '백':
                print(arr)
                arr[j], arr[j+1] = arr[j+1], arr[j]
    return arr

A = ['흑', '백', '백', '흑', '흑', '흑', '백', '흑', '백', '백']

print(bubble_sort(A))