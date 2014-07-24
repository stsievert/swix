Bugs
========
* operator associativity and precedence doesn't always work (for example, 
  ``x *! inv(x) ~== eye(N)``); it this issue pops up, fix it with some parens: ``(x *! y) ~== eye(N)``.
* This library depends on OpenCV's memory being continuous. It does check
   and will give nonsense output. Indexing (``x[0..<2, 0..<2]``), machine
   learning functions (SVM, kNN), ``solve`` and comparison (``< > >= <=``) all depend on
   this.
* The ``~==`` operator only verifies if entire arrays are equal; use
  ``argwhere(abs(x-y) < 1e-9)`` to see where the individual entries are equal.


Beta bugs
---------------
For some reason Xcode can't link to the Accelerate framework from the iOS
simulator, meaning that swix applications only run on physical devices. It
gives errors like "unresolved identifier vDSP_vmulD not found"


Matlab and swix differences
---------------------------
* ``x[array(1, 2, 3)] = 1`` and ``x[array(1, 2), array(1, 2)] = 1`` does not work; use ``ones(3)`` and ``ones((2,2))`` instead.
* Swix follow's NumPy's footprints, meaning if ``(u, s, v) = svd(x)`` then ``transpose(v_matlab) == v_swix == v_numpy``. Additionally, ``s`` is a one dimensional matrix (again like NumPy), not a 2D matrix with only the diagonal non-zero.
* When printing, swix does not check bounds (as of 2014-7-17). e.g., ``var x = zeros(2); println(x[0..<4])`` will print ``matrix([0, 0, <junk>, <junk>])``
* ``argwhere`` is the equivalent of Matlab's ``find``. It finds the locations where the input array is 1 (and Matlab finds locations of the *non-zero* entries).
