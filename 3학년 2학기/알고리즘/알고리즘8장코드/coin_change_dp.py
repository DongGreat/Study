def min_coins_dp( coins, V ): 
    if dp[V]==None:
        min_coins=INF
        for i in range(len(coins)):
            if V-coins[i]>=0:
                n_coins=min_coins_dp(coins, V-coins[i])+1
                if min_coins>n_coins: 
                    min_coins=n_coins
        dp[V]=min_coins
        return dp[V]
    else:
        return dp[V]

INF=float("inf")

coins = [500 , 100 , 50 , 10 , 5 , 1] 
V = 580

dp=[None]*(V+1)
dp[0]=0

print("잔돈 액수 = ", V)
print("동전 종류 = ", coins)
print("동전 개수(동적계획법) = ", min_coins_dp(coins, V ))
