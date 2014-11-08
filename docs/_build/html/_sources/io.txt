.. include:: links.rst

I/O
=========

.. warning:: These functions have only been tested on OSX.

Functions
++++++++++++++
.. automodule:: io_swix
    :members:

Binary example; optimized
+++++++++++++++++++++++++++

>>> var x = arange(9).reshape((3,3))
>>> write_binary(x, filename:"x.npy")
>>> # 
>>> # be sure to include what type the variable is!
>>> var y:matrix = read_binary("x.npy")
>>> var z:ndarray = read_binary("x.npy")

CSV example; unoptimized
++++++++++++++++++++++++++

>>> var x = arange(9).reshape((3,3))
>>> write_csv(x, filename:"x.csv")
>>> #
>>> # be sure to include what type the variable is!
>>> var y:matrix = read_csv("x.csv")
>>> var z:ndarray = read_csv("x.csv")
