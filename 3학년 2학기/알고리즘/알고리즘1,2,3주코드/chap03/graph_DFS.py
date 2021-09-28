def dfs(graph, start, visited ):			# 깊이우선탐색 알고리즘
    if start not in visited :				# start가 방문하지 않은 정점이면
        visited.add(start)					# start를 방문한 노드 집합에 추가
        print(start, end=' ')				# start를 방문했다고 출력함
        nbr = graph[start] - visited		# nbr: 차집합 연산 이용
        for v in nbr:						# v ∈ {인접정점} - {방문정점}
            dfs(graph, v, visited)			# v에 대해 dfs를 순환적으로 호출


mygraph = { "A" : {"B","C"},
            "B" : {"A", "D"},
            "C" : {"A", "D", "E"},
            "D" : {"B", "C", "F"},
            "E" : {"C", "G", "H"},
            "F" : {"D"},
            "G" : {"E", "H"},
            "H" : {"E", "G"}
          }

print('DFS : ', end='')
dfs(mygraph, "A", set() )
print()
