math_scores = [30, 60, 70, 20, 30]
english_scores = [30, 40, 50, 10, 50]
n_student = len(math_scores)

math_sum, english_sum = 0, 0
math_square_sum, english_square_sum = 0, 0

for student_idx in range(n_student):
    math_sum += math_scores[student_idx]
    math_square_sum += math_scores[student_idx]**2

    english_sum += english_scores[student_idx]
    english_square_sum += english_scores[student_idx]**2

math_mean = math_sum / n_student
english_mean = english_sum / n_student

math_variance = math_square_sum/n_student - math_mean**2
english_variance = english_square_sum/n_student - english_mean**2

math_std = math_variance**0.5
english_std = english_variance**0.5

print("mean/std of Math: ", math_mean, math_std)
print("mean/std of English: ", english_mean, english_std)

for student_idx in range(n_student):
    math_score = math_scores[student_idx]
    english_score = english_scores[student_idx]

    math_scores[student_idx] = (math_score - math_mean)/math_std
    english_scores[student_idx] = (english_score - english_mean)/english_std

print("Math scores after standardization: ", math_scores)
print("English scores after standardization: ", english_scores)

math_sum, english_sum = 0, 0
math_square_sum, english_square_sum = 0, 0

for student_idx in range(n_student):
    math_sum += math_scores[student_idx]
    math_square_sum += math_scores[student_idx]**2

    english_sum += english_scores[student_idx]
    english_square_sum += english_scores[student_idx]**2

math_mean = math_sum / n_student
english_mean = english_sum / n_student

math_variance = math_square_sum/n_student - math_mean**2
english_variacne = english_square_sum/n_student - english_mean**2

math_std = math_variance**0.5
english_std = english_variacne**0.5

print("mean/std of Math: ", math_mean, math_std)
print("mean/std of English: ", english_mean, english_std)