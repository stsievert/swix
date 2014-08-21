
import ndarray
import matrix
import machine_learning
import inspect
import numbers
import objc

def print_functions(root_module, modules):
    strings = []
    for module in modules:
        f = inspect.ismethod
        methods = inspect.getmembers(module, predicate=f)
        strings += ["\n"+str(module)+"\n"+"^"*25]
        strings += [".. autosummary::\n"]
        for method in methods:
            strings += ["    "+str(module)+"."+method[0]]
    return strings

def print_root_functions(root_module, module_name):
    strings = []
    fs = inspect.getmembers(root_module, predicate=inspect.isfunction)
    strings += ["\n"]
    strings += [".. autosummary::"]
    for f in fs:
        strings += ["    "+module_name+"."+f[0]]
    return strings

ndarray_modules = [ndarray.initing,          \
                   ndarray.helper_functions, \
                   ndarray.ndarray,          \
                   ndarray.complex_math,     \
                   ndarray.simple_math, \
                   ndarray.operators]
matrix_modules = [matrix.initing,          \
                  matrix.helper_functions, \
                  matrix.matrix,          \
                  matrix.complex_math,     \
                  matrix.images, \
                  matrix.simple_math, \
                  matrix.operators]
ml_modules = [machine_learning.SVM, machine_learning.kNN]

n = print_functions(ndarray, ndarray_modules)
m = print_functions(matrix, matrix_modules)
ml = print_functions(machine_learning, ml_modules)
nu = print_root_functions(numbers, "numbers")
objcs = print_root_functions(objc, "objc")


def write_list(file, name, list_of_string):
    file.write("\n")
    file.write(name+"\n"+"-"*25+"\n")
    file.write(".. autosummary::\n")
    for f in list_of_string:
        file.write(f+"\n")

intro = ""
intro += \
"""
Overview
===============
This library aims to be an almost exact clone of `Pylab`_ and to integrate the core parts of NumPy/SciPy/some of Matplotlib to provide a Matlab-like interface. The reason this library was developed to provide an easy translatation between complicated signal processing algorithms and mobile apps.

Since this library only aims to provide easy conversion and not easy developement, there are areas that are a bit of a pain. For example, you can't assign ``x[0..<N] = 0``; instead you have to use ``x[0..<N] = zeros(N)`` or think of clever hacks like ``x[0..<N] *= 0``.

This library almost exactly tries to copy the NumPy syntax. While the mathematical functions do this, one notable exception is Python's ``for i in arange(N)``. To get the same result in swix, use ``for i in arange(N).grid``.

If in doubt or getting weird compiler errors, look at the corresponding NumPy docs (I tried to include links) or look at the section on :doc:`bugs` you may find.

Functions
---------

This page only includes functions. All constants are defined in :class:`numbers`.

.. include:: links.rst

"""

file = open("../overview.rst", "w")
file.write(intro)
write_list(file, "numbers", nu)
write_list(file, "ndarray", n)
write_list(file, "matrix", m)
write_list(file, "machine learning", ml)
write_list(file, "objc", objcs)
file.close()
