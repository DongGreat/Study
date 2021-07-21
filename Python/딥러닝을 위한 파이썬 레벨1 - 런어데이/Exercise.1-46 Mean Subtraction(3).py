scores = [10, 20, 30, 40, 50, 60]

# method.1
score_sum = 0
for score in scores:
    score_sum += score

score_mean = score_sum / len(scores)
print("score mean before mean subtraction: ", score_mean)

scores_ms = list()
for score in scores:
    scores_ms.append(score - score_mean)
print(scores_ms)

score_sum = 0
for score in scores_ms:
    score_sum += score

score_mean = score_sum / len(scores)
print("score mean after mean subtraction: ", score_mean)

# method.2
score_sum = 0
for score in scores:
    score_sum += score

score_mean = score_sum / len(scores)
print("score mean before mean subtraction: ", score_mean)

for score_idx in range(len(scores)):
    scores[score_idx] -= score_mean
print(scores)

score_sum = 0
for score in scores:
    score_sum += score

score_mean = score_sum / len(scores)
print("score mean after mean subtraction: ", score_mean)