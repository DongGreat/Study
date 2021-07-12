rep1 = 11
rep2 = 3
rep3 = "서울시 부동산 매매 추이"
rep4 = [2, 4, 7, 8, 10]
rep5 = {'grape':'포도', 'melon':'메론', 'apple':'사과', 'banana':'오렌지'}

# 1
print(type(rep1))
print(type(rep2))
print(type(rep3))
print(type(rep4))
print(type(rep5))

# 2
print(rep1 // rep2)
print(rep1 % rep2)

# 3
print(rep2 ** 3)

# 4
print(rep3.split(" "))

# 5
rep4[2] = 6
print(rep4)

# 6
print(sum(rep4))

# 7
rep4.append(12)
print(rep4)

# 8
rep4.pop(3)
print(rep4)

# 9
rep4.reverse()
print(rep4)

# 10
rep5['banana'] = '바나나'
rep5['orange'] = '오렌지'
print(rep5)

# 11
print(list(rep5.keys()))
print(list(rep5.values()))