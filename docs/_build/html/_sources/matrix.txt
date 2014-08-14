.. include:: links.rst

Matrices
==========
The full docs are below but I'll touch on some highlights:

* depends on ndarray. Access the `row-major`_ indexed flat array via ``matrix.flat``. This means that any function that takes a flat array can be applied to a matrix.
* Implements some complex math: solve, dot, svd, and inv
* has some nice functions for image, including functions to show and save images.

.. note:: ``*`` is an element-wise multiplication. ``*!`` is used for a dot product or matrix multiplication. Not like matlab!
.. note:: The function to show/save images rely on Python, PYTHON_PATH and the pylab stack.

Docs
++++++++++

.. automodule:: matrix
    :members:

matrix class
---------------
.. autoclass:: matrix
    :members:

initing
---------
This is a file, not an actual class.

.. autoclass:: initing
    :members:


.. _`dot product`: https://en.wikipedia.org/wiki/Dot_product

helper functions
------------------
.. autoclass:: helper_functions
    :members:

Operators
-----------
This is a file, not an actual class.

.. autoclass:: operators
    :members:

Simple Math
-------------
This is a file, not an actual class.

.. autoclass:: simple_math
    :members:

Complex math
-------------
This is a file, not an actual class.

.. autoclass:: complex_math
    :members:

Images
--------
This is a file, not an actual class.

.. autoclass:: images
    :members:



.. _inverse: http://en.wikipedia.org/wiki/Matrix_inverse
.. _Frobenius norm: http://en.wikipedia.org/wiki/Matrix_norm#Frobenius_norm
.. _FFT/IFFT: https://en.wikipedia.org/wiki/Fourier_transform
.. _the @ symbol: http://legacy.python.org/dev/peps/pep-0465/#implementation-details
.. _NumPy's meshgrid: http://docs.scipy.org/doc/numpy/reference/generated/numpy.meshgrid.html
.. _compare: http://docs.opencv.org/modules/core/doc/operations_on_arrays.html#compare
.. _row major order: https://en.wikipedia.org/wiki/Row-major_order
