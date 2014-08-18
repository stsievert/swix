
from __future__ import division
from pylab import *

M = 3
N = 4
x = arange(M*N).reshape(M,N)

y = pinv(x)
