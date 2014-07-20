
Full docs
================

I'm going to refactor the code and change ``matrix`` to ``ndarray`` and
``matrix2d`` to ``matrix``. The docs reflect this change; in the meantime, just
substitute.

numbers
++++++++++++++

Constants defined
-----------------
* pi, :math:`\pi`. The circle constant (which really should be :math:`\tau`)
* phi, :math:`\phi`. The golden ratio ~ 1.6180
* euler. Euler's constant
* inf  = 1.0 / 0.0
* DOUBLE_EPSILON: the smallest possible difference between two doubles
* FLOAT_EPSILON: the smallest possible difference between two floats

Number elements
----------------
Int, Float and Double are extended to have elements ``.int``, ``.float`` and
``.double``. I found this to be easier when trying to get the compiler to agree
with me.

Additionally, there's an element called ``c<type>`` in Int, Float and Double.
Use this when interfacing with C; I use ``x.n.cint`` all the time.

Number functions
----------------

.. function:: close(x: Double, y: Double) -> Bool

    Sees if two numbers are close or :math:`\left| x - y\right| < 10^{-9}`

ndarray
++++++++++++++++

Class elements
------------

* ``n, Int``. The number of elements.
* ``count, Int = n``
* ``grid, [Double]``. The raw array of elements.


Indexing
------------

.. function:: ndarray[Range] -> ndarray

   Index the array.

   ::

       var x = array(1, 2, 3, 4)
       // true: x[0..<2] ~== array(1, 2)

.. function:: ndarray[ndarray] -> ndarray

   Index the array with truncated doubles.

    ::

        var x = array(1, 2, 3, 4)
        // true: x[array(3, 3.14, 0)] ~== array(4, 4, 1)

.. function:: ndarray[Int] -> Double

   Index the array normally.

    ::

        var x = array(1, 2, 3, 4)
        // true: x[0] == 1

Functions
-----------
.. function:: ndarray.reshape(shape) -> matrix

    *shape* : The size of the 2D matrix.

    Also callable with ``reshape(x, (2, 3))``

    ::

        var x = arange(6).reshape((2,3))
        // true, matlab syntax: x == [0 1 2; 3 4 5]

.. function:: asmatrix([Double]) -> ndarray

    Converts between an array of doubles and an ndarray.

    ::

        var x = [0.0, pi, phi]
        var y = asmatrix(x)

        // true: y ~== array(0, pi, phi)

.. function:: println(x: matrix, prefix:String="matrix([", postfix:String="])", format:String="%.3f", newline:String="\n", printWholeMatrix:Bool=false)


    Prints the contents of an ndarray. ``print`` calls the same function with
    ``newline=""``

.. function:: zeros_like(x:ndarray)

    Makes a bunch of zeros like the input array. Only uses shape right now.

Initing
------------

.. function:: zeros(Int)->ndarray

    Return an array with N elements and filled with zeros

.. function:: ones(Int)->ndarray

    Return an array with N elements and filled with ones

.. function:: arange(min:Int=0, max:Int, x exclusive: Bool=true)->ndarray

    `x` : Should it return an exclusive array? 

    Callable with ``arange(N)`` or ``arange(3, N)`` -- two separate functions.
    Returns ``[min, min+1, ..., max-2, max-1]`` or ``[min, ..., max-1, max]``
    if x true.

    ::

        var x = arange(3) // ~== array(0, 1, 2)
        var y = arrange(3, x:true) // ~== array(0, 1, 2, 3)

.. function:: linspace(min:Double, max:Double, num:Int=50)->ndarray

    Returns an array where each element is seperated by :math:`(\max-\min)/n`

.. function:: array(numbers: Double...) -> ndarray

    Not optimized with Accelerate; doesn't really have to be (only used for
    test cases).

    ::

        var x = array(1, 2, 3, 4, 5, 6) // ~== arange(6)+1

.. function:: repeat(x: ndarray, N:Int, how:String="ndarray") -> ndarray

    Repeat the array :math:`N` times. Repeats either the whole array of
    individual elements.

    ::

        var x = array(0, 1, 2)
        var y = repeat(x, 2) // ~== array(0, 1, 2, 0, 1, 2)
        var z = repeat(x, 2, how:"elements") // ~== array(0, 0, 1, 1, 2, 2)

.. function:: copy(x: ndarray, y:ndarray)

    Copy x into y. Also callable with ``var y = x.copy()``

.. function:: argwhere(idx: ndarray) -> ndarray{

    Finds the non-zero elements of an ndarray.

    ::

        var x = array(1, 2, 3, 4, 5, 6).reshape((2,3))
        var y = argwhere(x < 3)
        assert(y ~== array(0, 1))

Simple math
-------------
.. function:: apply_function(function: Double->Double, x: ndarray) -> ndarray

    Applies the function to every element of the array.

    This is called with sin, cos, tan, sqrt, floor, ceil, round. These are
    unoptimized and should be optimized.

.. function:: apply_function(function: String, x: ndarray) -> ndarray

    Applies the optimized function to every element of the array. As of
    2014-7-20, ``function`` is assumed to be one of 
    
    * ``"abs"``
    * ``"sign"``
    * ``cumsum``
    
   (to see what's optimized, look in ``swix/matrix/oneD-simple-math.swift``)

    Alerts you using ``assert`` if function name is not known.

    Further optimized functions include

    * std, variance, avg
    * rand, randn
    * min, max, sign

.. function:: rand(Int)-> ndarray

    Returns random numbers between 0 and 1

.. function:: randn(N: Int, mean: Double=0, sigma: Double=1, seed:Int=42) -> ndarray

    Returns a normally distribution with the mean and variance.

.. function:: pow(x: matrix, power: Double) -> ndarray
    
    Optimized for power==2. If power is close to 2, it will print a message
    asking if you really meant two.

.. function:: norm(x: ndarray, type:String="l2") -> Double

    Takes the norm of the array. The type can either be l0, l1 or l2 (and it
    will assert(false) if it's not).

    The l0 norm counts non-zero elements.

    The l1 norm performs :math:`l_1 = \sum \left| x_i \right|`

    The l2 norm perform :math:`l_2 = \sqrt{\sum x_i^2}`

    The l1 and l2 norms are optimized through sum and pow. The l0 norm isn't
    but will be through vDSP_vcmprs


Operators
-------------

The operators ``+ - * / % += -= *= /= < > <= >= == !==`` all work element-wise and are
all optimized. They all work similar to Python or C. Note ``!==`` sees where
two arrays are not equal.

``ndarray ^ Double`` calls ``pow(ndarray, Double)``

``==`` and ``!==`` see if every element is `exactly` the same (but they're
implemented in OpenCV, which is why they're included). I recommend using
``abs(x-y) < 1e-9`` instead.

The comparison operators are all implemented through OpenCV and rely on the
array being continuous in memory, which relies on having small input arrays. It
will print (but not assert) if this is not the case.


.. function:: array equality, ~==

    Sees if every element in an array is close because it's incredibly hard to
    be precise with floats. Specifically, it sees if the difference between
    every element in two arrays is less that :math:`10^{-9}`, just like
    ``close``. However, this function is optimized through max, abs, and ``-``.


matrix
++++++++++
Class Elements
-----------
* ``rows, Int`` the number of rows
* ``cols, Int`` the number of columns
* ``n, Int = row*colums`` the number of elements 
* ``count, Int = n`` the number of elements 
* ``shape, (Int, Int) = (rows, columns)`` The shape of the matrix. This
  notation is the same as mathematical journal articles (and matlab).
* ``flat``. The `row-major`_ flat array. Any operation valid for a ndarray is
  valid for this element.

.. _`row-major`: https://en.wikipedia.org/wiki/Row_major

Indexing
----------
.. function:: matrix[Int, Int]->Double

    Indexed like Python (and matlab). The first index corresponds to which row
    and the second corresponds to which column.

    ::

        var x = array("1 2 3; 4 5 6; 7 8 9")
        assert(x[0, 1] == 2)

.. function:: matrix[Range, Range]->matrix

    Like NumPy and our ndarray but for two dimensions.

    ::

        var x = arange(9).reshape((3,3))
        assert(x[0..<2, 0..<2] ~== array(0, 1, 3, 4).reshape((2,2)))
        
.. function:: matrix[ndarray, ndarray]->matrix
    
    Performs the same operation as matrix[Range, Range]

.. function:: matrix[ndarray]->ndarray
    
    Access the matrix as a flat array. Note that it's row-major, not
    column-major meaning the indexing is like C or Python and not like Matlabs.

.. function:: matrix[Range, Int]->ndarray

    Selects one specific column and different rows.

.. function:: matrix[Int, Range]->ndarray

    Selects one specific row and different columns.

.. function:: println(x: matrix2d, prefix:String="matrix([", postfix:String="])", newline:String="\n", format:String="%.3f", printWholeMatrix:Bool=false)

    Prints the contents of the matrix. Again, there's a function called
    ``print`` that calls ``println`` with newline:""

.. function:: zeros_like(matrix)->matrix

    Like zeros_like for ndarrays. Only depends on shape.

.. function:: argwhere(idx: matrix) -> ndarray{

    Finds the non-zero elements of an matrix. Again, row-major order applies.

    ::

        var x = array(1, 2, 3, 4, 5, 6).reshape((2,3))
        var y = argwhere(x < 3)
        assert(y ~== array(0, 1))

.. function:: copy(x: matrix, y: matrix)
    
    Copies x into y. Also callable with ``var y = x.copy()``

Simple math
-------------
.. function:: apply_function(function: ndarray->ndarray, x: matrix)->matrix

    Applies the given function to every element of the array. Called by ``sin, cos, tan, log, abs, sqrt, floor, ceil, round, sign, randn, rand, pow, min, max, norm`` (those function take a matrix and return a matrix).

.. function:: sum(matrix, dim:Int=0)->ndarray

    Performs the sum along the given dimension (through ``dim``). That is, if
    dim==0, all the element in each row will be added up.

    These functions that operate on a whole dimension I need to think about
    more. They're slow right now (native Swift for-loops). I'll probably call C
    to speed them up -- I don't think BLAS/LAPACK does this. Or maybe there's
    another matrix library out there that does this?

Operators
-----------

The operators ``+ - * / += -= *= /= < > <= >= == !==`` call the ndarray
versions of those operators; they work element-wise.

.. function:: Dot product, *!

    Perform the dot product between the lhs and rhs.

.. function:: Solve, !/

    ``A !/ b`` finds the solution to :math:`Ax = b` by calling OpenCV's solve.


Complex Math
-------------------
.. function:: svd(x: matrix) → (matrix, ndarray, matrix)
    
    Performs the SVD on the matrix. Tested against Python for fat, skinny and
    square matrices.

.. function:: inv(x: matrix) -> matrix
    
    Finds the inverse of the matrix, :math:`X^{-1}`

    
.. function:: solve(A:matrix, b:ndarray)->ndarray

    Solve :math:`Ax = b` and returns x. Calls OpenCV's solve.


Machine learning
+++++++++++++++++++

SVM
----

The `support vector machine`_. Implemented through OpenCV.

.. _`support vector machine`: https://en.wikipedia.org/wiki/Support_vector_machine


::

    var svm = SVM()
    var x = reshape(arange(4*2) , (4, 2))
    var y = array(0, 1, 2, 3)

    svm.train(x, targets:y)
    var z = svm.predict(array(2, 3))
    assert(z == y[1])


kNN
----

The `k nearest neighbors`_ algorithm.

.. _`k nearest neighbors`: https://en.wikipedia.org/wiki/K-nearest_neighbors_algorithm

Didn't work with my simple test but I believe it's correct.

::

    var knn = kNearestNeighbors()
    var responses = ones((4,6))
    var targets = arange(4)

    knn.train(responses, targets:targets)
    var result = knn.predict(y, k:3)


Interfacing with C
+++++++++++++++++++

Use ``Int(3).cint`` to pass 3 to a C function; likewise for Float and Double.

.. function:: matrixToPointer(x: ndarray)->UnsafePointer<Double>

    Gets the pointer of a ndarray

.. function:: matrixToPointer(x: [Int])->UnsafePointer<Int>
    
    Gets the pointer of a integer array (useful for indexing)


.. function:: pointerToMatrix(xPC: UnsafePointer<Double>, N: CInt) -> ndarray

    Converts between a C pointer and ndarray

.. function:: pointerTo2DMatrix(xPC: UnsafePointer<Double>, N: CInt, M:CInt) -> matrix

    Converts between a C pointer and matrix

.. function:: address operator, !

    Works for both ndarray and matrix. Calls matrixToPointer


