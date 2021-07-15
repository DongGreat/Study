import random

std = ['가', '나', '다', '라', '마', '바']
print(random.choice(std))

print(random.sample(std, 2))

print(random.sample(range(1, 46), 6))

print(random.randint(8,10))