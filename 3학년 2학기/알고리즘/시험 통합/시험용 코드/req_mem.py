def fib_req(n) : # 순환
    if n == 0 :
        return 0        # 정복: 0번째 달
    elif n == 1 :
        return 1        # 정복: 1번째 달
    elif n == 2 :
        return 2
    else :
        return 3*fib_req(n-1)+2*fib_req(n-2)+fib_req(n-3)   # 분할(순환호출), 병합(결과 더하기)


def fib_dp_mem(n) : # 메모이제이션
    if( mem[n] == None ) :      # 풀리지 않은 경우-> 계산하고 저장
        if n < 3 :
            mem[n] = n          # 기반 상황: n<=1
        else:                   # 일반 상황: otherwise
            mem[n] = 3*fib_dp_mem(n-1)+2*fib_dp_mem(n-2)+fib_dp_mem(n-3)
    return mem[n]


n = 3
print("순환: Fibonacci(%d) = "%n, fib_req(n))
mem = [None] * (n+1)
print('동적계획법(메모이제이션): Fibonacci(%d) = '%n, fib_dp_mem(n))