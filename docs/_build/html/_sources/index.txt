.. swix documentation master file, created by
   sphinx-quickstart on Thu Jul 17 20:15:30 2014.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to swix's documentation!
================================
The explicit goal of swix is to allow easy *conversion* (and not easy
developement) between a complicated signal processing algorithm and a mobile
app. Converting from Python/Matlab to C was (and is) a pain. I would certainly
like to see more mobile apps and hope this will help.

This function relies on NumPy and implements the most basic usage. If in doubt
about a function, look at NumPy's docs for a function of the same name; I tried
to include links.

This library is optimized through the `Accelerate framework`_ in most cases.
All operations and the important operations (well, the ones I used) are
optimized through this framework. And luckily, examples exist in swix and the
docs on how to call C functions.

Speed results can be seen in :doc:`speed`. We see similar performance to Python/Matlab on MacOSX and a 10x speed drop on iOS. Still, not bad for an underpowered mobile device!

Examples are perhaps the most useful aspect of documentation, so I've included
some examples in :doc:`examples`

.. note:: These docs call files classes. ie, when you see ``matrix.complex_math.<function>``, it's in the file ``swix/matrix/complex-math.swift``. The only exceptions are the classes ``ndarray`` and ``matrix``.

.. note:: There is a `mobile friendly`_ version of these docs that is out of date.

.. note:: These docs use ``np`` for NumPy and ``mpl`` for ``matplotlib``, both Python modules.


.. _`mobile friendly`: http://swix.readthedocs.org/
.. _`another version`: http://scottsievert.github.io/swix/

Table of Contents
-----------------
.. toctree::
   :maxdepth: 2

   installation
   numbers
   ndarray
   matrix
   machine_learning
   c
   bugs
   examples
   speed


* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`

.. _OpenCV: http://opencv.org
.. _Accelerate framework: https://developer.apple.com/library/prerelease/mac/documentation/Accelerate/Reference/AccelerateFWRef/_index.html#//apple_ref/doc/uid/TP40009465



