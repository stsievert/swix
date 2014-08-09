# -*- coding: utf-8 -*-
import numpy as np
from math import sqrt

#: The path that should point to the swix directory. The file imshow.py, numbers.swix would be found by appending to this path.
S2_PREFIX = "\(NSHomeDirectory())/Developer/swix/swix/swix/swix/"

#: Where is Python found? Used for imshow and savefig (testing on MacOSX only!). Assumes `pylab <http://wiki.scipy.org/PyLab>`_ is installed.
PYTHON_PATH = "~/anaconda/bin/ipython"

#: The `golden ratio <https://en.wikipedia.org/wiki/The_golden_ratio>`_
#: Also callable with φ
phi = (1 + sqrt(5))/2

#: The classic `circle constant <https://en.wikipedia.org/wiki/Pi>`_. Also called π
pi = np.pi

#: The more intuitive circle constant. Also τ
tau = 2 * np.pi

#: `Euler's number <https://en.wikipedia.org/wiki/E_(mathematical_constant)>`_
e = np.e

#: `Euler's constant <https://en.wikipedia.org/wiki/Euler–Mascheroni_constant>`_
euler = 0.57721566490153286060651209008240243104215933593992

#: Infinity.
inf = np.inf

#: The smallest possible difference between two doubles. See `machine epsilon
#: <http://en.wikipedia.org/wiki/Machine_epsilon#Approximation_using_C>`_ for more
#: detail.
DOUBLE_EPSILON = "smaller"

#: The smallest possible difference between two floats. See `machine epsilon 
#: <http://en.wikipedia.org/wiki/Machine_epsilon#Approximation_using_C>`_ for more
#: detail.
FLOAT_EPSILON = "small"

def close(x, y):
    """
    :param x: Double. An input value.
    :param y: Double. Another value.

    :rtype: Bool. True only if the two values are close numerically.
    Specifically, true only if :math:`|x-y|<10^{-9}`.
    
    >>> assert(close(0, 1e-10) == true)
    """

def convience_elements():
    """
    The built in class numeric classes has convience elements.

    * {Float|Double|Int|CInt}.int. Returns the integer value
    * {Float|Double|Int|CInt}.float. The floating point value
    * {Float|Double|Int|CInt}.double. The double value.
    * String.floatValue, String.doubleValue. Converts the string to a numeric value by interpetting a NSString.
    * String.nsstring. For interfacing with C.

    Additionally, Int has an element cint, Double has element cdouble, Float
    has element cfloat.

    >>> assert(3.14.int == 3)
    >>> assert("3.14".floatValue == 3.14)
    """


def operator_slash(lhs, rhs):
    """
    The operator ``/`` that represents division. Converts integer division to floating point division.

    :param lhs: Int.
    :param rhs: Int.
    :rtype: Double = lhs / rhs
    """

def isNumber(x):
    """
    :param x: AnyObject.
    :rtype: Bool. True only if x is a number (a float, double, cint, int). Returns false for ndarray and matrix.
    """


