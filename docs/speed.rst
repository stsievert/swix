
Speed
========

Very generally, this library is about as fast as Python and Matlab, at least at
in beta5. Going down to iOS is approximately 10x slower.

All functions are `on Github <https://github.com/scottsievert/swix/blob/master/swix/speed.py>`_ for your browsing.

.. note:: All tests were run on my machine, a 2012 macbook air with an SSD and 8GB RAM

swix
-----------------

Time in seconds on my Macbook Air:

+----------------+--------+-------+-------------+
| Function       | -Onone | -O    | -Ounchecked |
+----------------+--------+-------+-------------+
| pe1            | 2.151  | 0.140 | 0.116       |
+----------------+--------+-------+-------------+
| pe10           | 6.640  | 0.585 | 0.560       |
+----------------+--------+-------+-------------+
| pi_approx      | 6.188  | 0.258 | 0.258       |
+----------------+--------+-------+-------------+
| soft_threshold | 0.051  | 0.002 | 0.002       |
+----------------+--------+-------+-------------+


Comparison
-------------------

Time in seconds on my Macbook Air:

+----------------+-------+--------+-------+------------------+-------------------+
| Function       | NumPy | Matlab | swix  | **swix / numpy** | **swix / matlab** |
+----------------+-------+--------+-------+------------------+-------------------+
| pe1            | 0.170 | 0.142  | 0.116 | 0.68             | 0.82              |
+----------------+-------+--------+-------+------------------+-------------------+
| pe10           | 2.04  | 0.514  | 0.560 | 0.27             | 1.08              |
+----------------+-------+--------+-------+------------------+-------------------+
| pi_approx      | 0.046 | 0.011  | 0.258 | 5.61             | 23.45             |
+----------------+-------+--------+-------+------------------+-------------------+
| soft_threshold | 0.081 | 0.024  | 0.002 | 0.02             | 0.08              |
+----------------+-------+--------+-------+------------------+-------------------+

Comments
----------
* I'm surprised about the soft thresholding result. 
* pi_approx depends on indexing at select locations; this needs to be optimized.

