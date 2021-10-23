array = []

for i in range(10):
    n = int(input())
    array.append(n % 42)

array = set(array)  # 집합 자료형(중복 제거)
print(len(array))