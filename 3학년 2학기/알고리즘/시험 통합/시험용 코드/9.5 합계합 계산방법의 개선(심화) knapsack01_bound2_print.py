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

        newBound  = bound2(obj, W, level, newWeight, newProfit)
        if newBound >= maxProfit :	# 한계합>=최고합: 탐색 계속 진행
            knapsack.append(obj[level][2])    # 물건을 넣고, 서브트리 탐색
            maxProfit = knapSack_bnb(obj, knapsack, W, level+1, newWeight, 
									newProfit, maxProfit, newBound)  
            knapsack.pop()                  # 원래대로 꺼냄

    newWeight = weight				# 무게합 변화 없음
    newProfit = profit				# 가치합 변화 없음
    newBound  = bound2(obj, W, level, newWeight, newProfit)
    if newBound >= maxProfit :		# 한계가치>=최대가치: 계속탐색
        maxProfit = knapSack_bnb(obj, knapsack, W, level+1, newWeight,
									 newProfit, maxProfit, newBound) 

    return maxProfit				# 최고합 반환


def bound2(arr, W, level, weight, profit) :
    if weight > W :
        return 0

    pBound = profit
    tWeight= weight
  
    j = level+1                 # 다음 물건부터 넣어봄.
    n = len(arr)                # 마지막 물건까지
    while j < n and (tWeight+arr[j][0] <= W) : # 용량을 넘지 않는 동안
        tWeight += arr[j][0]    # j번째 물건을 넣음. tWeight 증가 
        pBound  += arr[j][1]    # tWeight와 pBound 갱신
        j += 1                  # 다음 물건에 대해 처리

	  # 분할 가능한 배낭 채우기 문제로 남은 용량을 채움
    if (j < n) :                # 배낭에 남은 용량에 대해 처리하는 코드.
        pBound += (W - tWeight) * (arr[j][1]/arr[j][0]) 
  
    return pBound               # 최종적인 한계가치을 반환


obj = [(2.5,30,"A"), (3.2,50,"B"), (1.7,70,"C"), (5,60,"D"), (4.1,40,"E") ]
obj.sort(key= lambda e : e[1]/e[0], reverse=True)
print(obj)
print("0-1배낭문제(분기 한정): ", knapSack_bnb(obj, [], 10, 0,0,0,0, 0) )
