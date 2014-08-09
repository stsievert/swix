
Array
=============

This stands for ":math:`N` dimensional array". It's a mix of programming
language and math language; in math, this is called a vector.

The full docs can be found below but I'll touch on some highlights:

* operators. All arithmetic operators and a host of comparison operators work element-wise
* easy initializers (ones, zeros, zeros_like, linspace, etc)
* simple math. Math that applies to each element.
* nice indexing, including accessing multiple elements at once (goodbye for loops!).

.. note:: ``*`` is an element-wise multiplication. ``*!`` is used for a dot product or matrix multiplication. Not like matlab!

.. include:: links.rst

Docs
++++++++
Found in ``swix/ndarray/``


.. automodule:: ndarray
   :members:

ndarray class
----------------
Yes, an actual class (or struct).

.. autoclass:: ndarray
   :members:

initing
-----------
This is a file, not an actual class.

.. autoclass:: initing
   :members:

operators
------------
This is a file, not an actual class.

.. autoclass:: operators
    :members:

simple math
---------------------
This is a file, not an actual class.

.. autoclass:: simple_math
    :members:

complex math
---------------------
This is a file, not an actual class.

.. autoclass:: complex_math
    :members:
