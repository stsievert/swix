
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
        strings += ["\n"+str(module)+"\n"+"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"]
        strings += [".. autosummary::\n"]
        for method in methods:
            strings += ["    "+str(module)+"."+method[0]]
    return strings

def print_root_functions(root_module, module_name):
    strings = []
    fs = inspect.getmembers(root_module, predicate=inspect.isfunction)
    strings += ["\n"+module_name+"\n"+"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"]
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
    file.write(name+"\n-----------------------\n")
    file.write(".. autosummary::\n")
    for f in list_of_string:
        file.write(f+"\n")
    file.write("\n")

intro = "\nThis file only includes functions. All constants are defined in :class:`numbers`.\n\n"

file = open("../overview.rst", "w")
file.write("Overview\n==============\n")
file.write(intro)
write_list(file, "numbers", nu)
write_list(file, "ndarray", n)
write_list(file, "matrix", m)
write_list(file, "machine learning", ml)
write_list(file, "objc", objcs)
file.close()
