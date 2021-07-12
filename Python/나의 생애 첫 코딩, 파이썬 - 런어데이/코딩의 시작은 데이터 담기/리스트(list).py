d=[1, 2, 3, 4, 5]
e=['수박', '딸기', '사과', '포도']

print(d[0])
print(d[1])
print(d[1:4])
print(d[-1])

d[0]=0
print(d)

print(d+[6, 7, 8])

d.append(9) # 요소 추가하기
print(d)

d.reverse() # 리스트의 요소 순서를 역순으로 바꾸기
print(d)
e.reverse()
print(e)

d.sort() # 리드트의 요소 순서를 정렬하기(오름차순, 가나다순)
print(d)
e.sort()
print(e)

print(len(d)) # 리스트에 있는 요소 개수 구하기
print(sum(d)) # 리스트에 있는 요소의 합 구하기

e.pop(2) # 특정한 위치에 있는 요소 삭제하기
print(e)

print("-".join(e)) # 리스트의 요소를 문자열로 결합하기