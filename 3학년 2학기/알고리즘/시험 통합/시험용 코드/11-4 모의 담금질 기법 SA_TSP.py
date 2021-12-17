import math, random, time
from copy import deepcopy

INIT_TEMP = 200    # 초기 온도
FINAL_TEMP = 1     # 최종 온도
ALPHA = 0.8        # 냉각율
MAX_ITERS = 10


class Candidate:
    def __init__(self, N):
        self.tour = [i for i in range(N)]
        self.dist = float('inf')


def evaluation(s):  # 후보해 평가
    e = 0
    for i in range(N-1):
        e += a[s.tour[i]][s.tour[i+1]]
    return e + a[s.tour[N-1]][s.tour[0]]


a = [[0, 2, 7, 3, 10],
     [2, 0, 3, 5, 4],
     [7, 3, 0, 6, 1],
     [3, 5, 6, 0, 9],
     [10, 4, 1, 9, 0]]
N = len(a[0]) 

# 초기 후보해 만들기
random.seed(time.time())   
c_sol = Candidate(N)
random.shuffle(c_sol.tour)
c_sol.dist = evaluation(c_sol)
print('초기 후보해: ', c_sol.tour, ' 경로의 길이 = ', c_sol.dist)

best_sol = Candidate(N)
best_sol.tour = deepcopy(c_sol.tour)
best_sol.dist = c_sol.dist

T = INIT_TEMP
while T > FINAL_TEMP: 
    kT = int(MAX_ITERS - INIT_TEMP // T)
    if kT <= 0:
        kT = 1

    for i in range(kT): 
        n_sol = Candidate(N)  # 이웃해 만들기
        n_sol.tour = deepcopy(c_sol.tour)
        n_sol.dist = c_sol.dist
        j = random.randint(0, N-1)
        k = random.randint(0, N-1)
        if k == j:
            k = random.randint(0, N-1)  # 바꿀 도시가 동일한 경우 다른 도시를 선택
        n_sol.tour[j], n_sol.tour[k] = n_sol.tour[k], n_sol.tour[j]
        n_sol.dist = evaluation(n_sol)

        delta = n_sol.dist - c_sol.dist
        if delta < 0:  # delta가 음수(더 우수한 해)이면, 이웃해가 현재해로 된다.
            c_sol.tour = deepcopy(n_sol.tour)  
            c_sol.dist = n_sol.dist  
            
        else:  # 이웃해가 현재해보다 나쁜 경우
            prob = int( 1.0 / math.exp(delta / T) * 100.0)
            q = random.randint(0, 99)
            if q < prob: # prob 확률로 이웃해가 현재해로 된다.
                c_sol.tour = deepcopy(n_sol.tour)
                c_sol.dist = n_sol.dist
            
        if c_sol.dist < best_sol.dist:  # best 길이 갱신
            best_sol.dist = c_sol.dist
            best_sol.tour = deepcopy(c_sol.tour)
         
        T *= ALPHA

print('모의 담금질 기법으로 찾은 TSP 해:')
for j in range(N):
    print('도시 %d -> ' % best_sol.tour[j], end='')
print(' 도시 %d' % best_sol.tour[0])
print('경로의 길이 = %d ' % best_sol.dist)
