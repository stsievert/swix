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
        Copies the matrix.

        :rtype: A copy of the array.

        >>> x = arange(4).reshape((2,2))
        >>> assert(x ~== x.copy())

        .. seealso:: :class:`ndarray.ndarray.copy`
        """
    def dot(y):
        """
        Matrix multiplication with another matrix.

        :param y: The lhs of the matrix.
        :type y: matrix
        :rtype: matrix. The dot product ``dot(self, y)``

        .. seealso:: `np.dot`_, :class:`complex_math.dot`, :class:`operators.dot`
        """
    def index(one, two):
        """
        Indexes with two numbers; range<int>, ndarray or int. Includes negative
        indexing like Python

        Use ``x[1, "all"]`` to access an entire row or column.
        
        Also possible to use boolean indexing. ``x[x < 0] <- 0`` is the primary
        use case for this.

        .. warning:: Assumes wholly negative or positive. Indexes like ``array(-1, 0, 1)`` aren't supported.

        :param one: The row selector.
        :param two: The column selector.
        :type one: Int, Range<Int>, ndarray, String
        :type two: Int, Range<Int>, ndarray, String
        :rtype: matrix

        .. note:: Use ``x[3, 4]`` to index, not the function name.

        >>> x = arange(9).reshape((3,3))
        # x = [0 1 2; 3 4 5; 6 7 8]
        >>> assert(x[0,1] == 1)
        >>> assert(x[0..<2, 0..<3] ~== array("0 1 2; 3 4 5")
        >>> assert(x[arange(2), arange(3)] ~== array("0 1 2; 3 4 5")
        >>> assert(x[0, "all"] ~== array(0, 1, 2))
        >>> x[x < 4] <- 0
        >>> assert(x[x < 4] ~== zeros(4))

        .. seealso:: `np.indexing`_

        """
    def index_flat(idx):
        """
        Indexes in the row-major flat array.

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
        Gets or sets the diagonal.

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
    def tril(x):
        """
        Return the indices to the lower part of the array.

        :param x: The matrix you wish to get the lower part of.
        :type x: matrix

        >>> x = arange(9).reshape((3,3))
        >>> assert(x[triu(x)] ~== array(3, 6, 7))

        .. seealso:: `np.tril`_
        """
    def triu(x):
        """
        Return the indices to the upper part of the array.

        :param x: The matrix you wish to get the lower part of.
        :type x: matrix

        >>> x = arange(9).reshape((3,3))
        >>> assert(x[triu(x)] ~== array(1, 2, 5))

        .. seealso:: `np.triu`_
        """

class initing:
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
    def array(matlab_like_string):
        """
        An array from a matlab like string.

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
        Makes the identity matrix.

        :param N: The size of the array will be N x N
        :type N: Int
        :rtype: matrix. An identity matrix.

        .. seealso:: `np.eye`_
        """
    def meshgrid(x, y):
        """
        Makes a mesh out of two ndarrays.

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
        Makes a matrix full of ones.

        :param shape: The shape of the new matrix. (rows, columns)
        :type shape: (Int, Int)
        :rtype: matrix

        >>> assert(ones((2,2)) ~== ones(4).reshape((2,2)))

        .. seealso:: :class:`ndarray.initing.ones`
        """
    def read_csv(filename, prefix=S2_PREFIX):
        """
        Reads a csv.

        :param filename: The file to read from. Reads from the same folder as the folder *above* the prefix.
        :param prefix: Defaults to S2_PREFIX.
        :rtype: matrix. The contents of the CSV.
        """
    def reshape(x, shape):
        """
        Reshapes to the specified size.

        :param x: An ndarray
        :type x: ndarray
        :param shape: The size of the new matrix
        :type shape: (Int, Int)
        :rtype: A resized matrix.

        .. seealso:: :class:`ndarray.ndarray.reshape`, `np.reshape`_
        """
    def zeros(shape):
        """
        Makes a matrix full of zeros.

        :param shape: The shape of the new matrix. (rows, columns)
        :type shape: (Int, Int)
        :rtype: matrix

        >>> assert(zeros((2,2)) ~== zeros(4).reshape((2,2)))

        .. seealso:: :class:`ndarray.initing.zeros`
        """
    def zeros_like(x):
        """
        A matrix like the other matrix.

        :param x: The matrix to imitate.
        :type x: matrix
        :rtype: matrix

        >>> x = array(1, 2, 3, 4).reshape((2,2))
        >>> assert(zeros_like(x) ~== zeros((2,2)))

        .. seealso:: `np.zeros_like`_
        """

class helper_functions:
    def det(x):
        """
        Estimate the determinant of a matrix.

        :param x: The matrix to compute the determinant of.
        :type x: matrix
        :rtype: Double

        .. seealso:: `cv.determinant`_, `np.linalg.det`_
        """
    def rot90(x, k=1):
        """
        Rotate the given matrix 90 degrees counter-clockwise. Do it k times.

        .. warning:: k is assumed to be 1, 2 or 3

        :param x: The matrix to rotate.
        :type x: matrix
        :rtype: matrix

        .. seealso:: `np.rot90`_
        """
    def norm(x, ord=2):
        """
        Find the `Matrix norm`_ of a matrix.

        :param x: Finds the norm of this matrix.
        :type x: matrix
        :param ord: Assumed to be one of "fro", -2, -1, 1 or 2
        :type ord: Int or string.
        :rtype: Double. The specific norm.

        .. note:: Almost an exact copy of `np.linalg.norm`_.

        .. seealso:: `np.linalg.norm`_, `Matrix norm`_
        """
    def kron(a, b):
        """
        Find the `Kronecker product`_ between two matrices. 

        :param a: The first term for kron.
        :type a: matrix
        :param b: The second term in kron.
        :type b: matrix

        .. seealso:: `Kronecker product`_, `np.kron`_
        """
    def argwhere(idx):
        """
        Sees where a condition applies.

        :param idx: A matrix of zeros and ones. Normally indicates where some condition is true.
        :type idx: matrix
        :rtype: ndarray. Returns the indicies where ``idx`` is not zero. Useful with comparison operators which return an array of 0's and 1's.

        .. seealso:: `np.argwhere`_, :class:`operators.element_operators`
        """
    def fliplr(x):
        """
        Flips each row.

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
        Flips each column.

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
        Prints the matrix.

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
        Finds the transpose.

        :param x: A source matrix.
        :type x: matrix
        :rtype: The transpose of the matrix.

        .. seealso:: `np.transpose`_, :class:`matrix.T`, `Transpose`_
        """
    def write_csv(x, filename, prefix=S2_PREFIX):
        """
        Writes a CSV.

        :param x: A matrix.
        :type x: matrix
        :param filename: The file to write to. Writes to a file named filename in the directory *above* the prefix.
        :param prefix: Defaults to S2_PREFIX.
        """
    def ones_like(x):
        """
        Makes an matrix like another matrix.

        :param x: The array to imitate.
        :type x: ndarray

        >>> var x = array(3, 8, 2, 1).reshape((2,2))
        >>> assert(ones_like(x) ~== array(1, 1, 1, 1).reshape((2,2)))

        .. seealso:: `np.ones_like`_
        """
    def diag(x):
        """
        Make an array with the specified diagonal.

        :param x: The diagonal of the new array.
        :type x: ndarray
        :rtype: matrix

        >>> var x = diag(array(ones(3)))
        >>> assert(x ~== eye(3))
        """

class operators:
    def assignment_operator(lhs, rhs):
        """
        Assign select values of a matrix to a constant value.

        :param lhs: The matrix to assign to.
        :type lhs: matrix
        :param rhs: The value to fill.
        :type rhs: Double

        >>> x = ones((4,3))
        >>> x[0..<2, 0..<2] <- 5
        >>> # x ~== [5, 5, 1, 1; 
        >>> #        5, 5, 1, 1; 
        >>> #        1, 1, 1, 1]

        .. seealso:: :class:`ndarray.operators.assignment_operator`
        """
    def element_operators(lhs, rhs):
        """
        Element wise artithmetic operators.

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
        The dot product operator.

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
        Solves a system of eqautions similar to Matlab's backslash.

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
        Sees if two matrices are approximately equal.

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
        Perform the sum over a given axis.

        :param x:
        :type x: matrix
        :param axis: Assumed to be either 0 or 1. Finds the sum of all values that are not in the axis. 
        :type axis: Int
        :rtype: ndarray

        >>> var x = arange(6).reshape((2,3))
        >>> assert(sum(x, dim:0) ~== array(3, 5, 7))
        >>> assert(sum(x, dim:1) ~== array(3, 12))

        .. seealso:: `np.sum`_
        """
    def mean(x, axis=-1):
        """
        :param x:
        :type x: matrix
        :type dim: Int
        :param dim: The dimension to which compute the average over.
        :rtype: Returns the mean along each dimension
        """
    def prod(x, axis=-1):
        """
        Find the product of each row/column of a matrix.

        :param x: The matrix.
        :type x: matrix
        :rtype: ndarray. The product along the columns or rows.

        .. seealso:: `np.prod`_
        """

class images:
    def rgb2hsv(r, g, b):
        """
        Converts RGB values to HSV values.

        :param r: The red color plane.
        :param g: The green color plane.
        :param b: The blue color plane.
        :type r: matrix
        :type g: matrix
        :type b: matrix
        :rtype: (matrix, matrix, matrix). Returns the HSV color planes.

        .. note:: This function isn't optimized.

        .. seealso:: :class:`rgb2hsv_vplane`, `HSV`_
        """
    def rgb2hsv_vplane(r, g, b):
        """
        Converts a set of RGB color values to the HSV v plane only. Since
        :math:`v = \max(r, g, b)`, this function is optimized.

        :param r: The red color plane.
        :type r: matrix
        :param g: The blue color plane.
        :type g: matrix
        :param b: The green color plane.
        :type b: matrix
        :rtype: matrix. The v plane.

        .. seealso:: :class:`images.rgb2hsv`
        """
    def savefig(x, filename, save=True, show=False):
        """
        Saves a figure using Python.

        :param x: The matrix you want to see. 
        :type x: matrix
        :param filename: The filename you want to save at. 
        :type filename: String

        Saves the matrix. Relies on Python being found at PYTHON_PATH and pylab stack being installed

        .. seealso:: `mpl.savefig`_
        """
    def imshow(x):
        """
        Shows a matrix using Python.

        :param x: The matrix you want to see. 
        :type x: matrix

        Shows the matrix. Relies on Python being found at PYTHON_PATH and pylab stack being installed

        .. seealso:: `mpl.imshow`_
        """
    def UIImageToRGBAImage(image):
        """
        Convert an RGBA UIImage into 4 different arrays corresponding to the
        RGBA color planes.

        :param image: The image to convert.
        :type image: UIImage
        :rtype: matrix, matrix, matrix, matrix.

        .. note:: Commented out in ``swix/matrix/image.swift`` as UIKit doesn't compile for MacOSX.

        .. seealso:: :class:`images.RGBAToUIImage`
        """
    def RGBAToUIImage(r, g, b, a):
        """
        Convert the RGBA color planes into a UIImage

        :param r: The red color plane.
        :type r: matrix
        :param g: The green color plane.
        :type g: matrix
        :param b: The blur color plane.
        :type b: matrix
        :param a: The alpha color plane.
        :type a: matrix
        :rtype: UIImage

        .. note:: Commented out in ``swix/matrix/image.swift`` as UIKit doesn't compile for MacOSX

        .. seealso:: :class:`images.UIImageToRGBAImage`
        """
    def resizeImage(image, shape):
        """
        Resize an image to the given shape.

        :param image: The image to resize.
        :type image: UIImage
        :param shape: The desired size; (vertical_length, horizontal_length)
        :type shape: (Int, Int)

        .. note:: Commented out in ``swix/matrix/image.swift`` as UIKit doesn't compile for MacOSX
        """

class complex_math:
    def rank(x):
        """
        Compute the `matrix rank`_ of a matrix.

        :param x: The matrix to compute the rank of.
        :type x: matrix
        :rtype: Double. The rank of the matrix.

        .. seealso:: `matrix rank`_, `np.linalg.matrix_rank`_
        """
    def dot(x, y):
        """
        Matrix multiplication between two matrices.

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
        Find the eigenvaleus of a matrix.

        :param x: The matrix to find the eigenvalues of.
        :type x: matrix
        :rtype: the eigenvalues the matrix.

        .. note:: This function does not find any eigenvectors (and should but bugs).

        .. seealso:: `np.linalg.eig`_, `Eigenvalues`_
        """
    def inv(x):
        """
        Find the inverse of a matrix.

        :param x: Finds the inverse of this matrix.
        :type x: matrix
        :rtype: :math:`x^{-1}`
        
        Finds the inverse of the matrix; can be expensive time-wise!

        .. seealso::
            :class:`matrix.I`, `np.linalg.inv`_, `Matrix inverse`_
        """
    def solve(A, b):
        """
        Solve a system of linear equations.

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
    def svd(x, compute_uv=True):
        """
        Compute the singular value decomposition.

        :param x: The input to the singular value decomposition.
        :type x: matrix
        :param compute_uv: Compute U and V.
        :type compute_uv: Bool
        :rtype: (matrix, ndarray, matrix)

        Finds a factorization such that :math:`x = U S V`.

        .. seealso:: `np.linalg.svd`_, `Singular value decomposition`_
        """
    def pinv(x):
        """
        Finds the `Moore-Penrose pseudoinverse`_.

        :param x: Finds the inverse of this matrix.
        :type x: matrix
        :rtype: matrix

        .. seealso:: `Moore-Penrose pseudoinverse`_, `np.linalg.pinv`_
        """

