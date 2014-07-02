
from __future__ import division
from pylab import *
from sklearn import svm


N = 16
M = 4
x = ones((M,N))
x[1] = -1

t = ones(M)
t[1] = -1

svm = svm.SVC()
svm.fit(x, t)
print svm.predict(-1 * ones(N))
