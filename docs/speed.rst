
Speed
========

Very generally, this library is about as fast as Python and Matlab, at least at
in beta5. Going down to iOS is approximately 10x slower.

All functions are `on Github <https://github.com/scottsievert/swix/blob/master/swix/speed.py>`_ for your browsing.

.. note:: All tests were run on my machine, a 2012 macbook air with an SSD and 8GB RAM

Times
-----------------

Time in seconds on my Macbook Air:

+----------------+--------+--------+--------------+
| Function       | -Onone | -O     | -Ounchecked  |
+----------------+--------+--------+--------------+
| pe1            | 2.151  | 0.1107 | 0.1112       |
+----------------+--------+--------+--------------+
| pe10           | 6.707  | 0.5781 | 0.5537       |
+----------------+--------+--------+--------------+
| pi_approx      | 2.159  | 0.0991 | 0.1032       |
+----------------+--------+--------+--------------+
| soft_threshold | 0.052  | 0.0015 | 0.0015       |
+----------------+--------+--------+--------------+

And we should also compare against NumPy/Matlab!

+----------------+-------+--------+--------+------------------+-------------------+
| Function       | NumPy | Matlab | swix   | **swix / numpy** | **swix / matlab** |
+----------------+-------+--------+--------+------------------+-------------------+
| pe1            | 0.170 | 0.142  | 0.1107 | 0.65             | 0.78              |
+----------------+-------+--------+--------+------------------+-------------------+
| pe10           | 2.04  | 0.514  | 0.5871 | 0.29             | 1.14              |
+----------------+-------+--------+--------+------------------+-------------------+
| pi_approx      | 0.046 | 0.011  | 0.0991 | 2.15             | 9.01              |
+----------------+-------+--------+--------+------------------+-------------------+
| soft_threshold | 0.081 | 0.024  | 0.0015 | 0.019            | 0.062             |
+----------------+-------+--------+--------+------------------+-------------------+

Comments
----------
* I'm surprised about the soft thresholding result. 
* pi_approx depends on indexing at select locations; this needs to be optimized.

