
from __future__ import division
from pylab import *
from time import time

start = time()
N = 1000
x1 = linspace(0, 1, num=N)
y1 = linspace(0, 1, num=N)
x, y = meshgrid(x1, y1)
z = x**2 + y**2
end = time()
"""
results:
    numpy             : 35.14ms
    swift -Onone      : 1.8s
    swift -O          : 99ms
    swift -Ofastest   : 93ms
    swift_min / numpy : 2.62
"""

print (end - start) * 1000, "ms"

