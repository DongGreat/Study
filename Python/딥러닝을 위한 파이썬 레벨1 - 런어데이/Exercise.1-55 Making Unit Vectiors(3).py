v1 = [1, 2, 3]

square_sum = 0
for dim_val in v1:
    square_sum += dim_val**2
norm = square_sum**0.5
print("norm of v1 before unit vector: ", norm)

for dim_idx in range(len(v1)):
    v1[dim_idx] /= norm

square_sum = 0
for dim_val in v1:
    square_sum += dim_val**2
norm = square_sum**0.5
print("norm of v1 after unit vector: ", norm)