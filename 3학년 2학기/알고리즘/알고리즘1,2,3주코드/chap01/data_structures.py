# 파이썬에서의 배열 (리스트)
A = [ 1, 2, 3, 4, 5 ]	# 파이썬 리스트 A
print( "A =", A)
print(A[0])		        # 0번째 항목(1) 출력. print()는 파이썬의 출력함수
print(len(A))		    # 리스트 A의 길이(5)를 출력
A.append(9)		        # 리스트 맨 뒤에 9 추가: [ 1, 2, 3, 4, 5, 9 ]
print( "A =", A)
A.pop(2)		        # 2번째 항목(3) 삭제: [ 1, 2, 4, 5, 9 ]
print( "A =", A)


# 파이썬에서의 큐/스택
import queue 			# 파이썬의 큐 모듈 포함
Q = queue.Queue(maxsize=20) 	# 큐 객체 생성(최대크기 20)
S = queue.LifoQueue(maxsize=20)	# 스택 객체 생성(최대크기 20)
Q.put(20) 			    # 큐에 20을 삽입 (enqueue)
Q.put(15)
print(Q.queue)
val = Q.get() 			# 큐에서 항목 삭제(꺼냄, dequeue)
print(val)
val = Q.get()
print(val)

S.put(30) 			    # 스택에 20을 삽입 (push)
val = S.get() 			# 스택에서 항목 삭제(꺼냄, pop)
print(val)


# 파이썬의 집합
s1 = { 1,2,3 }			# 집합 객체
s2 = { 2,3,4,5 }		# 집합 객체
s3 = s1.union(s2)		# 합집합
s4 = s1.intersection(s2)	# 교집합
s5 = s1 - s2			# 차집합
print("s1:", s1)
print("s2:", s2)
print("s3:", s3)
print("s4:", s4)
print("s5:", s5) 


# 파이썬의 딕셔너리
map = { '김연아':'피겨', '류현진':'야구', '쿠드롱':'당구', '메시':'축구' }
print(map)
print('쿠드롱이 뭐하는 사람이지? ', map['쿠드롱'])

map['나달'] = '테니스'	# 맵에 하나의 항목 추가(항목 변경 코드가 아님)
map.update({'최민영':'여자야구', '고진영':'골프'})	# 여러 항목 추가
print(map)

print('쿠드롱 : ', '쿠드롱' in map)
print('페더러 : ', '페더러' in map)
