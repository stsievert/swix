
Overview
===============
This library aims to be an almost exact clone of `Pylab`_ and to integrate the core parts of NumPy/SciPy/some of Matplotlib to provide a Matlab-like interface. The reason this library was developed to provide an easy translatation between complicated signal processing algorithms and mobile apps.

Since this library only aims to provide easy conversion and not easy developement, there are areas that are a bit of a pain. For example, you can't assign ``x[0..<N] = 0``; instead you have to use ``x[0..<N] = zeros(N)`` or think of clever hacks like ``x[0..<N] *= 0``.

This library almost exactly tries to copy the NumPy syntax. While the mathematical functions do this, one notable exception is Python's ``for i in arange(N)``. To get the same result in swix, use ``for i in arange(N).grid``.

If in doubt or getting weird compiler errors, look at the corresponding NumPy docs (I tried to include links) or look at the section on :doc:`bugs` you may find.

Functions
---------

This page only includes functions. All constants are defined in :class:`numbers`.

.. include:: links.rst


numbers
-------------------------
.. autosummary::


.. autosummary::
    numbers_swix.binom
    numbers_swix.close
    numbers_swix.convience_elements
    numbers_swix.deg2rad
    numbers_swix.factorial
    numbers_swix.isNumber
    numbers_swix.operator_slash
    numbers_swix.rad2deg

I/O
-------------------------
.. autosummary::


.. autosummary::
    io_swix.read_binary
    io_swix.read_csv
    io_swix.write_binary
    io_swix.write_csv

vector
-------------------------
.. autosummary::

vector.initing
^^^^^^^^^^^^^^^^^^^^^^^^^
.. autosummary::

    vector.initing.arange
    vector.initing.array
    vector.initing.asarray
    vector.initing.copy
    vector.initing.linspace
    vector.initing.ones
    vector.initing.ones_like
    vector.initing.rand
    vector.initing.randn
    vector.initing.randperm
    vector.initing.seed
    vector.initing.zeros
    vector.initing.zeros_like

vector.helper_functions
^^^^^^^^^^^^^^^^^^^^^^^^^
.. autosummary::

    vector.helper_functions.argmax
    vector.helper_functions.argmin
    vector.helper_functions.argsort
    vector.helper_functions.argwhere
    vector.helper_functions.clip
    vector.helper_functions.concat
    vector.helper_functions.count_nonzero
    vector.helper_functions.cumprod
    vector.helper_functions.delete
    vector.helper_functions.in1d
    vector.helper_functions.intersection
    vector.helper_functions.logical_and
    vector.helper_functions.logical_not
    vector.helper_functions.logical_or
    vector.helper_functions.logical_xor
    vector.helper_functions.norm
    vector.helper_functions.println
    vector.helper_functions.prod
    vector.helper_functions.repeat
    vector.helper_functions.reverse
    vector.helper_functions.shuffle
    vector.helper_functions.sort
    vector.helper_functions.union
    vector.helper_functions.unique

vector.vector
^^^^^^^^^^^^^^^^^^^^^^^^^
.. autosummary::

    vector.vector.copy
    vector.vector.indexing
    vector.vector.max
    vector.vector.mean
    vector.vector.min
    vector.vector.reshape
    vector.vector.reverse
    vector.vector.sort

vector.complex_math
^^^^^^^^^^^^^^^^^^^^^^^^^
.. autosummary::

    vector.complex_math.fft
    vector.complex_math.fftconvolve
    vector.complex_math.ifft

vector.simple_math
^^^^^^^^^^^^^^^^^^^^^^^^^
.. autosummary::

    vector.simple_math.abs
    vector.simple_math.apply_function
    vector.simple_math.ceil
    vector.simple_math.cos
    vector.simple_math.cumsum
    vector.simple_math.exp
    vector.simple_math.exp2
    vector.simple_math.expm1
    vector.simple_math.floor
    vector.simple_math.log
    vector.simple_math.log10
    vector.simple_math.log2
    vector.simple_math.max
    vector.simple_math.mean
    vector.simple_math.min
    vector.simple_math.pow
    vector.simple_math.remainer
    vector.simple_math.round
    vector.simple_math.sign
    vector.simple_math.sin
    vector.simple_math.sqrt
    vector.simple_math.std
    vector.simple_math.sum
    vector.simple_math.tan
    vector.simple_math.variance

vector.operators
^^^^^^^^^^^^^^^^^^^^^^^^^
.. autosummary::

    vector.operators.assignment_operator
    vector.operators.elementwise_operators
    vector.operators.equality
    vector.operators.logical_operators
    vector.operators.pow

matrix
-------------------------
.. autosummary::

matrix.initing
^^^^^^^^^^^^^^^^^^^^^^^^^
.. autosummary::

    matrix.initing.array
    matrix.initing.eye
    matrix.initing.meshgrid
    matrix.initing.ones
    matrix.initing.rand
    matrix.initing.randn
    matrix.initing.reshape
    matrix.initing.zeros
    matrix.initing.zeros_like

matrix.helper_functions
^^^^^^^^^^^^^^^^^^^^^^^^^
.. autosummary::

    matrix.helper_functions.argwhere
    matrix.helper_functions.det
    matrix.helper_functions.diag
    matrix.helper_functions.fliplr
    matrix.helper_functions.flipud
    matrix.helper_functions.kron
    matrix.helper_functions.norm
    matrix.helper_functions.ones_like
    matrix.helper_functions.println
    matrix.helper_functions.rot90
    matrix.helper_functions.transpose

matrix.matrix
^^^^^^^^^^^^^^^^^^^^^^^^^
.. autosummary::

    matrix.matrix.copy
    matrix.matrix.dot
    matrix.matrix.index
    matrix.matrix.index_diag
    matrix.matrix.index_flat
    matrix.matrix.tril
    matrix.matrix.triu

matrix.complex_math
^^^^^^^^^^^^^^^^^^^^^^^^^
.. autosummary::

    matrix.complex_math.dot
    matrix.complex_math.eig
    matrix.complex_math.inv
    matrix.complex_math.pinv
    matrix.complex_math.rank
    matrix.complex_math.solve
    matrix.complex_math.svd

matrix.images
^^^^^^^^^^^^^^^^^^^^^^^^^
.. autosummary::

    matrix.images.RGBAToUIImage
    matrix.images.UIImageToRGBAImage
    matrix.images.imshow
    matrix.images.resizeImage
    matrix.images.rgb2hsv
    matrix.images.rgb2hsv_vplane
    matrix.images.savefig

matrix.simple_math
^^^^^^^^^^^^^^^^^^^^^^^^^
.. autosummary::

    matrix.simple_math.abs
    matrix.simple_math.ceil
    matrix.simple_math.cos
    matrix.simple_math.floor
    matrix.simple_math.log
    matrix.simple_math.mean
    matrix.simple_math.pow
    matrix.simple_math.prod
    matrix.simple_math.round
    matrix.simple_math.sign
    matrix.simple_math.sin
    matrix.simple_math.sqrt
    matrix.simple_math.sum
    matrix.simple_math.tan

matrix.operators
^^^^^^^^^^^^^^^^^^^^^^^^^
.. autosummary::

    matrix.operators.assignment_operator
    matrix.operators.element_operators
    matrix.operators.equality
    matrix.operators.solve

machine learning
-------------------------
.. autosummary::

machine_learning.SVM
^^^^^^^^^^^^^^^^^^^^^^^^^
.. autosummary::

    machine_learning.SVM.predict
    machine_learning.SVM.setParams
    machine_learning.SVM.train

machine_learning.kNN
^^^^^^^^^^^^^^^^^^^^^^^^^
.. autosummary::

    machine_learning.kNN.predict
    machine_learning.kNN.train

objc
-------------------------
.. autosummary::


.. autosummary::
    objc.matrixToPointer
