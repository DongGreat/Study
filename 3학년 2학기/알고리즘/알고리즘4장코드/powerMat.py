def powerMat(x, n) :
	if n == 1 :												# 종료조건 
		return x
	elif (n % 2) == 0 :                     				# n이 짝수 
		return powerMat(multMat(x,x), n // 2)
	else :													# n이 홀수
		return multMat(x, powerMat(multMat(x,x), (n - 1) // 2)) 

