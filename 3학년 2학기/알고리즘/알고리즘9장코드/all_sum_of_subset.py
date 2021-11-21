def all_sum_of_subsets(S, M):
    DFS_sum_of_subsets(S, M, 0, [], sum(S))

def DFS_sum_of_subsets(S, M, level, sol, remaining):
    if sum(sol) == M:					# 하나의 해 완성
        print(sol)                  	# 현재 해를 출력
        return						# 백트래킹
    if sum(sol)>M or (remaining+sum(sol))<M:
        return						# 백트래킹

    for i in range(level, len(S)):	# index 이후의 모든 숫자에 대해
        sol.append(S[i])				# 현재 해 갱신
        DFS_sum_of_subsets(S, M, i+1, sol, remaining-S[i])	# 순환 
        sol.pop()					# 현재 해 복구


nums = [3, 34, 4, 12, 5, 2]
M = 9
solution = all_sum_of_subsets(nums, M)
print("입력 집합: ", nums, "M=", M )