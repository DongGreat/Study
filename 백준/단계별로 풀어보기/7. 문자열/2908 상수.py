A, B = map(int, input().split())

A = ((A%10)*100) + ((A//10%10)*10) + (A//100)
B = ((B%10)*100) + ((B//10%10)*10) + (B//100)

# A, B = map(str, input().split())

# A = A[::-1]
# B = B[::-1]

print(max(A, B))