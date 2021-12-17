import random, time
from copy import deepcopy
POP_SIZE = 6  # 반드시 짝수
MAX_ITERS = 100


class Candidate:
    def __init__(self, N):
        self.tour = [-1 for _ in range(N)]
        self.fitness = float('inf')


def compute_fitness(s):  # 적합도 계산
    f = 0
    for i in range(N-1):
        f += a[s.tour[i]][s.tour[i+1]]   
    return f + a[s.tour[N-1]][s.tour[0]]


def fix_solution(c):
    mark = [0 for j in range(N)]
    for j in range(N): 
        mark[c.tour[j]] += 1
    indices_0 = [i for i, x in enumerate(mark) if x == 0]
    indices_2 = [i for i, x in enumerate(mark) if x == 2]
    k = 0
    for j in range(N):
        if (j < first_pt or j >= second_pt) and c.tour[j] in indices_2:
            indices_2.remove(c.tour[j])
            c.tour[j] = indices_0[k]
            k += 1 


a = [[0, 2, 7, 3, 10],
     [2, 0, 3, 5, 4],
     [7, 3, 0, 6, 1],
     [3, 5, 6, 0, 9],
     [10, 4, 1, 9, 0]]
N = len(a[0])  
c_sol = [None for _ in range(POP_SIZE)]
for i in range(POP_SIZE):  # 초기 해 집단 만들기
    sol = [j for j in range(N)]             
    random.shuffle(sol)
    c_sol[i] = Candidate(N)
    c_sol[i].tour = deepcopy(sol)
    c_sol[i].fitness = compute_fitness(c_sol[i])

random.seed(time.time())
num_iters = 1
while num_iters < MAX_ITERS:
    # 선택  연산, binary tournament selection
    selected = []
    for i in range(POP_SIZE):
        s1 = random.randint(0, N-1)  
        s2 = random.randint(0, N-1)
        s_sol = Candidate(N)
        if c_sol[s1].fitness < c_sol[s2].fitness: 
            s_sol.tour = deepcopy(c_sol[s1].tour)  
            s_sol.fitness = c_sol[s1].fitness
        else:
            s_sol.tour = deepcopy(c_sol[s2].tour)  
            s_sol.fitness = c_sol[s2].fitness
        selected.append(s_sol)
    c_sol = deepcopy(selected)
    random.shuffle(c_sol)  # 짝짓기위해 무작위 자리 바꾸기

    # 교차 연산:  Crossover Rate=1.0으로 모든 후보해가 교차연산에 참여
    # 2점-교차 연산을 위해, 1,...,POP_SIZE-1 중에서 두 점을 선택  
    first_pt  = random.randint(0, N-2)
    second_pt = random.randint(first_pt+1, N-1) 

    # 교차 연산 수행  
    for i in range(0, POP_SIZE-1, 2):  # 차례로 후보해 2개씩 교차연산 수행
        for j in range(first_pt, second_pt, 1):
            c_sol[i].tour[j], c_sol[i+1].tour[j] = c_sol[i+1].tour[j], c_sol[i].tour[j]
    # 중복 도시 제거
    for i in range(POP_SIZE):
        fix_solution(c_sol[i])
        
    # 돌연변이 연산: 
    if random.randint(0, N-1) == 0:
        i = random.randint(0, POP_SIZE-1) 
        j = random.randint(0, N-1) 
        k = random.randint(0, N-1) 
        c_sol[i].tour[j], c_sol[i].tour[k] = c_sol[i].tour[k], c_sol[i].tour[j]
 
    # 적합도 평가
    for i in range(POP_SIZE): 
        c_sol[i].fitness = compute_fitness(c_sol[i])

    num_iters += 1

best_value = float('inf')  # 가장 우수한 해 찾기
for i in range(POP_SIZE):
    if best_value > c_sol[i].fitness:
        best_value = c_sol[i].fitness
        best = i
      
print('유전자 알고리즘으로 찾은 TSP 경로:')  
for i in range(N):   
    print('도시 %d -> ' % c_sol[best].tour[i], end='')
print(' 도시 %d ' % c_sol[best].tour[0])         
print('경로의 길이 = %d' % c_sol[best].fitness)
