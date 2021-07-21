predictions = [10, 20, 30]
labels = [10, 25, 40]
n_data = len(predictions)

mse = 0
mse += (predictions[0] - labels[0])**2
mse += (predictions[1] - labels[1])**2
mse += (predictions[2] - labels[2])**2
mse /= n_data
print(mse)

s_errors = list()
s_errors.append((labels[0] - predictions[0])**2)
s_errors.append((labels[1] - predictions[1])**2)
s_errors.append((labels[2] - predictions[2])**2)

mse = (s_errors[0] + s_errors[1] + s_errors[2])/n_data
print(mse)