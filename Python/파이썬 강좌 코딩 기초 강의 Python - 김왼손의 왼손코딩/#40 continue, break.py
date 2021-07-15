count = 0

while count < 10:
    count += 1
    if count < 4:
        continue
    print('횟수:', count)
    if count == 8:
        break