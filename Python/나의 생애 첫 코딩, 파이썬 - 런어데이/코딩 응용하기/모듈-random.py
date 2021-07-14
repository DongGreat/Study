# 모듈
# * 여러 기능들을 묶어서 만든 파이썬 파일
# * '라이브러리'와 혼용해서 사용

import random

print(random.randint(1, 6))

a = ["가위", "바위", "보"]
print(random.choice(a))

import random as r

a = r.randint(1, 6)
print(a)

b = ["가위", "바위", "보"]
print(r.choice(b))

from random import randint, choice

a = randint(1, 6)
print(a)

b = ["가위", "바위", "보"]
print(choice(b))

from random import *

a = randint(1, 6)
print(a)

b = ["가위", "바위", "보"]
print(choice(b))