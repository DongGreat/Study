def binary_digits(n) :			# 입력 양의 정수 n
    if n == 1 :			        # n이 1이면 길이는 1
    	  return 1
    else :				        # n이 1보다 크면
    	  return 1 + binary_digits(n//2)	# 1 + n//2의 길이

print("총 비트수 (123) = ", binary_digits(123))
