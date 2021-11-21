def knapSack_bnb(obj, W, level, weight, profit, maxProfit) : 

    if (level == len(obj)) :  	# 단말 노드까지 처리된 경우
        return maxProfit		# 지금까지의 최대 가치를 반환

    if weight + obj[level][0] <= W :# 용량이 넘지 않아야 시도할 수 있음
        newWeight = weight + obj[level][0]
        newProfit = profit + obj[level][1]
        if newProfit > maxProfit :	# 현재 가치합이 최대가치보다 크면
            maxProfit = newProfit	# 최대가치 갱신

        newBound  = bound(obj, W, level, newWeight, newProfit)
        if newBound >= maxProfit :	# 한계합>=최고합: 탐색 계속 진행
            maxProfit = knapSack_bnb(obj, W, level+1, newWeight, 
									newProfit, maxProfit)  

    newWeight = weight				# 무게합 변화 없음
    newProfit = profit				# 가치합 변화 없음
    newBound  = bound(obj, W, level, newWeight, newProfit)
    if newBound >= maxProfit :		# 한계가치>=최대가치: 계속탐색
        maxProfit = knapSack_bnb(obj, W, level+1, newWeight,
									 newProfit, maxProfit) 

    return maxProfit				# 최고합 반환


def bound(obj, W, level, weight, profit) :
    if weight > W : 		# weight가 용량을 넘치면 한계를 0으로 반환 
        return 0

    pBound = profit			# 일단 한계 가치는 현재 노드의 profit
    for j in range(level+1, len(obj)) : # 남은 모든 물건들을
        pBound += obj[j][1]	# 무게를 생각하지 않고 배낭에 모두 넣음

    return pBound			# 남은 물건을 모두 넣을 때 얻을 수 있는 가치



obj = [(2.5,30,"A"), (3.2,50,"B"), (1.7,70,"C"), (5,60,"D"), (4.1,40,"E") ]
print(obj)
print("0-1배낭문제(분기 한정): ", knapSack_bnb(obj, 10, 0,0,0,0)) 