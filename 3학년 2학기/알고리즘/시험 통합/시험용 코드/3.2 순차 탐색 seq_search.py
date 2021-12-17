def sequential_search(A, key):	# A는 입력 리스트, key는 탐색 키
    for i in range(len(A)) :	# i : 0, 1, ... len(A)-1
        if A[i] == key :  		# 탐색 성공하면 (비교연산. 기본 연산임)
            return i 			# 인덱스 반환 
    return -1					# 탐색에 실패하면 -1 반환 


def sequential_search2(A, key):	# A는 입력 리스트, key는 탐색 키
    Found=False
    index=-1
    N=len(A)
    i=0
    while i<N and not Found:
        if A[i] == key :  		
            Found=True
            index=i
        else:
            i+=1
    return index 

A = [ 32, 14, 5, 17, 23, 9, 11, 4, 26, 29]

print("32찾기: ", sequential_search2(A, 32))
print("29찾기: ", sequential_search2(A, 29))
