def isSafe( maze, x, y, mark ):
    W, H = len(maze[0]), len(maze)			# 미로맵의 가로 세로 크기
    if x>=0 and x<W and y>=0 and y<H :			# (1)미로맵 내부 
        if maze[y][x]!=0 and mark[y][x]==0:	# (2-3)벽이 아니고 방문X
            return True 
    return False 



def solve_maze( maze, x, y ): 		# 미로탐색 주 함수
    W, H = len(maze[0]), len(maze)                  # 미로 맵의 크기
    sol = [[0 for j in range(W)] for i in range(H)] # 해 경로 맵
    mark= [[0 for j in range(W)] for i in range(H)] # 방문 맵
      
    if DFS_maze(maze, x, y, sol, mark) == False:	# 탐색 실패
        print("출구를 찾을 수 없음") 
    else :    									# 탐색 성공
        for i in sol: print(i)					# 해 경로 맵 출력
      
def DFS_maze(maze, x, y, sol, mark):# 순환호출 함수
    W, H = len(maze[0]), len(maze)  # 미로 맵의 크기

    if not isSafe(maze, x,y, mark): # 유효하지 않은 위치이면
        return False                # False를 반환(백트래킹)

    mark[y][x] = 1                  # (x, y)를 지나갔음 
    sol[y][x] = 1                   # (x, y)가 path의 일부임 
    if maze[y][x] == 2 :            # 출구 도착 
        return True                 # True를 반환(탐색종료)

    if DFS_maze(maze, x+1, y, sol, mark)==True: return True
    if DFS_maze(maze, x, y+1, sol, mark)==True: return True
    if DFS_maze(maze, x-1, y, sol, mark)==True: return True
    if DFS_maze(maze, x, y-1, sol, mark)==True: return True

    sol[y][x] = 0    # (x,y)는 이제 해의 일부가 아님-> sol에서 제거
    return False

maze = [ [0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0], 
         [0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 0],
         [0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0],
         [0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0],
         [0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 2],
         [0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0],
         [0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0],
         [0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0],
         [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
solve_maze(maze, 3, 0) 