def VertexCover(adj) :
    V = len(adj)                    # 정점의 개수
    visited = [False] * V           # 정점의 방문 표시
    c = []                          # 근사해 집합
  
    for u in range(V):
        if visited[u] == False :
            for v in range(V):
                # 아직 방문하지 않은 두 정점 사이의 간선 (u,v)를 선택 
                if adj[u][v] != 0 and visited[v]==False :
                    c.append(u)         # u,v를 모두 해에 넣음
                    c.append(v)
                    visited[u] = True  # u,v와 연결된 모든 간선들을
                    visited[v] = True   # 더 이상 고려하지 않음.
                    break 
    return c



G1 = [ [0, 1, 1, 0, 0, 0, 0], 
       [1, 0, 0, 1, 0, 0, 0], 
       [1, 0, 0, 0, 0, 0, 0], 
       [0, 1, 0, 0, 1, 0, 0], 
       [0, 0, 0, 1, 0, 1, 0], 
       [0, 0, 0, 0, 1, 0, 1], 
       [0, 0, 0, 0, 0, 1, 0]]
c1 = VertexCover(G1) 
print("Vertex Cover(G1)=", len(c1), c1)


G2 =[ [0, 1, 0, 0, 0, 0], 
      [1, 0, 1, 1, 0, 0], 
      [0, 1, 0, 0, 1, 1], 
      [0, 1, 0, 0, 1, 0], 
      [0, 0, 1, 1, 0, 0], 
      [0, 0, 1, 0, 0, 0]]
c2 = VertexCover(G2) 
print("Vertex Cover(G2)=", len(c2), c2)