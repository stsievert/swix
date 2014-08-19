.. swix documentation master file, created by
   sphinx-quickstart on Thu Jul 17 20:15:30 2014.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

`Swift Matrix and Machine Learning Library`_
=============================================

.. _`Swift Matrix and Machine Learning Library`: https://github.com/scottsievert/swix

Apple's Swift is a high level language that's `asking` for some numerical
library to perform computation `fast` or at the very least `easily`. A way to
have iOS run high-level code similar to Python or Matlab is something I've been
waiting for, and am incredibly excited to see the results. This will make
porting complex signal processing algorithms to C much easier. Porting from
Python/MATLAB to C was (and is) a pain in the butt, and this library aims to
make the conversion between a Python/Matlab algorithm and a mobile app
`simple`.

Currently, the **Sw**\ ift Matr\ **ix** Library or **swix** gives you

* operators (+, etc) and various functions (sin, etc) that operate on entire arrays
* easy initializers for 1D and 2D arrays
* dot product, matrix inversion, eigenvalues, etc
* machine learning algorithms (SVM, kNN, SVD/PCA, more to come)
* speed optimizations
* one dimensional Fourier transforms

In most cases, this library calls the `Accelerate framework`_ or `OpenCV`_. I optimized what I needed to, meaning all operators and select mathematical functions are fast while the functions I didn't need are slow. If you want to speed up some function or add add another feature in those libraries, feel free to submit a pull request `on Github`_ (preferred!) or contact me at `@stsievert`_ or `sieve121@umn.edu`_. Oh, and if you use this project I'd love to hear about it!

.. _`on Github`: https://github.com/scottsievert/swix

When I was crafting this library, I primarily followed the footsteps and
example set by NumPy. For the more complex mathematical functions (e.g., SVD) I
tested it against NumPy. Matlab, at least for the SVD, returns slightly
different output.

Additionally, I followed NumPy's syntax whenever possible. For example, NumPy
and Matlab differ in their initializer called ``ones`` by ``ones((M,N))`` and 
``ones(M,N)`` respectively. If in doubt or getting weird compiler bugs, look at `NumPy for
Matlab users`_ or the section on `possible bugs`_.


As an example, here's some Objective-C sample code that integrates the `Accelerate framework`_:

.. _`OpenCV`: http://opencv.org
.. _`Accelerate framework`: https://developer.apple.com/library/prerelease/mac/documentation/Accelerate/Reference/AccelerateFWRef/_index.html#//apple_ref/doc/uid/TP40009465
.. _`@stsievert`: https://twitter.com/stsievert
.. _`sieve121@umn.edu`: mailto:sieve121@umn.edu
.. _`NumPy for Matlab users`: http://wiki.scipy.org/NumPy_for_Matlab_Users
.. _`possible bugs`: http://scottsievert.github.io/swix/bugs.html

.. code-block:: c

    void copy(double* x, double* y, int N){
        cblas_dcopy(N, x, 1, y, 1);
    }
    void add_two_vectors(double * x, double * y, double * result, int N){
        copy(y, result, N);
        cblas_daxpy(N, 1.0, x, 1, result, 1);
    }
    void add_scalar(double x, double * y, double * result, int N){
        vDSP_vsaddD(y, 1, &x, result, 1, N)
    }
    void multiply_two_vectors(double * x, double * y, double * result, int N){
        vDSP_vmulD(x, 1, y, 1, result, 1, N);
    }
    void set_value(double value, double * x, int N){
        catlas_dset(N, value, x, 1);
    }
    void main(){
        int N = 10;
        double * x = (double *)malloc(sizeof(double) * N);
        double * y = (double *)malloc(sizeof(double) * N);
        double * temp = (double *)malloc(sizeof(double) * N);
        double * result = (double *)malloc(sizeof(double) * N);

        set_value(3.142, x, N);
        set_value(1.618, y, N);
        add_two_vectors(x, y, temp, N);
        add_scalar(4, temp, temp, N);
        multiply_two_vectors(x, temp, result, N);
    }

The equivalent Swift syntax with this library?

.. code-block:: scala

    var N = 10
    var x = ones(N) * pi
    var y = ones(N) * phi
    var result = (x+y+4)*x

Looking at the speed results in :doc:`speed` we find that Swift is roughly
equal with Python/Matlab with this library.


.. note:: These docs call files classes. ie, when you see ``matrix.complex_math.<function>``, it's in the file ``swix/matrix/complex-math.swift``. The only exceptions are the classes ``ndarray`` and ``matrix``.

.. note:: There is a `mobile friendly`_ version of these docs that is out of date.

.. note:: These docs use ``np`` for NumPy, ``mpl`` for ``matplotlib`` and ``cv`` for OpenCV

.. note:: If a variable has the same name as a function included in swix you will get compile errors. I'll wait to resolve this until Swift has good package handling.


Table of Contents
-----------------
.. toctree::
   :maxdepth: 1

   installation
   overview
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

.. _`mobile friendly`: http://swix.readthedocs.org/
.. _`another version`: http://scottsievert.github.io/swix/





