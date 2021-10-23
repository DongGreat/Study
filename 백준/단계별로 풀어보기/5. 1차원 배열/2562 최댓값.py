array = []
a_max = 0
index = 0

for i in range(9):
    array.append(int(input()))
    if array[i] > a_max:
        a_max = array[i]
        index = i+1

print(a_max) # max(array)
print(index) # array.index(max(array))+1