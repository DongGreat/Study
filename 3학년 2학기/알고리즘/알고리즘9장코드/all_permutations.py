def all_permutations(data):
    bUsed = [False] * len(data)			# 원소의 사용여부저장 리스트
    DFS_permutation (data, [], 0, bUsed)	# 루트부터 탐색 시작

def DFS_permutation (data, sol, level, bUsed):
    if level == len(data):       	# 하나의 순열 완성
        print(sol)           		# 현재 순열 출력
        return

    for i in range(len(data)):	# data의 모든 원소에 대해
        if not bUsed[i]:     		# 아직 사용되지 않았어야 가능한 부분해
            sol.append(data[i])	# 부분해에 추가
            bUsed[i] = True    	# 이 원소는 사용했다고 표시
            DFS_permutation (data, sol, level+1, bUsed) # 자식노드 탐색 
            sol.pop()          	# 복구: 부분해에서 꺼냄
            bUsed[i] = False		# 복구: 이 원소는 사용하지 않음


all_permutations(['1', '2', '3', '4'])



from itertools import permutations 	# itertools 모듈의 permutations 사용
print(list(permutations(['A', 'B', 'C'])) ) # 순열들을 리스트로 만들어 출력
