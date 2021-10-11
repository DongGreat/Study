def kth_smallest_sort(A, k): 
    A.sort() 
    return A[k-1] 

  
def quick_select(A, left, right, k): 
    pos = partition(A, left, right) 	# A에서 피벗의 인덱스

    if (pos+1 == left+k):				# case 1: 찾음. 완료.
        return A[pos] 
    elif (pos+1 > left+k):				# case 2: 답은 왼쪽 부분리스트에. 
        return quick_select(A, left, pos-1, k) 
    else : 							# case 3: 답은 오른쪽 부분리스트에.
        return quick_select(A, pos+1, right, k-(pos+1-left)) 


def partition(A, left, right) :
	low = left + 1				# 왼쪽 부분 리스트의 인덱스 (증가방향)
	high = right					# 오른쪽 부분 리스트의 인덱스 (감소방향)
	pivot = A[left] 				# 피벗 설정 
	while (low <= high) :			# low와 high가 역전되지 않는 한 반복 
	    while low <= right and A[low] < pivot : low += 1
	    while high >= left and A[high]> pivot : high-= 1

	    if low < high :			# 선택된 두 레코드 교환 
	        A[low], A[high] = A[high], A[low]

	A[left], A[high] = A[high], A[left]	# 마지막으로 high와 피벗 항목 교환 
	return high					# 피벗의 위치 반환

########################################################################
array = [12, 3, 5, 7, 4, 19, 26, 23, 15] 
print("입력 리스트 =", array) 
print("[정렬기법] 3번째 작은 수: ", kth_smallest_sort(array, 3)) 
print("[정렬기법] 6번째 작은 수: ", kth_smallest_sort(array, 6)) 
n = len(array) 
print("[축소정복] 3번째 작은 수: ", quick_select(array, 0, n-1, 3)) 
print("[축소정복] 6번째 작은 수: ", quick_select(array, 0, n-1, 6))