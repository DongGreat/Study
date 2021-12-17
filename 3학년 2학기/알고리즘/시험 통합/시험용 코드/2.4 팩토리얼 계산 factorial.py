def factorial(n) :			# 순환적으로 구현한 factorial 함수
    if n == 0 :			    # 종료 조건
        return 1			# 순환을 멈추는 부분
    else :
        return n * factorial(n - 1)	# 자기 자신을 순환적으로 호출. 

def factorial_iter(n) :		        # 반복 구조로 구현한 Factorial 함수
    result = 1	
    for k in range(n, 0, -1) :	# k: n, n-1, ..., 2, 1
        result = result * k	    # 기본 연산
    return result

print('Factorial순환(3) = ', factorial(3))
print('Factorial반복(3) = ', factorial_iter(3))

