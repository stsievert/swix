#from numbers import S2_PREFIX
S2_PREFIX = "\(NSHomeDirectory())/Developer/swix/swix/swix/swix/"


class ndarray:
    n = "Int" #: Number of elements this array contains
    count = n #: Number of elements.
    grid = "[Double]" #: The Array this ndarray depends on.
    def reshape(shape):
        """
        :param shape: The size of the new matrix.
        :type shape: (Int, Int)
        :rtype: matrix. The ndarray reshaped as a matrix.

        >>> x = arange(2*2).reshape((2,2))
        >>> println(x)
        # prints [0 1; 2 3]

        .. seealso::
            `np.reshape`_
        """
    def copy():
        """
        :rtype: ndarray. An exact copy of the array.

        >>> assert(x.copy() ~== x)
        """
    def sort():
        """
        Sorts the array in-place.

        .. seealso:: :class:`helper_functions.sort`
        """
    def reverse():
        """
        Reverses the array in place.

        .. seealso:: :class:`helper_functions.reverse`
        """
    def min():
        """
        :rtype: Double. The minimum value in the array.

        >>> assert(array(1, 2, 3, 4).min() == 1)

        .. seealso::
            `np.min`_
        """
    def max():
        """
        :rtype: Double. The maximum value in the array.

        >>> assert(array(1, 2, 3, 4).max() == 4)
        """
    def mean():
        """
        :rtype: Double. The mean value in the array.

        >>> assert(array(1, 2, 3, 4).mean() == 2.5)
        """
    def indexing(idx):
        """
        :param idx: The values to get the index from.
        :type idx: Int, Range<Int>, ndarray

        >>> var x = arange(10)
        >>> assert(x[1] == 1)
        >>> assert(x[0..<2] ~== array(0, 1))
        >>> assert(x[array(0, 1)] ~== array(0, 1))
        """

class helper_functions:
    def println(x, prefix="array([", postfix="])", newline="\n", format="%.3f", seperator=", ", printWholeMatrix=False):
        """
        :param x: Prints that matrix.
        :type x: ndarray

        Prints the ndarray with the above optional formatters. They are all of type String.

        Also callable: ``print(x, ..., newline="")`` with the same options.
        """
    def argwhere(idx):
        """
        :param idx: An array of 0's and 1's (analagous to true and false).
        :type idx: ndarray
        :rtype: ndarray. Returns the indices where idx has *non-zero* elements.

        .. seealso::
            `np.argwhere`_
        """
    def sort(x):
        """
        :param x: Array to be sorted.
        :type x: ndarray
        :rtype: ndarray. The sorted array.

        .. seealso:: :class:`ndarray.sort`
        """
    def write_csv(x, filename, prefix=S2_PREFIX):
        """
        :param x: The ndarray to write to a csv
        :type x: ndarray
        :type filename: String
        :param filename: Where to write.
        :param prefix: Defaults to S2_PREFIX. Writes to the folder above S2_PREFIX.
        :type prefix: String

        .. note:: Unoptimized. I assume you're only using this on MacOSX to test your app.

        .. seealso:: :class:`initing.read_csv`
        """
    def reverse(x):
        """
        :param x: The array to be reversed.
        :type x: ndarray
        :rtype: The reveresed ndarray.

        .. seealso:: :class:`ndarray.reverse`
        """
    def concat(x, y):
        """
        :param x: The first array to stack.
        :type x: ndarray
        :param y: The second array to stack.
        :type y: ndarray
        :rtype: ndarray. Equivalent to ``concatenate((x, y))`` in NumPy or ``[x y]`` in Matlab.

        >>> var x = array(0, 1)
        >>> var y = array(2, 3)
        >>> assert(concat(x, y) ~== arange(4))

        .. seealso:: `np.concatenate`_
        """

class initing():
    def asarray(x):
        """
        :param x: A native Swift array.
        :type x: [Double]
        :rtype: ndarray. The native Swift array converted to an ndarray.
        """
    def zeros(N):
        """
        :param N: The length of the array.
        :type N: Int

        >>> assert(zeros(3) ~== array(0, 0, 0))

        .. seealso::
            `np.zeros`_
        """
    def zeros_like(x):
        """
        :param x: The array to imitate.
        :type x: ndarray

        >>> var x = array(3, 8)
        >>> assert(zeros_like(x) ~== array(0, 0)

        .. seealso:: `np.zeros_like`_
        """
    def ones(N):
        """
        :param N: The length of the array.
        :type N: Int

        >>> assert(ones(3) ~== array(1, 1, 1))
        """
    def arange(max, min=0, x=True):
        """
        :param max: How high should the array index up to?
        :type max: Int
        :param min: Where should the indexing start?
        :type min: Int
        :param x: Should the array be exclusive?
        :type x: Bool

        >>> assert(arange(2) ~== array(0, 1))
        >>> assert(arange(4, 6) ~== array(4, 5))
        >>> assert(arange(2, x:true) ~== array(0, 1, 2))

        .. seealso:: `np.arange`_
        """
    def linspace(min, max, num=50):
        """
        :param min: The minimum value.
        :type min: Double.
        :param max: The maximum value.
        :type max: Double.
        :param num: How many elements?
        :type num: Int

        >>> assert(linspace(0, 1, num:3) ~== array(0.0, 0.5, 1.0))

        .. seealso:: `np.linspace`_
        """
    def array(numbers):
        """
        :param numbers: A list of numbers to make an array.
        :type numbers: Double...
        .. note:: Unoptimized. I assume this is only being used in test code.

        >>> println(array(0, 1, 2, 3, 4))
        # prints array([0.000, 1.000, 2.000, 3.000, 4.000])
        """
    def repeat(x, N, how="ndarray"):
        """
        :param x: The array to repeat.
        :param N: How many times to repeat the array.
        :param how: Assumed to be "ndarray" or "elements".
        :type x: ndarray
        :type N: Int
        :type how: String

        >>> var x = array(0, 1)
        >>> assert(repeat(x, 2, how:"ndarray") ~== array(0, 1, 0, 1))
        >>> assert(repeat(x, 2, how:"elements") ~== array(0, 0, 1, 1))
        """
    def copy(x):
        """
        :param x: The array to copy.
        :type x: ndarray

        Returns :func:`ndarray.copy`

        >>> assert(copy(x) ~== x.copy())
        """
    def read_csv(filename, prefix=S2_PREFIX):
        """
        :param filename: The file to read from. The file read from the directory containing ``swix/``.
        :param prefix: Defaults to ``S2_PREFIX``
        :type filename: String
        :type prefix: String
        :rtype: ndarray. The contents of the csv.

        .. note:: Assuming that you're only using the on MacOSX to test your app; not optimized.
        
        .. seealso:: :class:`helper_functions.write_csv`
        """
    def toArray(sequence):
        """
        :param sequence: A range of numbers.
        :type sequence: Range<Int>
        :rtype: ndarray. The sequence converted to an array.

        >>> assert(toArray(0..<2) ~== array(0, 1))
        """

class operators:
    def add_subtract_multiply_divide(lhs, rhs):
        """
        :param lhs: Left hand side.
        :param rhs: Right hand side.
        :type lhs: ndarray, Double
        :type rhs: ndarray, Double

        The operators ``+ - * / % += -= *= /= < > <= >= == !==`` all work element wise and act similar to scalars.

        .. note:: Callable through the natural operators (+, -, etc).

        .. note:: ``==`` and ``!==`` see when two arrays are *exactly* equal for the incredibly percise doubles. I recommend using ``abs(x-y)<1e-9``.

        """
    def logical_operators(lhs, rhs):
        """
        :param lhs: An array of true/false (meaning 0 or 1)
        :type lhs: ndarray
        :param rhs: An array of true/false (meaning 0 or 1)
        :type rhs: ndarray
        :rtype: ndarray. The logical operator between the two elements.

        Currently only logical AND and logical OR are implemented through
        ``&&`` and ``||`` respectively.
        """
    def equality(lhs, rhs):
        """
        :param lhs: Left hand side.
        :param rhs: Right hand side.
        :type lhs: ndarray, Double
        :type rhs: ndarray, Double

        Sees if two arrays are approximately equal.

        The comparison operators are all implemented through OpenCV and rely on the array being continuous in memory, which relies on having small input arrays. It will print (but not assert) if this is not the case.

        .. note:: Callable through the ``~==`` operator. 

        
        .. note:: To be changed to ``~=``.

        >>> assert(array(0, 1) ~== array(0, 1+1e-10))
        """
    def power(lhs, rhs):
        """
        :param lhs: The ndarray
        :param rhs: The power.
        :type lhs: ndarray
        :type rhs: Double.
        :rtype: ndarray, ``pow(lhs, rhs)``.

        .. note:: Optimized for rhs=2. If ``close(2, rhs) == True``, prints message but no assert.

        >>> assert(array(1, 4) ~== array(1, 2)^2)
        """

class simple_math:
    def apply_function(function, x):
        """
        :param function: Callable function.
        :param x: An array.
        :type function: Double->Double
        :type x: ndarray
        :rtype: A new array with the function applied to every element.
        .. note:: Unoptimized. I tried to optimize with Grand Central Dispatch's ``dispatch_apply``, but no luck.
        """
    def apply_function(function, x):
        """
        :param function: Assumed to be one of "abs", "sign" or "cumsum"
        :param x: An array.
        :type function: String
        :type x: ndarray
        :rtype: A new array with the function applied to every element. Optimized.
        """
    def min(x):
        """
        :param x: An array.
        :type x: ndarray
        :rtype: Double. The minimum value of the array.
        """
    def max(x):
        """
        :param x: An array.
        :type x: ndarray
        :rtype: Double. The maximum value of the array.
        """
    def max(x, y):
        """
        :param x: An array.
        :param y: Another array.
        :type x: ndarray
        :type y: ndarray
        :rtype: ndarray. The maximum of either array.

        >>> assert(max(array(0, 1, 5), array(2, 1, 0)) ~== array(2, 1, 5))
        """
    def min(x, y):
        """
        :param x: An array.
        :param y: Another array.
        :type x: ndarray
        :type y: ndarray
        :rtype: ndarray. The minimum of either array.

        >>> assert(max(array(0, 1, 5), array(2, 1, 0)) ~== array(0, 1, 0))
        """
    def sign(x):
        """
        :param x: An array.
        :type x: ndarray
        :rtype: The sign of the array centered at 0.

        >>> assert(sign(array(-1, 0.1, 1)) ~== array(-1, 1, 1))
        """
    def sum(x):
        """
        :param x: An array.
        :type x: ndarray
        :rtype: Double. The sum of all the elements in x. Returns the result from the following operation: :math:`\sum x_i`

        >>> assert(sum(array(1, 2, 3)) == 6)
        """
    def avg(x):
        """
        :param x: An array.
        :type x: ndarray
        :rtype: Double. The average of all the components or :math:`\sum x_i / N`
        """
    def std(x):
        """
        :param x: An array.
        :type x: ndarray
        :rtype: Double. The standard deviation of the array.
        """
    def variance(x):
        """
        :param x: An array.
        :type x: ndarray
        :rtype: Double. The variance of the array.

        .. seealso:: `Variance`_
        """
    def cumsum(x):
        """
        :param x: An array.
        :type x: ndarray
        :rtype: ndarray. The cumulative sum of the array.

        >>> assert(cumsum(arange(5)) ~== array(0, 1, 3, 6))
        """
    def rand(N, seed=42):
        """
        :param N: The size of the array.
        :type N: Int
        :param seed: The random number generator seed.
        :type seed: Int
        :rtype: ndarray. Random integers normally distributed.

        .. warning:: The seed stays constant for each call.

        .. seealso:: `np.random.rand`_
        """
    def randn(N, seed=42, mean=0.0, sigma=1.0):
        """
        :param N: The size of the array.
        :type N: Int
        :param seed: The random number generator seed.
        :type seed: Int
        :param mean: The mean of this distribution.
        :type mean: Double
        :param sigma: The standard deviation of this distribution.
        :type sigma: Double
        :rtype: ndarray. Random integers that are normally distributed.

        .. seealso:: `np.random.randn`_
        """
    def abs(x):
        """
        :param x: An array.
        :type x: ndarray
        :rtype: ndarray. The absolute value of the array
        """
    def norm(x, type="l2"):
        """
        :param x: An array.
        :type x: ndarray
        :param type: One of "l0", "l1", "l0"
        :type type: String
        :rtype: ndarray. A specific norm of the array. Either the :math:`l_0`, :math:`l_1` or :math:`l_2` norm.

        .. seealso:: `np.linalg.norm`_
        """
    def pow(x, power):
        """
        :param x: An array.
        :type x: ndarray
        :param power: The power
        :type power: Double
        :rtype: ndarray. Performs the same action as the operator ``^``. Raises each element to a power.

        >>> assert(pow(array(1, 2, 3), 2) ~== array(1, 4, 9))
        """
    def sin(x):
        """
        :param x: An array.
        :type x: ndarray
        :rtype: ndarray. Performs the function ``sin`` on each element.
        """
    def cos(x):
        """
        :param x: An array.
        :type x: ndarray
        :rtype: ndarray. Performs the function ``cos`` on each element.
        """
    def tan(x):
        """
        :param x: An array.
        :type x: ndarray
        :rtype: ndarray. Performs the function ``tan`` on each element.
        """
    def log(x):
        """
        :param x: An array.
        :type x: ndarray
        :rtype: ndarray. Performs the function ``log`` on each element.
        """
    def sqrt(x):
        """
        :param x: An array.
        :type x: ndarray
        :rtype: ndarray. Performs the function ``sqrt`` on each element.
        """
    def round(x):
        """
        :param x: An array.
        :type x: ndarray
        :rtype: ndarray. Performs the function ``round`` on each element.

        >>> assert(round(array(0.4, 0.6)) ~== array(0, 1))
        """
    def floor(x):
        """
        :param x: An array.
        :type x: ndarray
        :rtype: ndarray. Performs the function ``floor`` on each element.

        >>> assert(floor(array(0.4, 0.6)) ~== array(0, 0))
        """
    def ceil(x):
        """
        :param x: An array.
        :type x: ndarray
        :rtype: ndarray. Performs the function ``sin`` on each element.

        >>> assert(ceil(array(0.4, 0.6)) ~== array(1, 1))
        """

class complex_math:
    def fft(x):
        """
        :param x: An array to perform the fft on.
        :type x: ndarray
        :rtype: ndarray, ndarray. The real and imaginary components of the Fourier transform.

        >>> x = arange(10)
        >>> assert(x ~== ifft(fft(x)))

        .. seealso:: `np.fft.fft`_, `Fourier Transform`_
        """
    def ifft(y_real, y_imag):
        """
        :param y_real: The real part of fft(x).
        :type y_real: ndarray
        :param y_imag: The imaginary part of fft(x)
        :type y_imag: ndarray
        :rtype: ndarray. The inverse Fourier transform of :math:`y_{real} + j \\cdot y_{imag}`

        .. seealso:: `np.fft.ifft`_, `Fourier Transform`_
        """


