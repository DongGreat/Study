numbers = [1, 2, 3, 4, 5, 6, 7]

for number in numbers:
    if number % 2 == 0:
        print('짝')
    else:
        print('홀')

print(['짝' if number % 2 == 0 else '홀' for number in numbers])