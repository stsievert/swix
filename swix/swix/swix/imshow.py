from __future__ import division
from pylab import *
from pandas import read_csv
import sys

"""
Usage: python imshow.py filename.png
"""

filename = sys.argv[1]
x = read_csv("temp.csv", header=None)
x = asarray(x)

figure()
imshow(x, interpolation='nearest')
tight_layout()
colorbar()
savefig('../'+filename, dpi=300)
