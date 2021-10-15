def quick_sort(A, left, right) :		# A[left..right]를 오름차순으로 정렬
	if left<right :						# 정렬 범위가 2개 이상인 경우
		mid = partition(A, left, right)	# 좌우로 분할 
		quick_sort(A, left, mid-1)		# 왼쪽 부분리스트를 퀵 정렬
		quick_sort(A, mid+1, right)	    # 오른쪽 부분리스트를 퀵 정렬

def median_of_three(A, low, high):
	mid = (low + high - 1) // 2
	if ((A[low] < A[mid] and A[mid] < A[high]) or (A[high] < A[mid] and A[mid] < A[low])):
		return A[mid]
	elif ((A[mid] < A[low] and A[low] < A[high]) or (A[high] < A[mid] and A[mid] < A[low])):
		return A[low]
	else:
		return A[high]

def partition(A, low, high):
    pivot = median_of_three(A, low, high)
    i = low - 1
    j = high + 1
    while True:
        i += 1
        while A[i] < pivot:
            i += 1
        j -= 1
        while A[j] > pivot:
            j -= 1

        if i >= j:
            return j

        A[i], A[j] = A[j], A[i]



data = [ 5, 3, 8, 4, 9, 1, 6, 2, 7 ]    # 입력 리스트
print("Original  : ", data)
quick_sort(data, 0, len(data)-1)        # 병합 정렬
print("QuickSort : ", data)