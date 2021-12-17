# 병합 정렬
def merge_sort(A, left, right) :	    # A[left..right]를 오름차순으로 정렬
	if left<right :					    # 항목이 2개 이상인 경우
		mid = (left + right) // 2		# 리스트의 균등 분할
		merge_sort(A, left, mid)		# 부분 리스트 정렬
		merge_sort(A, mid + 1, right)	# 부분 리스트 정렬
		merge(A, left, mid, right)	    # 병합
	# else: 항목이 1개 인 경우. 자동으로 정복되었음(하나이므로)


def merge(A, left, mid, right) :
    k = left					# 병합을 위한 임시 리스트의 인덱스
    i = left					# 왼쪽 리스트의 인덱스
    j = mid + 1				# 오른쪽 리스트의 인덱스
    while i<=mid and j<=right :
        if A[i] <= A[j] :		# 기본 연산
            sorted[k] = A[i]
            i, k = i+1, k+1
        else:
            sorted[k] = A[j]
            j, k = j+1, k+1

    if i > mid :				# 한쪽에 남아 있는 레코드의 일괄 복사
        sorted[k:k+right-j+1] = A[j:right+1]	# 리스트의 슬라이싱 이용
    else :
        sorted[k:k+mid-i+1] = A[i:mid+1]		# 리스트의 슬라이싱 이용

    A[left:right+1] = sorted[left:right+1]		# sorted를 A에 다시 복사
    
    
# 퀵 정렬
def quick_sort(A, left, right) :		# A[left..right]를 오름차순으로 정렬
	if left<right :						# 정렬 범위가 2개 이상인 경우
		mid = partition(A, left, right)	# 좌우로 분할 
		quick_sort(A, left, mid-1)		# 왼쪽 부분리스트를 퀵 정렬
		quick_sort(A, mid+1, right)	    # 오른쪽 부분리스트를 퀵 정렬



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


######################################################################
# 병합 정렬과 퀵 정렬 실행속도 비교
# 같은 조건에서 실행하기 위해 원본 데이터를 미리 구해 같은 데이터로 실행
######################################################################

import time
import random
import copy

N=1000000

org_data = []    # 입력 리스트

# 원본값
for _ in range(N):
    org_data.append(random.random()*N)

# 병합 정렬
data=copy.copy(org_data) # 파이썬 깊은 복사 (deep copy)
sorted = [0] * len(data)
start=time.time()
merge_sort(data, 0, len(data)-1)
end=time.time()
print("병합 정렬 시간 : %.5f초"%(end-start))
    
# 퀵 정렬
data=copy.copy(org_data) # 파이썬 깊은 복사 (deep copy)
start=time.time()
quick_sort(data, 0, len(data)-1)
end=time.time()
print("퀵 정렬 시간 : %.5f초"%(end-start))








