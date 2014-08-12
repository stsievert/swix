from numbers import S2_PREFIX
import ndarray 
# unused but in docs

class matrix:
    """
    This class depends on ``ndarray`` where possible since ``matrix`` is really
    a flat and `row-major`_ array. To implement a 2D matrix, I just return
    select indices when indexing.

    .. note:: Row major order differs from Matlab and it's column major order. While the `flat` indexing differs, NumPy, Matlab and swix all index the same with two indices. ie, ``x[1,3]`` will return similar values in all three.
    """
    n = "Int" #: Number of elements
    rows = "Int" #: Number of rows
    columns = "Int" #: Number of columns
    shape = "(rows, columns)" #: The shape of the matrix (in typical mathematical language)
    flat = "ndarray" #: The base ndarray stored in row-major order. Is of type :class:`ndarray.ndarray`; any function that takes an ndarray can take this element.
    T = "transpose" #: Returns the transpose of the matrix. Call :class:`helper_functions.transpose`
    I = "inverse" #: Returns the inverse of the matrix. Calls :class:`complex_math.inv`
    def copy():
        """
        :rtype: A copy of the array.

        >>> x = arange(4).reshape((2,2))
        >>> assert(x ~== x.copy())

        .. seealso:: :class:`ndarray.ndarray.copy`
        """
    def dot(y):
        """
        :param y: The lhs of the matrix.
        :type y: matrix
        :rtype: matrix. The dot product ``dot(self, y)``

        .. seealso:: `np.dot`_, :class:`complex_math.dot`, :class:`operators.dot`
        """
    def index(one, two):
        """
        :param one: The row selector.
        :param two: The column selector.
        :type one: Int, Range<Int>, ndarray
        :type two: Int, Range<Int>, ndarray
        :rtype: matrix

        .. note:: Use ``x[3, 4]`` to index, not the function name.

        >>> x = arange(9).reshape((3,3))
        # x = [0 1 2; 3 4 5; 6 7 8]
        >>> assert(x[0,1] == 1)
        >>> assert(x[0..<2, 0..<3] ~== array("0 1 2; 3 4 5")
        >>> assert(x[arange(2), arange(3)] ~== array("0 1 2; 3 4 5")

        .. seealso:: `np.indexing`_
        """
    def index_flat(idx):
        """
        :param idx: In row major order, the elements to take.
        :type idx: ndarray
        :rtype: ndarray. Indexes ``matrix.flat`` in row-major order.

        .. note:: Use ``x[array(1, 2, 3, x.shape.0+1)]`` to index, not the function name.
        
        >>> x = arange(9).rehshape((3,3))
        >>> assert(x[array(0, 3, 6)] ~== array(0, 3, 6))

        .. seealso:: `np.flat`_
        """
    def index_diag(string):
        """
        :param string: This asserts that this input string must be "diag".
        :type string: String
        :rtype: ndarray

        Gets or sets the diagonal of a matrix.

        >>> x = arange(9).reshape((3,3))
        >>> x["diag"] = array(-1, -2, -3)
        >>> assert(x["diag"] = array(-1, -2, -3))
        >>> println(x)
        # prints [-1 1 2; 3 -2 5; 6 7 -3]
        """

class initing:
    def array(matlab_like_string):
        """
        :param matlike_like_string:
        :type matlab_like_string: String
        :rtype: matrix

        Interpets the string as a matrix, matlab style. ``;`` is interpets as a new row.

        .. warning:: This currently only works with one digit positive numbers. Negative numbers and multiple digit numbers throw it for a loop. I would recommend using ``array(Double...).reshape((M,N))`` instead.

        >>> assert(array("1 2; 3 4") ~== array(1, 2, 3, 4).reshape((2,2))

        .. seealso:: `np.matrix`_
        """
    def eye(N):
        """
        :param N: The size of the array will be N x N
        :type N: Int
        :rtype: matrix. An identity matrix.

        .. seealso:: `np.eye`_
        """
    def meshgrid(x, y):
        """
        :param x: One set of elements.
        :type x: ndarray
        :param y: Another set of elements.
        :type y: ndarray
        :rtype: (matrix, matrix).

        This function evaulates every possible combination of x and y. Very similar to NumPy's meshgrid.

        >>> x, y = meshgrid(array(1, 2), array(3, 4))
        >>> println(x)
        # prints [1 2; 1 2]
        >>> println(y)
        # prints [3 3; 4 4]

        .. seealso:: `np.meshgrid`_
        """
    def ones(shape):
        """
        :param shape: The shape of the new matrix. (rows, columns)
        :type shape: (Int, Int)
        :rtype: matrix

        >>> assert(ones((2,2)) ~== ones(4).reshape((2,2)))

        .. seealso:: :class:`ndarray.initing.ones`
        """
    def read_csv(filename, prefix=S2_PREFIX):
        """
        :param filename: The file to read from. Reads from the same folder as the folder *above* the prefix.
        :param prefix: Defaults to S2_PREFIX.
        :rtype: matrix. The contents of the CSV.
        """
    def reshape(x, shape):
        """
        :param x: An ndarray
        :type x: ndarray
        :param shape: The size of the new matrix
        :type shape: (Int, Int)
        :rtype: A resized matrix.

        .. seealso:: :class:`ndarray.ndarray.reshape`, `np.reshape`_
        """
    def zeros(shape):
        """
        :param shape: The shape of the new matrix. (rows, columns)
        :type shape: (Int, Int)
        :rtype: matrix

        >>> assert(zeros((2,2)) ~== zeros(4).reshape((2,2)))

        .. seealso:: :class:`ndarray.initing.zeros`
        """
    def zeros_like(x):
        """
        :param x: The matrix to imitate.
        :type x: matrix
        :rtype: matrix

        >>> x = array(1, 2, 3, 4).reshape((2,2))
        >>> assert(zeros_like(x) ~== zeros((2,2)))

        .. seealso:: `np.zeros_like`_
        """

class helper_functions:
    def argwhere(idx):
        """
        :param idx: A matrix of zeros and ones. Normally indicates where some condition is true.
        :type idx: matrix
        :rtype: ndarray. Returns the indicies where ``idx`` is not zero. Useful with comparison operators which return an array of 0's and 1's.

        .. seealso:: `np.argwhere`_, :class:`operators.element_operators`
        """
    def fliplr(x):
        """
        :param x: The array to flip.
        :type x: matrix
        :rtype: The flipped matrix.

        Implemented through `cv.flip`_

        .. seealso:: :class:`helper_functions.flipud`, `np.fliplr`_

        >>> x = array("1 2; 3 4")
        >>> assert(fliplr(x) ~== array("2 1; 4 3"))
        """
    def flipud(x):
        """
        :param x: The array to flip.
        :type x: matrix
        :rtype: The flipped matrix.

        Implemented through `cv.flip`_

        .. seealso:: :class:`helper_functions.fliplr`, `np.flipud`_

        >>> x = array("1 2; 3 4")
        >>> assert(fliplr(x) ~== array("3 4; 1 2"))
        """
    def println(x, prefix="matrix([", postfix="])", newline="\n", format="%.3f", printWholeMatrix=False):
        """
        :param x: The matrix to print.
        :type x: matrix
        :param prefix: The prefix.
        :type prefix: String
        :param postfix: The postfix.
        :type postfix: String
        :param newline: The newline character.
        :type newline: String
        :param format: The format, C style.
        :type format: String
        :param printWholeMatrix: If true, prints every element.
        :type format: Bool
        """
    def transpose(x):
        """
        :param x: A source matrix.
        :type x: matrix
        :rtype: The transpose of the matrix.

        .. seealso:: `np.transpose`_, :class:`matrix.T`, `Transpose`_
        """
    def write_csv(x, filename, prefix=S2_PREFIX):
        """
        :param x: A matrix.
        :type x: matrix
        :param filename: The file to write to. Writes to a file named filename in the directory *above* the prefix.
        :param prefix: Defaults to S2_PREFIX.
        """

class operators:
    def element_operators(lhs, rhs):
        """
        :param lhs: The left hand side
        :type lhs: Double, matrix
        :param rhs: The right hand side
        :type rhs: Double, matrix

        The operators ``+ - * / % += -= *= /= < > <= >= == !==`` all work element wise and act similar to scalars.

        .. note:: Callable through the natural operators (+, -, etc).

        .. note:: ``==`` and ``!==`` see when two arrays are *exactly* equal for the incredibly percise doubles. I recommend using ``abs(x-y)<1e-9``.

        .. seealso:: `np.operators`_
        """
    def dot(x, y):
        """
        :param x: The lhs.
        :type x: matrix
        :param y: The rhs
        :type y: matrix
        :rtype: matrix.

        Performs a matrix multiplication between two matrices.

        .. note:: Also callable through ``*!`` and ``x.dot(y)``

        .. seealso:: `np.dot`_, :class:`matrix.dot`, :class:`complex_math.dot`, `Matrix multiplication`_
        """
    def solve(A, b):
        """
        :param A: When multplied with x, this is what the equation equals.
        :param b: What the equation equals.
        :type A: matrix
        :type b: ndarray
        :rtype: ndarray

        Solves for x in :math:`Ax=b`. The same as right-multiplying by the inverse but much faster.

        .. note:: Only works for N x N matrices. Doesn't have a least squares solution yet.

        .. note:: Also callable through ``!/``

        .. seealso:: :class:`complex_math.solve`, `System of linear equations`_
        """
    def equality(x, y):
        """
        :param x:
        :param y:
        :type x: matrix
        :type y: matrix
        :rtype: Bool. true only if the two arrays are approximately equal.

        .. note:: Callable through ``~==``

        >>> assert(array(0, 1) ~== arange(2))

        .. seealso:: :class:`numbers.close`
        """

class simple_math:
    """
    Often, a function is applied to every element. Uses :class:`ndarray.simple_math`. This applies a function to every element and simply calls ``function(x.flat)``.
    """
    def sin(x):
        """
        :param x:
        :type x: matrix
        :rtype: Applies the function to every element.
        """
    def cos(x):
        """
        :param x:
        :type x: matrix
        :rtype: Applies the function to every element.
        """
    def tan(x):
        """
        :param x:
        :type x: matrix
        :rtype: Applies the function to every element.
        """
    def log(x):
        """
        :param x:
        :type x: matrix
        :rtype: Applies the function to every element.
        """
    def abs(x):
        """
        :param x:
        :type x: matrix
        :rtype: Applies the function to every element.
        """
    def sqrt(x):
        """
        :param x:
        :type x: matrix
        :rtype: Applies the function to every element.
        """
    def floor(x):
        """
        :param x:
        :type x: matrix
        :rtype: Applies the function to every element.
        """
    def ceil(x):
        """
        :param x:
        :type x: matrix
        :rtype: Applies the function to every element.
        """
    def round(x):
        """
        :param x:
        :type x: matrix
        :rtype: Applies the function to every element.
        """
    def sign(x):
        """
        :param x:
        :type x: matrix
        :rtype: Applies the function to every element.
        """
    def randn(x):
        """
        :param x:
        :type x: matrix
        :rtype: Applies the function to every element.
        """
    def rand(x):
        """
        :param x:
        :type x: matrix
        :rtype: Applies the function to every element.
        """
    def pow(x, power):
        """
        :param x:
        :type x: matrix
        :param power:
        :type power: Double
        :rtype: Applies the function to every element.
        """
    def sum(x, axis=-1):
        """
        :param x:
        :type x: matrix
        :param dim: Assumed to be either 0 or 1. Takes all the values in dim and sums them. A value is in a certain dimension if changing that indexing argument selects a different value.
        :type dim: Int
        :rtype: ndarray

        >>> var x = arange(6).reshape((2,3))
        >>> assert(sum(x, dim:0) ~== array(3, 12))
        >>> assert(sum(x, dim:1) ~== array(3, 5, 7))
        """
    def avg(x, axis=-1):
        """
        :param x:
        :type x: matrix
        :type dim: Int
        :param dim: The dimension to which compute the average over.
        :rtype: Returns the avg along each dimension
        """

class images:
    def rgb2hsv(r, g, b):
        """
        :param r: The red color plane.
        :param g: The green color plane.
        :param b: The blue color plane.
        :type r: matrix
        :type g: matrix
        :type b: matrix
        :rtype: (matrix, matrix, matrix). Returns the HSV color planes.

        .. note:: This function isn't optimized. If you want to go fast, look at only including the V plane and using max.
        """
    def savefig(x, filename, save=True, show=False):
        """
        :param x: The matrix you want to see. 
        :type x: matrix
        :param filename: The filename you want to save at. 
        :type filename: String

        Saves the matrix. Relies on Python being found at PYTHON_PATH and pylab stack being installed

        .. seealso:: `mpl.savefig`_
        """
    def imshow(x):
        """
        :param x: The matrix you want to see. 
        :type x: matrix

        Shows the matrix. Relies on Python being found at PYTHON_PATH and pylab stack being installed

        .. seealso:: `mpl.imshow`_
        """

class complex_math:
    def dot(x, y):
        """
        :param x: The lhs.
        :type x: matrix
        :param y: The rhs
        :type y: matrix
        :rtype: matrix.

        Performs a matrix multiplication between two matrices.

        .. note:: Also callable through ``*!``, ``dot(x, y)`` and ``x.dot(y)``

        .. seealso:: `np.dot`_, :class:`matrix.dot`, :class:`operators.dot`, `Matrix multiplication`_
        """
    def eig(x):
        """
        :param x: The matrix to find the eigenvalues of.
        :type x: matrix
        :rtype: the eigenvalues the matrix.

        .. note:: This function does not find any eigenvectors (and should but bugs).

        .. seealso:: `np.linalg.eig`_, `Eigenvalues`_
        """
    def inv(x):
        """
        :param x: Finds the inverse of this matrix.
        :type x: matrix
        :rtype: :math:`x^{-1}`
        
        Finds the inverse of the matrix; can be expensive time-wise!

        .. seealso::
            :class:`matrix.I`, `np.linalg.inv`_, `Matrix inverse`_
        """
    def solve(A, b):
        """
        :param A: When multplied with x, this is what the equation equals.
        :param b: What the equation equals.
        :type A: matrix
        :type b: ndarray
        :rtype: ndarray

        Solves for x in :math:`Ax=b`. The same as right-multiplying by the inverse but much faster.

        .. note:: Only works for N x N matrices. Doesn't have a least squares solution yet.

        .. note:: Also callable through ``!/``

        .. seealso:: `np.linalg.solve`_, `System of linear equations`_
        """
    def svd(x):
        """
        :param x: The input to the singular value decomposition.
        :type x: matrix
        :rtype: (matrix, ndarray, matrix)

        Finds a factorization such that :math:`x = U S V`.

        .. seealso:: `np.linalg.svd`_, `Singular value decomposition`_
        """

