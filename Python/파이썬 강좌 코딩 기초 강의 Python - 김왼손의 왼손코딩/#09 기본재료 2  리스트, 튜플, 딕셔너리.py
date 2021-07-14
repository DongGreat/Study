list = []
my_list = [1, 2, 3]
students = ["가", "나", "다"]

for std in students:
    print(std)

import random

print(random.choice(students))
students.append("라")

students[0] = '마'
print(students)

my_tuple = ('가', '나', '다')
# my_tuple[0] = '라' - 값을 바꿀 수 없음
print(my_tuple)

my_dict = {'가' : '1', '나' : '2', '다' : '3'}
print(my_dict['나'])
my_dict['나'] = 4
print(my_dict)