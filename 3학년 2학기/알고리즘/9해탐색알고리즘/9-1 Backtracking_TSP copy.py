from copy import deepcopy


class State:
    def __init__(self, N):
        self.dist = float('inf')
        self.tour = []
        self.visited = [False for i in range(N)]


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
    print('\t', c.dist)


def backtrack_TSP(s):
    global num_states
    for i in range(N):
        if not s.visited[i]:
            c = State(N)  # s의 자식 상태 c 만들기   
            num_states += 1
            c.tour = deepcopy(s.tour)
            c.visited = deepcopy(s.visited)
            c.visited[i] = True
            c.tour.append(i)  # 다음 방문 도시 i를 tour에 추가
            c.dist = s.dist + a[c.tour[-2]][c.tour[-1]]
            if len(c.tour) == N:  # 완전한 해인 경우
                c.dist += a[c.tour[N - 1]][c.tour[0]]
            print_state(c)
            if len(c.tour) == N:
                if c.dist < best.dist:  # 최적해 갱신
                    best.tour = deepcopy(c.tour)
                    best.dist = c.dist
            if c.dist < best.dist:  # c가 best보다 작은 dist를 가지면
                backtrack_TSP(c)


a = [[0, 10, 10, 30, 25],
     [10, 0, 14, 21, 10],
     [10, 18, 0, 7, 9],
     [8, 11, 7, 0, 3],
     [14, 10, 10, 3, 0]]
N = len(a[0])
num_states = 1
best = State(N)
best.dist = float('inf')  # best 해의 초기화
s = State(N)
s.tour.append(0)  # 초기 상태의 초기화
s.visited[0] = True
s.dist = 0

backtrack_TSP(s)

print('백트래킹으로 찾은 TSP 최적 경로')
for i in range(N):
    print('도시 %2d -> ' % best.tour[i], end='')
print(' 도시  0')
print('최적 경로의 길이  = %2d' % best.dist)
print('총 상태 수:', num_states)
