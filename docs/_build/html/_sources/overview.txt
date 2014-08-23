
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
    numbers.binom
    numbers.close
    numbers.convience_elements
    numbers.deg2rad
    numbers.factorial
    numbers.isNumber
    numbers.operator_slash
    numbers.rad2deg

ndarray
-------------------------
.. autosummary::

ndarray.initing
^^^^^^^^^^^^^^^^^^^^^^^^^
.. autosummary::

    ndarray.initing.arange
    ndarray.initing.array
    ndarray.initing.asarray
    ndarray.initing.copy
    ndarray.initing.linspace
    ndarray.initing.ones
    ndarray.initing.ones_like
    ndarray.initing.rand
    ndarray.initing.randn
    ndarray.initing.randperm
    ndarray.initing.read_csv
    ndarray.initing.zeros
    ndarray.initing.zeros_like

ndarray.helper_functions
^^^^^^^^^^^^^^^^^^^^^^^^^
.. autosummary::

    ndarray.helper_functions.argmax
    ndarray.helper_functions.argmin
    ndarray.helper_functions.argsort
    ndarray.helper_functions.argwhere
    ndarray.helper_functions.clip
    ndarray.helper_functions.concat
    ndarray.helper_functions.count_nonzero
    ndarray.helper_functions.cumprod
    ndarray.helper_functions.delete
    ndarray.helper_functions.in1d
    ndarray.helper_functions.intersection
    ndarray.helper_functions.logical_and
    ndarray.helper_functions.logical_not
    ndarray.helper_functions.logical_or
    ndarray.helper_functions.logical_xor
    ndarray.helper_functions.norm
    ndarray.helper_functions.println
    ndarray.helper_functions.prod
    ndarray.helper_functions.repeat
    ndarray.helper_functions.reverse
    ndarray.helper_functions.shuffle
    ndarray.helper_functions.sort
    ndarray.helper_functions.union
    ndarray.helper_functions.unique
    ndarray.helper_functions.write_csv

ndarray.ndarray
^^^^^^^^^^^^^^^^^^^^^^^^^
.. autosummary::

    ndarray.ndarray.copy
    ndarray.ndarray.indexing
    ndarray.ndarray.max
    ndarray.ndarray.mean
    ndarray.ndarray.min
    ndarray.ndarray.reshape
    ndarray.ndarray.reverse
    ndarray.ndarray.sort

ndarray.complex_math
^^^^^^^^^^^^^^^^^^^^^^^^^
.. autosummary::

    ndarray.complex_math.fft
    ndarray.complex_math.fftconvolve
    ndarray.complex_math.ifft

ndarray.simple_math
^^^^^^^^^^^^^^^^^^^^^^^^^
.. autosummary::

    ndarray.simple_math.abs
    ndarray.simple_math.apply_function
    ndarray.simple_math.ceil
    ndarray.simple_math.cos
    ndarray.simple_math.cumsum
    ndarray.simple_math.exp
    ndarray.simple_math.exp2
    ndarray.simple_math.expm1
    ndarray.simple_math.floor
    ndarray.simple_math.log
    ndarray.simple_math.log10
    ndarray.simple_math.log2
    ndarray.simple_math.max
    ndarray.simple_math.mean
    ndarray.simple_math.min
    ndarray.simple_math.pow
    ndarray.simple_math.remainer
    ndarray.simple_math.round
    ndarray.simple_math.sign
    ndarray.simple_math.sin
    ndarray.simple_math.sqrt
    ndarray.simple_math.std
    ndarray.simple_math.sum
    ndarray.simple_math.tan
    ndarray.simple_math.variance

ndarray.operators
^^^^^^^^^^^^^^^^^^^^^^^^^
.. autosummary::

    ndarray.operators.assignment_operator
    ndarray.operators.elementwise_operators
    ndarray.operators.equality
    ndarray.operators.logical_operators
    ndarray.operators.pow

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
    matrix.initing.read_csv
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
    matrix.helper_functions.write_csv

matrix.matrix
^^^^^^^^^^^^^^^^^^^^^^^^^
.. autosummary::

    matrix.matrix.copy
    matrix.matrix.dot
    matrix.matrix.index
    matrix.matrix.index_diag
    matrix.matrix.index_flat

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
    matrix.operators.dot
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
