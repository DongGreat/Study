def printNode(knapsack, level, weight, profit, bound, maxProfit):
    print("%d %-16s :  %3.1fKg 가치/한계합 = %5.1f / %5.1f > %5.1f(최고합)"%
          (level, knapsack, weight, profit, bound, maxProfit))

def knapSack_bnb(obj, knapsack, W, level, weight, profit, maxProfit, bound) : 
    printNode(knapsack, level, weight, profit, bound, maxProfit)

    if (level == len(obj)) :  	# 단말 노드까지 처리된 경우
        return maxProfit		# 지금까지의 최대 가치를 반환

    if weight + obj[level][0] <= W :# 용량이 넘지 않아야 시도할 수 있음
        newWeight = weight + obj[level][0]
        newProfit = profit + obj[level][1]
        if newProfit > maxProfit :	# 현재 가치합이 최대가치보다 크면
            maxProfit = newProfit	# 최대가치 갱신

        newBound  = bound1(obj, W, level, newWeight, newProfit)
        if newBound >= maxProfit :	# 한계합>=최고합: 탐색 계속 진행
            knapsack.append(obj[level][2])    # 물건을 넣고, 서브트리 탐색
            maxProfit = knapSack_bnb(obj, knapsack, W, level+1, newWeight, 
									newProfit, maxProfit, newBound)  
            knapsack.pop()                  # 원래대로 꺼냄

    newWeight = weight				# 무게합 변화 없음
    newProfit = profit				# 가치합 변화 없음
    newBound  = bound1(obj, W, level, newWeight, newProfit)
    if newBound >= maxProfit :		# 한계가치>=최대가치: 계속탐색
        maxProfit = knapSack_bnb(obj, knapsack, W, level+1, newWeight,
									 newProfit, maxProfit, newBound) 

    return maxProfit				# 최고합 반환


def bound1(obj, W, level, weight, profit) :
    if weight > W : 		# weight가 용량을 넘치면 한계를 0으로 반환 
        return 0

    pBound = profit			# 일단 한계 가치는 현재 노드의 profit
    for j in range(level+1, len(obj)) : # 남은 모든 물건들을
        pBound += obj[j][1]	# 무게를 생각하지 않고 배낭에 모두 넣음

    return pBound			# 남은 물건을 모두 넣을 때 얻을 수 있는 가치



obj = [(10,100,"A"), (7,63,"B"), (8,56,"C"), (4,12,"D")]
print(obj)
print("0-1배낭문제(분기 한정): ", knapSack_bnb(obj, [], 15, 0,0,0,0, 0) )


#arr.sort(key= lambda e : e[1]/e[0], reverse=True)
#print(arr)
#print("0-1배낭문제(분기 한정): ", knapSack_DFS_bnb(arr, W)) 
