

def matrixToPointer(x):
    """
    :param x: The ndarray you want to take the address of.
    :type x: ndarray, [Int] 
    :rtype: UnsafeMutablePointer<Double>. Equivalent to ``double *``

    .. note:: If you want pointer to matrix, use ``matrixToPointer(x.flat)``

    .. note:: Callable through operator ``!x`` for both ndarray and matrix.
    """
def pointerToMatrix(xPC, N):
    """
    :param N: Int
    :param xPC: The pointer to the first element of the matrix
    :type xPC: UnsafeMutablePointer<Double>
    :type N: CInt
    :rtype: ndarray

    .. warning:: I recommend initalizing some array then passing ``!x`` to a C function. This seems dangerous.
    """
def pointerTo2DMatrix(xPC, N):
    """
    :param N: Int
    :param M: Int
    :param xPC: The pointer to the first element of the matrix
    :type xPC: UnsafeMutablePointer<Double>
    :type N: CInt
    :type M: CInt
    :rtype: matrix

    .. warning:: I recommend initalizing some array then passing ``!x`` to a C function. This seems dangerous.
    """
