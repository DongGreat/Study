def isSafe(g, v, c, color): 
    for i in range(len(g)):	# 그래프의 모든 정점 i에 대해
        if g[v][i] == 1 and color[i] == c:	# 인접하고 색이 같으면
            return False		# 칠할 수 없는 색
    return True				# 색이 같은 인접정점이 없으면 True


def DFS_graph_coloring(graph, k, v, color): 
    if v == len(graph):			# 색칠 성공
        return True
  
    for c in range(1, k+1):		# 모든 색상에 대해 [1,...k]
        if isSafe(graph, v, c, color) : # v를 c로 칠할 수 있으면
            color[v] = c
            if DFS_graph_coloring(graph, k, v+1, color): 
                return True
            color[v] = 0

    return False				# 정점 색칠 실패

def graphColouring(graph, k, states): 
    color = [0] * len(graph)       # 정점의 색 배정 리스트: 초기 0
    ret = DFS_graph_coloring(graph, k, 0, color)  # 0번 정점부터 처리
    if ret : 
        for i in range(len(graph)) :
            print("%3s = "%states[i], color_name[color[i]])
    else :
        print("그래프를 색칠할 수 없음!")


states = ['NT', 'WA', 'Q', 'SA', 'NSW', 'V']
color_name = ["none", "빨강", "초록", "파랑", "노랑", "보라"]
g = [ [0, 1, 1, 1, 0, 0],
      [1, 0, 0, 1, 0, 0],
      [1, 0, 0, 1, 1, 0],
      [1, 1, 1, 0, 1, 1],
      [0, 0, 1, 1, 0, 1],
      [0, 0, 0, 1, 1, 0],]
print("색상 3개:")
graphColouring(g, 3, states) 
print("색상 2개:")
graphColouring(g, 2, states) 