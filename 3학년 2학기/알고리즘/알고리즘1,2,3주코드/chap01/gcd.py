def gcd(a, b) :
    print("gcd", (a,b))
    while b != 0 :          # b가 0이 아닐 때 까지
        r = a % b           
        a = b
        b = r
        print("gcd", (a,b))
    return a                # 결과 반환

print( "60과 28의 최대 공약수 =", gcd(60, 28))
