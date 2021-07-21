v1 = [1, 2, 3]

norm = (v1[0]**2 + v1[1]**2 + v1[2]**2)**0.5
print(norm)

v1 = [v1[0]/norm, v1[1]/norm, v1[2]/norm]
norm = (v1[0]**2 + v1[1]**2 + v1[2]**2)**0.5
print(norm)