# -*- coding: utf-8 -*-

#import numpy as np
import math
from math import sqrt

#: The path that should point to the swix directory. The file imshow.py, numbers.swix would be found by appending to this path.
S2_PREFIX = "\(NSHomeDirectory())/Developer/swix/swix/swix/swix/"

#: The determines how close two numbers have to be equal.
S2_TOLEANCE = 1e-9

#: Where is Python found? Used for imshow and savefig (testing on MacOSX only!). Assumes `pylab <http://wiki.scipy.org/PyLab>`_ is installed.
PYTHON_PATH = "~/anaconda/bin/ipython"

#: The `golden ratio <https://en.wikipedia.org/wiki/The_golden_ratio>`_
#: Also callable with φ
phi = (1 + sqrt(5))/2

#: The classic `circle constant <https://en.wikipedia.org/wiki/Pi>`_, pi and :math:`\pi`.
pi = math.pi

#: The much more `intuitive circle constant <http://www.tauday.com/tau-manifesto>`_, tau and :math:`\tau`.
tau = 2 * pi

#: `Euler's number <https://en.wikipedia.org/wiki/E_(mathematical_constant)>`_
e = math.e

#: `Euler's constant <https://en.wikipedia.org/wiki/Euler–Mascheroni_constant>`_
euler = 0.57721566490153286060651209008240243104215933593992

#: Infinity.
inf = float("inf")

#: The smallest possible difference between two doubles. See `machine epsilon
#: <http://en.wikipedia.org/wiki/Machine_epsilon#Approximation_using_C>`_ for more
#: detail.
DOUBLE_EPSILON = "smaller"

#: The smallest possible difference between two floats. See `machine epsilon
#: <http://en.wikipedia.org/wiki/Machine_epsilon#Approximation_using_C>`_ for more
#: detail.
FLOAT_EPSILON = "small"

def binom(n, k):
    """
    Calculate the binomial coeffecint or n choose k.

    :param n: n as in on the wiki page.
    :param k: k as in on the wiki page.
    :type n: Double
    :type k: Double
    :rtype: The `Binomial coeff`_
    """
def factorial(n):
    """
    Computes :math:`n \cdot (n-1) \ldots 2 \cdot 1 = n!`

    :param n: The number to compute the factorial of.
    :type n: Int
    :rtype: The factorial of n.
    """
def close(x, y):
    """
    See if two numbers are approximately equal.

    :param x: Double. An input value.
    :param y: Double. Another value.

    :rtype: Bool. True only if the two values are close numerically.
    Specifically, true only if :math:`|x-y|<\\textrm{tol}`.

    >>> assert(close(0, 1e-10) == true)
    """

def convience_elements():
    """
    The built in numeric classes have convience elements.

    * {Float|Double|Int|CInt}.int. Returns the integer value
    * {Float|Double|Int|CInt}.float. The floating point value
    * {Float|Double|Int|CInt}.double. The double value.
    * String.floatValue, String.doubleValue. Converts the string to a numeric value by interpetting a NSString.
    * String.nsstring. For interfacing with C.

    Additionally,

    * Int has an element cint, length, stride. Length and stride of for interacting with vDSP.
    * Double has element cdouble,
    * Float has element cfloat.

    >>> assert(3.14.int == 3)
    >>> assert("3.14".floatValue == 3.14)
    >>> assert(vDSP_Stride(1) == 1.stride)
    >>> assert(vDSP_Length(N) == N.length)
    """

def deg2rad(x):
    """
    Convert from degrees to radians.

    :param x: Angle in degrees.
    :type x: Double
    :rtype: Double. Angle in radians.
    """
def rad2deg(x):
    """
    Convert from radians to degrees.

    :param x: Angle in radians.
    :type x: Double
    :rtype: Double. Angle in degrees.
    """

def operator_slash(lhs, rhs):
    """
    Operator ``/`` converts integer divison to double division.

    :param lhs: Int.
    :param rhs: Int.
    :rtype: Double = lhs / rhs
    """

def isNumber(x):
    """
    See if the input object is a number.

    :param x: AnyObject.
    :rtype: Bool. True only if x is a number (a float, double, cint, int). Returns false for ndarray and matrix.
    """


