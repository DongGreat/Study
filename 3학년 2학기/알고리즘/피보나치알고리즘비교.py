########################################################################
# Fibonacci (순환): O(2^n)
def fib(n) :
    if n == 0 :
        return 0		# 정복: 0번째 달
    elif n == 1 :
         return 1		# 정복: 1번째 달
    else : 
        return fib(n - 1) + fib(n - 2)	# 분할(순환호출), 병합(결과 더하기)

########################################################################
# Fibonacci (반복): O(n)
def fib_iter(n) :
	if (n < 2): return n
	last = 0
	current = 1
	for i in range(2, n+1) :
		tmp = current
		current += last
		last = tmp
	return current
########################################################################

import time

n=int(input("원하는 수를 입력하세요 : "))

start=time.time()
result=fib(n)
end=time.time()
print("Fibonacci순환(%d) = %d 실행시간:%f초"%(n,result, end-start))

start=time.time()
result=fib_iter(n)
end=time.time()
print("Fibonacci반복(%d) = %d 실행시간:%f초"%(n,result, end-start))
