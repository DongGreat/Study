def find_max(A):
	max = A[0]
	for i in range(len(A)):
		if A[i] > max:
			max = A[i]
	return max

array = [1, 5, 2, 3, 4]
print(array, "최댓값 = ", find_max(array))

print(gcd(60, 30))