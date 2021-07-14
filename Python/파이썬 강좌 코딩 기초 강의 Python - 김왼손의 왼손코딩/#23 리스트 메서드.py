animals = ['코알라', '하이에나', '바다소', '땅다람쥐', '스컹크', '아나콘다', '바다코끼리']

animals.sort()
print(animals)

animals.append('바다소')
print(animals.count('바다소'))
print(animals.count('코알라'))

del animals[1]

print(len(animals))