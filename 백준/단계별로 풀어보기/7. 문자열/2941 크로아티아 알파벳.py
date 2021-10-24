A = input().lower()
alpha = ['c=', 'c-', 'dz=', 'd-', 'lj', 'nj', 's=', 'z=']

for x in alpha:
    A = A.replace(x, '*')

print(len(A))

# replace는 문자열에서 어떠한 값을 찾아 변경해 줌