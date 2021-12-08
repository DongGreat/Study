import heapq, math
from copy import deepcopy


class State:
    def __init__(self, N):
        self.dist = 0  # 도시 0부터 last 도시까지의 거리
        self.bound = float('inf')  # 상태의 한정값
        self.tour = [] # 방문하는 도시 순서
        self.visited = [False for _ in range(N)]  # 방문한 도시를 True로
        
    def __lt__(self, other):  # 객체를 bound로 heapq에서 비교하기위해
        return self.bound < other.bound


def compute_bound(s):  # 상태 s의 한정값 계산
    total = 0
    if len(s.tour) < N:
        for i in range(N):
            if not s.visited[i]:  # s의 tour에 없는 각 점에 대해
                e_list = [x for x in a[i] if x != 0]  # 대각선 원소 0 제외
                smallest = min(e_list)
                e_list.remove(smallest)
                total += smallest + min(e_list)  # smallest와 2nd smallest 간선 가중치
        if len(s.tour) > 1:
            e_list = [x for x in a[s.tour[0]] if x != 0]  # 대각선 원소 0 제외
            e_list.remove(a[s.tour[0]][s.tour[1]])
            total += min(e_list)  # 도시 0으로 돌아오는 간선의 최소 가중치
            
            e_list = [x for x in a[s.tour[-1]] if x != 0]  # 대각선 원소 0 제외
            e_list.remove(a[s.tour[-2]][s.tour[-1]])
            total += min(e_list)  # 마지막 도시에서 나가는 간선의 최소 가중치
        return math.ceil(total/2.0) + s.dist
    else:
        return s.dist


def print_state(c):
    for x in range(len(c.tour)):
        if c.tour[x] == 0:
            print(' A', end='')
        elif c.tour[x] == 1:
            print(' B', end='')
        elif c.tour[x] == 2:
            print(' C', end='')
        elif c.tour[x] == 3:
            print(' D', end='')
        else:
            print(' E', end='')
    print('\t', c.bound)


a = [[0, 10, 10, 3, 10],
     [10, 0, 3, 5, 4],
     [10, 3, 0, 6, 1],
     [3, 5, 6, 0, 9],
     [10, 4, 1, 9, 0]]
N = len(a[0])
best = State(N)
best.dist = float('inf')  # best 해의 초기화
best_value = float('inf')

s = State(N)
s.tour.append(0)  # 시작 도시 0을 tour에 추가
s.bound = compute_bound(s)
s.visited[0] = True
s.dist = 0
num_states = 1

pq = []  # 상태를 저장할 우선순위큐
heapq.heappush(pq, s)
while len(pq) > 0:
    s = heapq.heappop(pq)
    if s.bound < best_value:
        for i in range(N):
            if not s.visited[i]:
                c = State(N)  # s의 자식 상태 c 만들기  
                num_states += 1 
                c.tour = deepcopy(s.tour)
                c.visited = deepcopy(s.visited)
                c.tour.append(i)  # 다음 방문 도시 i를 tour에 추가
                c.visited[i] = True
                c.dist = s.dist + a[c.tour[-2]][c.tour[-1]]                                  
                if len(c.tour) == N:  # 완전한 해인 경우
                    c.dist += a[c.tour[N-1]][c.tour[0]]                    
                c.bound = compute_bound(c)  # c의 한정값 계산   
                print_state(c)
                if len(c.tour) == N:
                    if c.dist < best_value: # 최적해 갱신
                        best.tour = deepcopy(c.tour) 
                        best.dist = c.dist
                        best_value = c.dist
                if c.bound < best_value:  
                    heapq.heappush(pq, c) # c를 ActiveNodes에 추가
                    
print('분기 한정 기법으로 찾은 TSP 최적 경로:', end='')
for i in range(N):   
    print('도시 %2d -> ' % best.tour[i], end='')
print(' 도시  0')      
print('최적 경로의 길이 = %2d' % best.dist)
print('총 상태 수:', num_states)
