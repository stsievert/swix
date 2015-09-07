from numbers_swix import S2_PREFIX

class ndarray:
    n = "Int" #: Number of elements this array contains
    count = n #: Number of elements.
    grid = "[Double]" #: The Array this ndarray depends on.
    def reshape(shape):
        """
        Reshapes the matrix to the specified size. The number of elements must remain constant, however, if a value of -1 is passed a new size is calculated to keep the number of elements the same.

        :param shape: The size of the new matrix.
        :type shape: (Int, Int)
        :rtype: matrix. The ndarray reshaped as a matrix.

        >>> var x = arange(2*2).reshape((2,2))
        >>> var y = x.reshape((2,-1))
        >>> print(y)
        # prints [0 1; 2 3]
        >>> print(x)
        # prints [0 1; 2 3]

        .. seealso::
            `np.reshape`_, :class:`matrix.initing.reshape`
        """
    def copy():
        """
        Copies the contents of an array.

        :rtype: ndarray. An exact copy of the array.

        >>> assert(x.copy() ~== x)

        .. seealso:: `np.copy`_
        """
    def sort():
        """
        Sorts the array in-place.

        .. seealso:: :class:`helper_functions.sort`, `np.sort`_
        """
    def reverse():
        """
        Reverses the array in place.

        .. seealso:: :class:`helper_functions.reverse`
        """
    def min():
        """
        Finds the minimum value.

        :rtype: Double. The minimum value in the array.

        >>> assert(array(1, 2, 3, 4).min() == 1)

        .. seealso::
            `np.min`_
        """
    def max():
        """
        Finds the maximum value.

        :rtype: Double. The maximum value in the array.

        >>> assert(array(1, 2, 3, 4).max() == 4)

        .. seealso:: `np.max`_
        """
    def mean():
        """
        Finds the average value.

        :rtype: Double. The mean value in the array.

        >>> assert(array(1, 2, 3, 4).mean() == 2.5)

        .. seealso:: `np.mean`_
        """
    def indexing(idx):
        """
        Grabs elements using an ndarray, Range<Int> or integers. Includes negative indexing like Python.

        .. warning:: Assumes an index is either wholly positive or negative; indexes like ``array(-1, 0, 1)`` aren't supported.

        Use ``x["all"]`` to grab all elements from this array.

        It's also possible to use boolean indexing. The boolean indexs are
        assumed to have a length the same as the array being indexed.

        :param idx: The values to get the index from.
        :type idx: Int, Range<Int>, ndarray, String

        >>> var x = arange(10)
        >>> assert(x[1] == 1)
        >>> assert(x[0..<2] ~== array(0, 1))
        >>> assert(x[array(0, 1)] ~== array(0, 1))
        >>> assert(x[-1] == 9)
        >>> assert(x["all"] ~== arange(10))
        >>> assert(x[x < 3] ~== array(0, 1, 2))

        .. seealso:: `np.indexing`_
        """

class initing():
    def rand(N, distro="uniform"):
        """
        Makes an array of uniform random variables.

        :param N: The size of the array.
        :type N: Int
        :param distro: The type of distribution. Assumed to be either ``"uniform"`` or ``"normal"``
        :type distro: String
        :rtype: ndarray. Random integers normally distributed.

        .. seealso:: :class:`initing.seed`, `np.random.rand`_
        """
    def seed(N):
        """
        Sets the seed for a psuedo-random number generation. This uses the global variable ``SWIX_SEED`` defined in ``numbers.swift``. This global variable ``SWIX_SEED`` updates every time a call to rand is called (which happens through randn, etc).

        :param N: The seed. If ``seed`` is not called, this defaults to 42.
        :type N: Int

        .. seealso:: :class:`initing.rand`, :class:`initing.randn`, :class:`initing.randperm`
        """
    def randn(N, mean=0.0, sigma=1.0):
        """
        Makes an array of normally distributed random variables.

        :param N: The size of the array.
        :type N: Int
        :param mean: The mean of this distribution.
        :type mean: Double
        :param sigma: The standard deviation of this distribution.
        :type sigma: Double
        :rtype: ndarray. Random integers that are normally distributed.

        .. seealso:: `np.random.randn`_
        """
    def randperm(N):
        """
        Shuffle an array of (typically) indices.

        :param N: The size of the array. Values included are between 0 and N-1.
        :type N: Int
        :rtype: ndarray

        .. seealso:: :class:`helper_functions.shuffle`, `np.random.permutation`_
        """
    def arange(max, min=0, x=True):
        """
        Makes an array of integers.

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
    def array(numbers):
        """
        Makes an array out of a list of numbers.

        :param numbers: A list of numbers to make an array.
        :type numbers: Double...

        .. note:: Unoptimized. I assume this is only being used in test code.

        >>> print(array(0, 1, 2, 3, 4))
        # prints array([0.000, 1.000, 2.000, 3.000, 4.000])
        """
    def asarray(x):
        """
        Convert the input to an ndarray.

        :param x: A native Swift array.
        :type x: [Double], Range<Int>
        :rtype: ndarray. The native Swift array converted to an ndarray.

        >>> assert(asarray(0..<2) ~== array(0, 1))
        >>> assert(asarray([0, 1, 2]) ~== array(0, 1, 2))
        """
    def copy(x):
        """
        Copies the contents of an array.

        :param x: The array to copy.
        :type x: ndarray

        Returns :func:`ndarray.copy`

        >>> assert(copy(x) ~== x.copy())

        .. seealso:: :class:`ndarray.copy` `np.copy`_
        """
    def linspace(min, max, num=50):
        """
        Makes a series of values linearly interpolated between two poitns.

        :param min: The minimum value.
        :type min: Double.
        :param max: The maximum value.
        :type max: Double.
        :param num: How many elements?
        :type num: Int

        >>> assert(linspace(0, 1, num:3) ~== array(0.0, 0.5, 1.0))

        .. seealso:: `np.linspace`_
        """
    def ones(N):
        """
        Makes an array of ones.

        :param N: The length of the array.
        :type N: Int

        >>> assert(ones(3) ~== array(1, 1, 1))

        .. seealso:: `np.ones`_
        """
    def zeros(N):
        """
        Makes an array of 0's.

        :param N: The length of the array.
        :type N: Int

        >>> assert(zeros(3) ~== array(0, 0, 0))

        .. seealso::
            `np.zeros`_
        """
    def zeros_like(x):
        """
        Makes an array like another array.

        :param x: The array to imitate.
        :type x: ndarray

        >>> var x = array(3, 8)
        >>> assert(zeros_like(x) ~== array(0, 0)

        .. seealso:: `np.zeros_like`_
        """
    def ones_like(x):
        """
        Makes an array like another array.

        :param x: The array to imitate.
        :type x: ndarray

        >>> var x = array(3, 8)
        >>> assert(ones_like(x) ~== array(1, 1)

        .. seealso:: `np.ones_like`_
        """

class helper_functions:
    def count_nonzero(x):
        """
        Counts the nonzero elements.

        :param x: The array to be counted.
        :type x: ndarray
        :rtype: Double. The number of nonzero elements.

        .. seealso:: `np.count_nonzero`_
        """
    def intersection(x, y):
        """
        Find elements that are both arrays.

        :param x: The first array.
        :type x: ndarray
        :param y: The second array.
        :type y: ndarray
        :rtype: The sorted array of unique elements that are in both arrays.

        >>> var x = array(1, 2, 3, 4)
        >>> var y = array(5, 3, 1, 0)
        >>> assert(intersection(x, y) ~== array(1, 3))

        .. seealso:: `np.intersect1d`_
        """
    def union(x, y):
        """
        Finds unique elements that are in either array.

        :param x: The first array of elements.
        :type x: ndarray
        :param y: The second array of elements.
        :type y: ndarray
        :rtype: The unique list of elements that in either array.

        >>> var x = array(1, 2, 3, 4)
        >>> var y = array(2, 3, 4, 5)
        >>> assert(union(x, y) ~== array(1, 2, 3, 4, 5))
        """
    def in1d(x, y):
        """
        Sees if elements from the first array are in the second and returns the
        indices.

        :param x: The array to index from.
        :type x: ndarray
        :param y: The array to check to see if values of x are in this array.
        :type y: ndarray
        :rtype: ndarray. An array of true/false (well, 1/0).

        >>> var x = array(1, 2, 3, 4, 5)
        >>> var y = array(4, 5, 6)
        >>> assert(in1d(x, y) ~== array(0, 0, 0, 1, 1))

        .. seealso:: `np.in1d`_
        """
    def norm(x, ord=2):
        """
        Finds the norm of an array.

        :param x: An array.
        :type x: ndarray
        :param ord: Indicates the specific type of norm.
        :type ord: Int or :math:`\pm` inf
        :rtype: Double. A specific norm of the array. Either the :math:`\ell_0`, :math:`\ell_1`, :math:`\ell_2` or :math:`\ell_\infty` norm.

        .. note:: This is a direct copy of `np.linalg.norm`_. See NumPy's documentation for info about appropiate values for ord.

        .. seealso:: `np.linalg.norm`_, `Norm`_
        """
    def prod(x):
        """
        Find the product of every element in this array.

        :param x: Find the product of every element in this array
        :type x: ndarray
        :rtype: Double

        >>> assert(prod(arange(4)+1) == 24)
        """
    def cumprod(x):
        """
        Find the cumulative product of every element in this array.

        :param x: The cumulative product of elements in this array.
        :type x: ndarray
        :rtype: ndarray

        >>> assert(cumprod(arange(4)+1) ~== array(1, 2, 6, 24))
        """
    def unique(x):
        """
        Find the unique elements of an array. Returns the unique elements
        sorted.

        :param x: The input array.
        :type x: ndarray
        :rtype: ndarray. The unqiue element.

        >>> x = array(1, 1, 2, 3, 4, 4, 5, 6)
        >>> assert(unique(x) ~== array(1, 2, 3, 4, 5, 6))
        """
    def shuffle(x):
        """
        Randomly shuffle an array.

        :param x: The array to shuffle.
        :type x: ndarray
        :rtype: The array shuffled. Not in place!

        .. seealso:: `cv.randShuffle`_, `np.random.shuffle`_
        """
    def clip(a, a_min, a_max):
        """
        Only keep values between a_min and a_max; set the rest to 0. Performs the following operation:

        :math:`(x_i < a_{min}) \lor (x_i > a_{max}) \implies x_i = 0`

        Similar to Numeric's clip.

        :param a: The array to clip.
        :type a: ndarray
        :param a_min: The minimum value.
        :type a_min: Double
        :param a_max: The maximum value.
        :type a_max: Double
        :rtype: ndarray
        """
    def argwhere(idx):
        """
        Sees where a condition exists.

        :param idx: An array of 0's and 1's (analagous to true and false).
        :type idx: ndarray
        :rtype: ndarray. Returns the indices where idx has *non-zero* elements.

        .. seealso::
            `np.argwhere`_, :class:`argmin`, :class:`argsort`, :class:`argwhere`
        """
    def argsort(x):
        """
        Sort the array but using indices.

        :param x: An array.
        :type x: ndarray
        :rtype: ndarray

        >>> var x = array(1, 4, 2, 6, 7)
        >>> assert(argsort(x) ~== array(0, 2, 1, 3, 4))

        .. seealso:: `np.argsort`_, `cv.sortIdx`_, :class:`argmin`, :class:`argsort`, :class:`argwhere`
        """
    def argmin(x):
        """
        The location of the minimum.

        :param x: An array.
        :type x: ndarray
        :rtype: Double. The location of the maximum value.

        .. seealso:: `np.argmin`_, `cv.minMaxLoc`_, :class:`argmax`, :class:`argmin`, :class:`argsort`, :class:`argwhere`
        """
    def argmax(x):
        """
        The location of the maximum.

        :param x: An array.
        :type x: ndarray
        :rtype: Double. The location of the maximum value.

        .. seealso:: `np.argmax`_, `cv.minMaxLoc`_, :class:`argmin`, :class:`argsort`, :class:`argwhere`
        """
    def delete(x, idx):
        """
        Deletes elements.

        :param x: The original array.
        :param idx: The indices to remove.
        :type x: ndarray
        :type idx: ndarray
        :rtype: ndarray. The array with the specified indices deleted.
        """
    def concat(x, y):
        """
        Concatenates two arrays.

        :param x: The first array to stack.
        :type x: ndarray
        :param y: The second array to stack.
        :type y: ndarray
        :rtype: ndarray. Equivalent to ``concatenate((x, y))`` in NumPy or ``[x y]`` in Matlab.

        >>> var x = array(0, 1)
        >>> var y = array(2, 3)
        >>> assert(concat(x, y) ~== arange(4))

        .. seealso:: `np.concatenate`_, `np.append`_
        """
    def println(x, prefix="array([", postfix="])", newline="\n", format="%.3f",
            seperator=", ", printAllElements=False):
        """
        Prints an array.

        .. note:: Can be called with either ``print(x)`` or ``println(x)``

        :param x: Prints that matrix.
        :type x: ndarray

        Prints the ndarray with the above optional formatters. They are all of type String.
        """
    def repeat(x, N, axis=0):
        """
        Repeats an array.

        .. warning:: Must be called with ```repeat`(x, N:3)``. ``repeat`` is a keyword in Swift and those backticks must be used.

        :param x: The array to repeat.
        :param N: How many times to repeat the array.
        :param axis: Assumed to be "ndarray" or "elements".
        :type x: ndarray
        :type N: Int
        :type axis: Int

        >>> var x = array(0, 1)
        >>> assert(repeat(x, 2, axis:0) ~== array(0, 1, 0, 1))
        >>> assert(repeat(x, 2, axis:1) ~== array(0, 0, 1, 1))

        .. seealso:: `np.repeat`_
        """
    def reverse(x):
        """
        Reverses an array.

        :param x: The array to be reversed.
        :type x: ndarray
        :rtype: The reveresed ndarray.

        .. seealso:: :class:`ndarray.reverse`
        """
    def sort(x):
        """
        Sorts an array.

        :param x: Array to be sorted.
        :type x: ndarray
        :rtype: ndarray. The sorted array.

        .. seealso:: :class:`ndarray.sort`, `np.sort`_
        """
    def logical_not(x):
        """
        Find the logical NOT of x and y.

        :param x: An array of truth values; assumed to take values of 0 and 1.
        :type x: ndarray
        :rtype: ndarray

        .. seealso:: `np.logical_not`_
        """
    def logical_and(x, y):
        """
        Find the logical AND of x and y.

        :param x: An array of truth values; assumed to take values of 0 and 1.
        :type x: ndarray
        :param y: An array of truth values; assumed to take values of 0 and 1.
        :type y: ndarray
        :rtype: ndarray

        .. seealso:: `np.logical_and`_
        """
    def logical_or(x, y):
        """
        Find the logical OR of x and y.

        :param x: An array of truth values; assumed to take values of 0 and 1.
        :type x: ndarray
        :param y: An array of truth values; assumed to take values of 0 and 1.
        :type y: ndarray
        :rtype: ndarray

        .. seealso:: `np.logical_or`_
        """
    def logical_xor(x, y):
        """
        Find the logical XOR of x and y.

        :param x: An array of truth values; assumed to take values of 0 and 1.
        :type x: ndarray
        :param y: An array of truth values; assumed to take values of 0 and 1.
        :type y: ndarray
        :rtype: ndarray

        .. seealso:: `np.logical_xor`_
        """

class operators:
    def assignment_operator(lhs, rhs):
        """
        Assign select values of an array to a value.

        :param lhs: The ndarray to assign to.
        :type lhs: ndarray
        :param rhs: The value to fill the array with.
        :type rhs: Double

        .. note:: Callable through ``x[0..<2] <- 4``

        >>> var x = arange(4)
        >>> # assign select values!
        >>> x[0..<2] <- 4
        >>> assert(x ~== array(4, 4, 2, 3)

        .. seealso:: :class:`matrix.operators.assignment_operator`
        """
    def elementwise_operators(lhs, rhs):
        """
        Element-wise operators.

        :param lhs: Left hand side.
        :param rhs: Right hand side.
        :type lhs: ndarray, Double
        :type rhs: ndarray, Double

        The operators ``+ - * / % += -= *= /= < > <= >= == !==`` all work element wise and act similar to scalars.

        .. note:: Callable through the natural operators (+, -, etc).

        .. note:: ``==`` and ``!==`` see when two arrays are *exactly* equal for the incredibly percise doubles. I recommend using ``abs(x-y)<1e-9``.

        .. seealso:: `np.operators`_
        """
    def logical_operators(lhs, rhs):
        """
        Logical operators.

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
        Seeing if two arrays are about equal.

        :param lhs: Left hand side.
        :param rhs: Right hand side.
        :type lhs: ndarray, Double
        :type rhs: ndarray, Double

        Sees if two arrays are approximately equal.

        The comparison operators are all implemented through OpenCV and rely on the array being continuous in memory, which relies on having small input arrays. It will print (but not assert) if this is not the case.

        .. note:: Callable through the ``~==`` operator.

        >>> assert(array(0, 1) ~== array(0, 1+1e-10))
        """
    def pow(lhs, rhs):
        """
        The power operator.

        :param lhs: The ndarray
        :param rhs: The power.
        :type lhs: ndarray, Double, ndarray
        :type rhs: Double, ndarray, ndarray.
        :rtype: ndarray, ``pow(lhs, rhs)``.

        .. note:: callable with ``x^y``.

        .. note:: Optimized for lhs:ndarray, rhs=2. If ``close(2, rhs) == True``, prints message but no assert.

        >>> assert(array(1, 4) ~== array(1, 2)^2)

        .. seealso:: `np.power`_, :class:`simple_math.pow`
        """

class simple_math:
    """
    The following are detailed docs on various functions, but the following
    functions work like expected:

    * min, max, mean, std, variance
    * sign, abs, norm, pow, sqrt
    * sum, cumsum,
    * rand, randn
    * sin, cos, tan
    * round, floor, ceil
    """
    def apply_function(function, x):
        """
        Apply a function to every element of an array.

        :param function: Assumed to be one of "abs", "sign", "floor" or "cumsum" or a simple Double->Double function.
        :param x: An array.
        :type function: String, Double->Double
        :type x: ndarray
        :rtype: A new array with the function applied to every element. Optimized for string case.

        .. note:: Unoptimized for function type Double->Double. I tried to optimize with Grand Central Dispatch's ``dispatch_apply``, but no luck.
        """
    def remainer(x1, x2):
        """
        Finds the element wise remainder after dividing the two arrays.

        >>> assert(array(1.1, 1.2, 1.3) % ones(3) ~== array(0.1, 0.2, 0.3))

        :param x1: The top divisor.
        :type x1: ndarray, Double, ndarray
        :param x2: The bottom divisor.
        :type x2: Double, ndarray, ndarray
        :rtype: ndarray
        """
    def min(x, y=None):
        """
        Finds the maximum element.

        If only one array specified, it only finds the maximum element of that
        array. If two arrays specficied, it finds the maximum element wise.

        >>> assert(max(array(0, 1), array(1, 0)) ~== array(0, 0))

        :param x: An array.
        :type x: ndarray
        :param y: Another array.
        :type y: ndarray
        :rtype: Double, ndarray. The maximum value of the array or the maximum element from both arrays.
        """
    def max(x, y=None):
        """
        Finds the maximum element.

        If only one array specified, it only finds the maximum element of that
        array. If two arrays specficied, it finds the maximum element wise.

        >>> assert(max(array(0, 1), array(1, 0)) ~== array(1, 1))

        :param x: An array.
        :type x: ndarray
        :param y: Another array.
        :type y: ndarray
        :rtype: Double, ndarray. The maximum value of the array or the maximum element from both arrays.
        """
    def sign(x):
        """
        Finds the sign an array.

        :param x: An array.
        :type x: ndarray
        :rtype: The sign of the array centered at 0.

        >>> assert(sign(array(-1, 0.1, 1)) ~== array(-1, 1, 1))
        """
    def sum(x):
        """
        Finds the sum of an array.

        :param x: An array.
        :type x: ndarray
        :rtype: Double. The sum of all the elements in x. Returns the result from the following operation: :math:`\sum x_i`

        >>> assert(sum(array(1, 2, 3)) == 6)
        """
    def mean(x):
        """
        Finds the mean of an array.

        :param x: An array.
        :type x: ndarray
        :rtype: Double. The average of all the components or :math:`\sum x_i / N`
        """
    def std(x):
        """
        Finds the standard deviation of an array.

        :param x: An array.
        :type x: ndarray
        :rtype: Double. The standard deviation of the array.
        """
    def variance(x):
        """
        Finds the variance of an array.

        :param x: An array.
        :type x: ndarray
        :rtype: Double. The variance of the array.

        .. seealso:: `Variance`_
        """
    def cumsum(x):
        """
        Finds the cumulative sum of an array.

        :param x: An array.
        :type x: ndarray
        :rtype: ndarray. The cumulative sum of the array.

        >>> assert(cumsum(arange(5)) ~== array(0, 1, 3, 6))
        """
    def abs(x):
        """
        Finds the absolute value of an array.

        :param x: An array.
        :type x: ndarray
        :rtype: ndarray. The absolute value of the array
        """
    def pow(x, power):
        """
        The power of a {Double, ndarray} to {Double, ndarray}

        :param x: An array.
        :type x: ndarray, Double, ndarray
        :param power: The power
        :type power: Double, ndarray, Double
        :rtype: ndarray. Performs the same action as the operator ``^``. Raises each element to a power.

        .. note:: Also callable through ``x^y``

        >>> assert(pow(array(1, 2, 3), 2) ~== array(1, 4, 9))
        """
    def sin(x):
        """
        Finds the sin of an array.

        :param x: An array.
        :type x: ndarray
        :rtype: ndarray. Performs the function ``sin`` on each element.
        """
    def cos(x):
        """
        Finds the cos of an array.

        :param x: An array.
        :type x: ndarray
        :rtype: ndarray. Performs the function ``cos`` on each element.
        """
    def tan(x):
        """
        Finds the tan of an array.

        :param x: An array.
        :type x: ndarray
        :rtype: ndarray. Performs the function ``tan`` on each element.
        """
    def log(x):
        """
        Finds the log base e of an array.

        :param x: An array.
        :type x: ndarray
        :rtype: ndarray. Performs the function ``log`` on each element.
        """
    def log10(x):
        """
        Finds the log base 10 of an array.

        :param x: An array.
        :type x: ndarray
        :rtype: ndarray. Performs the function ``log`` on each element.
        """
    def log2(x):
        """
        Finds the log base 2 of an array.

        :param x: An array.
        :type x: ndarray
        :rtype: ndarray. Performs the function ``log`` on each element.
        """
    def exp2(x):
        """
        Finds :math:`2^x` for some array x.

        :param x: 2 to the power of this array.
        :type x: ndarray
        :rtype: ndarray. :math:`2^x`
        """
    def expm1(x):
        """
        Estimate :math:`\exp(x)-1`. Useful for when :math:`exp(1) << 1`.

        :param x: The array to calculate the exponent of.
        :type x: ndarray
        :rtype: ndarray

        .. seealso:: `np.expm1`_
        """
    def exp(x):
        """
        Finds the exponent of each element; mathematically it finds
        :math:`\exp(x)`

        :param x: The input array
        :type x: ndarray
        :rtype: ndarray.
        """
    def sqrt(x):
        """
        Takes the sqrt of each element.

        :param x: An array.
        :type x: ndarray
        :rtype: ndarray. Performs the function ``sqrt`` on each element.
        """
    def round(x, decimals=0):
        """
        Rounds each element.

        :param x: An array.
        :type x: ndarray
        :param decimals: The number of decimals kept.
        :type decimals: Int
        :rtype: ndarray. Performs the function ``round`` on each element.

        >>> assert(round(array(0.4, 0.6)) ~== array(0, 1))
        >>> assert(round(array(0.43, 0.418), decimals:2) ~== array(0.43, 0.42))
        """
    def floor(x):
        """
        Floors each element.

        :param x: An array.
        :type x: ndarray
        :rtype: ndarray. Performs the function ``floor`` on each element.

        >>> assert(floor(array(0.4, 0.6)) ~== array(0, 0))
        """
    def ceil(x):
        """
        Ceil's each element.

        :param x: An array.
        :type x: ndarray
        :rtype: ndarray. Performs the function ``sin`` on each element.

        >>> assert(ceil(array(0.4, 0.6)) ~== array(1, 1))
        """

class complex_math:
    def fftconvolve(x, kernel):
        """
        Convolve x with a kernel.

        :param x: The base signal.
        :type x: ndarray
        :param kernel: The convolution kernel.
        :type kernel: ndarray
        :rtype: x convolved with kernel through the Fourier transform. That is, if :math:`y = x \\otimes k` then :math:`F(y) = F(x) \\cdot F(k)`

        .. warning:: There are bugs in this function. My simple tests with a delta function failed, possibly do to the funky divide in :class:`fft`/:class:`ifft`.

        .. warning:: The number of elements in kernel is assumed to be less than the number of elements in x.

        .. seealso:: `scipy.signal.fftconvolve`_, `Convolution`_
        """
    def fft(x):
        """
        Takes the discrete Fourier Transform.

        :param x: An array to perform the fft on.
        :type x: ndarray
        :rtype: ndarray, ndarray. The real and imaginary components of the Fourier transform.

        >>> x = arange(10)
        >>> assert(x ~== ifft(fft(x)))

        .. seealso:: `np.fft.fft`_, `Fourier Transform`_

        .. warning:: I had to do some weird dividing; possibly related to dimension?
        """
    def ifft(y_real, y_imag):
        """
        Takes the inverse Foureir Transform.

        :param y_real: The real part of fft(x).
        :type y_real: ndarray
        :param y_imag: The imaginary part of fft(x)
        :type y_imag: ndarray
        :rtype: ndarray. The inverse Fourier transform of :math:`y_{real} + j \\cdot y_{imag}`

        .. seealso:: `np.fft.ifft`_, `Fourier Transform`_

        .. warning:: I had to do some weird dividing; possibly related to dimension?
        """


