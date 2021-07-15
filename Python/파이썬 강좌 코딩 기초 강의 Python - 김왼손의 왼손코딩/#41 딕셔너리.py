my_dict = {}

print(type(my_dict))

my_dict[0] = 'a'
my_dict['b'] = 2
my_dict['학생1'] = '김동현{}'.format(my_dict['b'])

print(my_dict)
print(my_dict['학생1'])

del my_dict[0]
del my_dict['b']

print(my_dict)