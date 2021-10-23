N = int(input())
score = list(map(int, input().split(" ")))
s_max = max(score)
sum = 0

for i in range(N):
    score[i] = score[i]/s_max*100
    sum += score[i]

print(sum / N)