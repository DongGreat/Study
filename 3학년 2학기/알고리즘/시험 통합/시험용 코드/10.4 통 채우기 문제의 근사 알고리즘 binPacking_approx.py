########################################################################
def binPacking_NextFit(weight, C) : 
    nBins = 0           			# 통의 수
    remain = 0          			# 현재 통의 남은 공간. 최초:0

    for i in range(len(weight)) :   # 통에 물건을 순서대로 하나씩 넣음
        if weight[i] > remain :     # 현재 통에 물건을 넣을 수 없으면
            nBins += 1              # 새 통을 사용
            remain = C - weight[i]  # 새 통의 남은 공간 계산
        else :                      # 현재 통에 물건을 넣을 수 있으면
            remain -= weight[i]     # 현재 통의 남은 공간 갱신

    return nBins                    # 필요한 통의 수 반환


########################################################################
def binPacking_FirstFit(weight, C) : 
    nBins = 0                       # 통의 수
    remain = [0]*len(weight)        # 현재까지 사용된 통의 남은 공간
  
    for i in range(len(weight)) :   # 통에 물건을 순서대로 하나씩 넣음
        bFound = False
#        for j in range(len(weight)):    # 처음으로 가능한 통을 찾아
        for j in range(nBins):    # 처음으로 가능한 통을 찾아
            if remain[j] >= weight[i]:  # 물건을 넣음
                remain[j] -= weight[i] 
                bFound = True
                break; 
        if bFound == False :       	# 가능한 통이 없으면 새 통에 넣음
            remain[nBins] = C - weight[i] 
            nBins += 1 

    return nBins 

########################################################################
def binPacking_FirstFitDec(weight, c) : 
    weight.sort(reverse=True)               # 무게의 역순으로 정렬
    return binPacking_FirstFit(weight, c)   # FirstFit 수행 
  
########################################################################
weight = [5, 7, 4, 2, 5, 1, 6, 2, 5]
c = 10
print(weight , c)
print("필요한 통의 수(Next Fit) : ", binPacking_NextFit(weight, c) )
print("필요한 통의 수(FirstFit) : ", binPacking_FirstFit(weight, c) )
print("필요한 통의 수(FirstFitDec) : ", binPacking_FirstFitDec(weight, c) )

