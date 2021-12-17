def find_numebr(data, val):
    no = sorted(data).index(val) + 1
    
    return no

data = {10, 5, 6, 4}
print("숫자의 번호 = %d"%find_numebr(data, 6))