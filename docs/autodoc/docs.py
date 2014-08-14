
import ndarray
import matrix
import machine_learning
import inspect
import numbers

def print_functions(root_module, modules):
    strings = []
    for module in modules:
        methods = inspect.getmembers(module, predicate=inspect.ismethod)
        strings += ["\n"+str(module)+"\n"+"-------------------------------------\n"]
        strings += [".. autosummary::\n"]
        for method in methods:
            strings += ["    "+str(module)+"."+method[0]]
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


def write_list(file, name, list_of_string):
    file.write(name+"\n-----------------------\n")
    file.write(".. autosummary::\n")
    for f in list_of_string:
        file.write(f+"\n")
    file.write("\n")
file = open("../summary.rst", "w")
file.write("Summary\n==============\n")
write_list(file, "ndarray", n)
write_list(file, "matrix", m)
write_list(file, "machine learning", ml)
file.close()
