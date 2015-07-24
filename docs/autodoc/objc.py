

def matrixToPointer(x):
    """
    :param x: The ndarray you want to take the address of.
    :type x: ndarray, [Int]
    :rtype: UnsafeMutablePointer<Double>. Equivalent to ``double *``

    .. note:: Callable through operator ``!x`` for both ndarray and matrix.
    """
