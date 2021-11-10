def selection_sort(A) :					# 선택 정렬
    n = len(A)							# n: 리스트 A의 길이
    for i in range(n-1) :					# 0, 1, 2, ... n-2 [외부루프]
        least = i
        for j in range(i+1, n) :			# i+1,...,n-1 [내부루프]
            if (A[j]<A[least]) :			# 비교연산
                least = j					# 최소항목 갱신
        A[i], A[least] = A[least], A[i]		# 배열 항목 교환 
        printStep(A, i + 1);				# 중간 과정 출력용 문장 


def printStep(arr, val) :					# 중간 과정 출력용 함수
    print("  Step %2d = " % val, end='')	# 현재 단계를 출력
    print(arr)							# 리스트의 내용을 출력

data = [ 5, 3, 8, 4, 9, 1, 6, 2, 7 ]
print("Original  : ", data)
selection_sort(data)
print("Selection : ", data)