import queue
def bfs(graph, start):
    visited = { start }              	# 맨 처음에는 start만 방문한 정점임
    que = queue.Queue()                 # 파이썬 큐 모듈의 큐 객체 생성
    que.put(start)
    while not que.empty():              # 큐에 항목이 있을 때 까지
        v = que.get()                   # 큐에서 하나의 정점 v를 빼냄
        print(v, end=' ')               # v는 방문했음을 출력
        nbr = graph[v] - visited        # nbr = {v의 인접정점} - {방문정점}
        for u in nbr:                   # 갈 수 있는 모든 인접 정점에 대해
            visited.add(u)              # 이제 u는 방문했음
            que.put(u)                  # u를 큐에 삽입

mygraph = { "A" : {"B","C"},
            "B" : {"A", "D"},
            "C" : {"A", "D", "E"},
            "D" : {"B", "C", "F"},
            "E" : {"C", "G", "H"},
            "F" : {"D"},
            "G" : {"E", "H"},
            "H" : {"E", "G"}
          }
print('BFS : ', end='')
bfs(mygraph, "A")
print()
