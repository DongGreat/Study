from typing import Counter


def isSafe(board, x, y):
    N = len(board)

    for i in range(y):      
        if board[i][x] == 1: return False   # 세로방향 검사
    for i, j in zip(range(y-1, -1, -1), range(x-1, -1, -1)):
        if board[i][j] == 1: return False   # \ 방향 검사
    for i, j in zip(range(y-1, -1, -1), range(x+1, N)):
        if board[i][j] == 1: return False   # / 방향 검사
    return True     # 모든 방향으로 OK이면 (x,y)는 safe한 위치



def solve_N_Queen(board, y):
    N = len(board)
    global c
    if y == N:                      # 하나의 해 탐색 성공
        c += 1
        # printBoard(board)           # 화면에 출력
        return                      # 백트래킹

    for x in range(N):           	# 현재 y에서 모든 x를 테스트 함
        if isSafe(board, x, y):   	# (x,y)에 퀸이 들어갈 수 있으면
            board[y][x] = 1        	# 넣고
            solve_N_Queen(board, y+1)# 다음 행 처리: 상태공간트리 탐색
            board[y][x] = 0			# 처리가 끝났으니 다시 꺼냄


def printBoard(board):
    for i in range(len(board)):
        for j in range(len(board)):
            if board[i][j] == 1:
                print("Q", end=" ")
            else:
                print(".", end=" ")
        print()
    print()


N = int(input("N을 입력하세요 : "))
for i in range(4, N+1):
    c = 0
    board = [[0 for i in range(i)] for j in range(i)]
    solve_N_Queen(board, 0)
    print(f"{i} -Queen = {c}")