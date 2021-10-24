A = list(input().upper())
count = 0

for x in A:
    count += 2
    if ord('A') <= ord(x) <= ord('C'):
        count += 1
    elif ord('D') <= ord(x) <= ord('F'):
        count += 2
    elif ord('G') <= ord(x) <= ord('I'):
        count += 3
    elif ord('J') <= ord(x) <= ord('L'):
        count += 4
    elif ord('M') <= ord(x) <= ord('O'):
        count += 5
    elif ord('P') <= ord(x) <= ord('S'):
        count += 6
    elif ord('T') <= ord(x) <= ord('V'):
        count += 7
    elif ord('W') <= ord(x) <= ord('Z'):
        count += 8
    else:
        count += 9
    
print(count)