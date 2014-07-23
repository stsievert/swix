from __future__ import division
from pylab import *
from sklearn import datasets
from sklearn import svm

data = datasets.load_digits()
N_test = int(1050)

x_train = data['data'][:-N_test]
y_train = data['target'][:-N_test]

x_test = data['data'][-N_test:]
y_test = data['target'][-N_test:]

np.savetxt("x_train.csv", x_train, delimiter=",")
np.savetxt("y_train.csv", y_train, delimiter=",", newline=",")
np.savetxt("x_test.csv", x_test, delimiter=",")
np.savetxt("y_test.csv", y_test, delimiter=",", newline=",")

ml = svm.LinearSVC()
ml = ml.fit(x_train, y_train)
yhat_test = ml.predict(x_test)

print argwhere(abs(yhat_test - y_test) < 0.5).shape[0] / y_test.shape[0]
