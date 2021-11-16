INF = 9999
def getMinVertex(dist, selected) :
    minv = -1	
    mindist = INF
    for v in range(len(dist)) :					# 모든 정점들에 대해
        if not selected[v] and dist[v]<mindist :	# 선택 안 되었고  
            mindist = dist[v]						# 가중치가 작으면
            minv = v								# minv 갱신
    return minv					# 최소 가중치의 정점 반환


def MSTPrim(vertex, adj) :
    vsize = len(vertex)
    dist = [INF] * vsize
    dist[0] = 0					# dist: [0, INF, ... INF]
    selected = [False] * vsize	# selected: [False, False, ... False]

    for i in range(vsize) :		# 정점의 수 만큼 반복
        u = getMinVertex(dist, selected)
        selected[u] = True		# u는 이제 선택됨
        print(vertex[u], end=':')	# u를 출력
        print(dist)				# dist 를 출력

        for v in range(vsize) :	# 내부 루프
            if (adj[u][v] != None):	# (u,v) 간선이 있으면 dist[v] 갱신
                if selected[v]==False and adj[u][v]< dist[v] :
                    dist[v] = adj[u][v]



vertex =   [  'A', 'B', 'C', 'D', 'E' ]
weight = [ [ None,   7,   4,None,   2 ],
           [    7,None,None,   3,   4 ],
           [    4,None,None,   6,   3 ],
           [ None,   3,   6,None,   5 ],
           [    2,   4,   3,   5,None ]]
print("MST By Prim's Algorithm")
MSTPrim(vertex, weight)