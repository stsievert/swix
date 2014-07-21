
Matrices
==========
This library contains two types matrix types: a 1D matrix and a 2D matrix. Both
are indexable through several methods, shown below:

* ``ndarray[0] = 1`` for a single element
* ``ndarray[0..<5] = ones(5)`` for a several components.
* ``ndarray[array(1, 2, 3, 4, 5)] = array(5)`` also works. Note that floating
  point values are truncated.

Similar syntax works for 2D matrices. You can access elements through ``x[Int,
Int] = Double``, ``x[Int, Range] = ndarray``, ``x[Range, Int] = ndarray``,
``x[Range, Range] = matrix``, ``x[ndarray, ndarray] = matrix`` and
``x[ndarray] = ndarray``. The last entry, ``x[ndarray]`` accesses the matrix by
accessing the flat elements.


ndarray
---------------

This stands for ":math:`N` dimensional array". It's a mix of programming
language and math language; in math, this is called a vector.

* ``n`` : number of elements in the array.
* ``count`` : number of elements
* ``grid`` : the raw `[Double]`. Hopefully you never have to touch this.

matrix
----------------
* ``rows, columns`` : the number of rows and columns
* ``shape == (self.rows, self.columns)``
* ``n == rows * columns``
* ``flat`` : of type ndarray, contains the elements in  `row major order`_. It's
  helpful to use ``x.flat`` for any function that can be used on a 2D matrix
  (e.g., sum over all the elements)


Simple mathematical functions
----------------------
* a host of functions that don't depend on any other element (in
  ``swix/oneD/oneD-simple-math.swift``. If you have your own function, just use
  ``apply_function(func, x)`` (and use ``x.flat`` for 2D matrices).
* transpose. Performs :math:`X^T`
* argwhere. Detects locations of element that are precisely 1. Can be optimized
  with `compare`_
* inv. Finds the `inverse`_ of a square matrix.
* solve. Finds the solution to :math:`Ax=b` for matrices :math:`A` that are
  skinny, fat or square (to be implemented as of 2014-7-17; will be implemented
  very shortly). To be similar to Matlab's ``\`` operator (and that operator
  will be integrated shortly).

.. _inverse: http://en.wikipedia.org/wiki/Matrix_inverse

Initing
--------
* ``ones, zeros`` : accepts ``Int`` or ``(Int, Int)``
* ``diag, eye`` : returns the diagonal and makes an identity matrix of input
  size ``N``.
* ``array(1, 2, 3...), array("1 2 3; 4 5 6; 7 8 9)`` : returns an array with
  the numbers. In the 2D case, the string isn't parsed right, especially with
  two digit numbers or negative numbers; beware!
* ``linspace`` : makes an `exclusive` linear range; for example, ``linspace(0,
  1, num: 2) ~== [0, 0.5]``.
* ``meshgrid`` : Similar to `NumPy's meshgrid`_. ``meshgrid`` depends on
  OpenCV's repeat and may fail for large matrices.
* ``repeat(x: ndarray, N:int, how:String="ndarray")`` : Repeats a ndarray N times.
  If ``how=="elements"``, it repeats the ndarray ``[0, 1, 2]`` as ``[0..., 1...,
  2...]`` instead of ``[0, 1, 2, 0, 1, 2, ...``.

Operators
-----------
* ``+ - * / < > <= >= += *= -= /=`` : Element-wise addition. ``+ -``. Takes  ``matrix + matrix``, 
  ``matrix + Double`` or ``Double + matrix`` 
* ``< > <= >=`` : Element-wise comparison. Return an array of 0's and 1's,
  useful with ``argwhere``.
* ``matrix % double`` : Element-wise modulo.
* ``~==`` : Sees if two arrays are approximately equal (threshold: 1e-9). I
  should create a function ``approx_equal(x, y)``.
* ``matrix ^ power`` takes the power of each element. (``**`` and ``.^`` didn't
  compile)
* ``*!`` : The dot product operator. Extra important multiplication since `the @
  symbol`_ to be used in Python 3.5 can't be used.
* ``!/`` : Similar to Matlab's ``\`` operator (but ``\`` couldn't be used so
  "extra important division" used).

Complex math
--------------
I'll show examples: for these relatively simple functions, they're much more valuable.

* `FFT/IFFT`_

::

    var x = ones(15)
    var (y_real, y_imag) = ifft(x)
    assert(x ~== ifft(y_real, y_imag)) // true


.. _Frobenius norm: http://en.wikipedia.org/wiki/Matrix_norm#Frobenius_norm
.. _FFT/IFFT: https://en.wikipedia.org/wiki/Fourier_transform
.. _the @ symbol: http://legacy.python.org/dev/peps/pep-0465/#implementation-details
.. _NumPy's meshgrid: http://docs.scipy.org/doc/numpy/reference/generated/numpy.meshgrid.html
.. _compare: http://docs.opencv.org/modules/core/doc/operations_on_arrays.html#compare
.. _row major order: https://en.wikipedia.org/wiki/Row-major_order
