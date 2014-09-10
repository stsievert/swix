from __future__ import division
from pylab import *
from timeit import timeit



def pe1():
    N = 1e6
    x = arange(N)
    i = argwhere((abs(x%3) < 1e-9) * (abs(x%5) < 1e-9))
def pe10():
    N = 2e6
    primes = arange(N)
    for i in arange(2, sqrt(N)):
        j = arange(2, N/i) * i
        j = asarray(j, dtype=int)
        primes[j] *= 0.0
def pe73():
    N = 1e3
    d = arange(N)+1
    n = arange(N)+1
    n, d = meshgrid(n, d)

    # setting the upper triangular to 0
    #il1 = triu_indices(n.shape[0])
    #n[il1] = 0

    f = n / d
    f = unique(f)

    i = (f > 1/3) & (f < 1/2)
def soft_threshold():
    N = 1e2
    j = linspace(-1, 1, num=N)
    (x, y) = meshgrid(j, j)
    z = pow(x, 2) + pow(y, 2)
    i = abs(z) < 0.5
    z[argwhere(i)] *= 0
    z[argwhere(~i)] -= 0.5
def pi_approx():
    N = 1e6
    k = arange(N, dtype=int)
    pi_approx = 1 / (2*k + 1)
    pi_approx[2*k[:N/2]+1] *= -1

print "pe1_time       : ", timeit(pe1 ,number=10)
print "pe10_time      : ", timeit(pe10 ,number=3)
print "pe73_time      : ", timeit(pe73 ,number=1)
print "st_time        : ", timeit(soft_threshold ,number=3)
print "pi_approx time : ", timeit(pi_approx ,number=10)

