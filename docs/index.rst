.. swix documentation master file, created by
   sphinx-quickstart on Thu Jul 17 20:15:30 2014.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to swix's documentation!
================================

The goal of swix is to ease the Python/Matlab-C conversion. It does not aim to
allow easy development, meaning that there are still areas where the ease could
be improved (e.g., ``x[0..<2] = zeros(2)``). Regardless, this library provides
almost a one-to-one conversion between Matlab and Swift.

This library wraps `OpenCV`_ and through this integrates the ObjC, ObjC++, C++,
C and Swift languages.

This library is optimized through the `Accelerate framework`_ in some cases.
Notable areas that need to be optimized and not depend on native Swift
for-loops are

* element-wise division and multiplication, for ``Double * matrix``, ``matrix *
  matrix`` and ``matrix * Double`` including ``> < <= >= %``
* argwhere
* basically all simple math operators (sin, abs, cos, round, randn, cumsum, norm, variance...)


Table of Contents
-----------------

.. toctree::
   :maxdepth: 3

   installation
   numbers
   matrix
   machine_learning
   bugs
   full_docs


.. _OpenCV: http://opencv.org
.. _Accelerate framework: https://developer.apple.com/library/prerelease/mac/documentation/Accelerate/Reference/AccelerateFWRef/_index.html#//apple_ref/doc/uid/TP40009465


..
    Indices and tables
    ==================

    * :ref:`genindex`
    * :ref:`modindex`
    * :ref:`search`


