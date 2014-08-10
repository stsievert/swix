
Speed
========

Very generally, this library is about as fast as Python and Matlab, at least at
in beta5. Going down to iOS is approximately 10x slower.

.. note:: All tests were run on my machine, a 2012 macbook air with an SSD and 8GB RAM

swix times (s)
-----------------

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


Comparison times:
-------------------

+----------------+-----------------+-------------+-------------------------+
| Function       | Python time (s) | swix -Ofast | Relative (swix / numpy) |
+----------------+-----------------+-------------+-------------------------+
| pe1            | 0.170           | 0.140       | 0.82                    |
+----------------+-----------------+-------------+-------------------------+
| pe10           | 2.04            | 0.585       | 0.34                    |
+----------------+-----------------+-------------+-------------------------+
| pi_approx      | 0.046           | 0.258       | 5.61                    |
+----------------+-----------------+-------------+-------------------------+
| soft_threshold | 0.081           | 0.002       | 0.02                    |
+----------------+-----------------+-------------+-------------------------+

Notes
------
* project euler 1 was very simple
* project euler 10 depended on a for loop in Python -- slow.
* I'm surprised about the soft thresholding result. I'm guessing I had some
  simple speed optimization to make.

