Examples
=============

Soft thresholding
----------------------

Making a cone with a flat bottom.

.. code-block:: scala
    
    var N = 10
    var j = linspace(-1, 1)
    var (x, y) = meshgrid(j, j)
    var z = x^2 + y^2
    var i = abs(z) < 0.5
    z[argwhere(i)] = 0
    z[argwhere(1-i)] -= 0.5

Project Euler #1
------------------

`Project Euler #1 <http://projecteuler.net/problem=1>`_

.. code-block:: scala

    var N = 1e3
    var x = arange(N)
    // seeing where that modulo is 0
    var i = argwhere((abs(x%3) < 1e-9) || (abs(x%5) < 1e-9))
    println(sum(x[i]))
    // prints 233168.0, the correct answer

Project Euler #10
------------------

`Project Euler #10 <http://projecteuler.net/problem=10>`_

.. code-block:: scala

    // find all primes
    var N = 2e6.int
    var primes = arange(N)
    for i in 2..<sqrt(N).int{
        var max:Int = (N/i)
        var j = arange(2, max) * i.double
        primes[j] *= 0.0
    }
    println(sum(primes))
    // prints the correct answer

Pi approximation
--------------------

Doing a pretty bad job of approximating :math:`\pi`.

.. code-block:: scala

    var N = 1e3
    var k = arange(N)
    var pi_approx = 1 / (2*k + 1)
    pi_approx[2*k[arange(N/2)]+1] *= -1
    println(4 * pi_approx)
    // prints 3.14059265383979

Interfacing with C
--------------------

I hope you never have to look at this, but here's a sample calling of
`cblas_dcopy <https://developer.apple.com/library/mac/documentation/Accelerate/Reference/BLAS_Ref/Reference/reference.html#//apple_ref/c/func/cblas_dcopy>`_ 

.. code-block:: scala

    cblas_dcopy(self.n.cint, !self, 1.cint, !y, 1.cint)

and `vDSP_vmulD <apple.com/library/ios/documentation/Accelerate/Reference/vDSPRef/Reference/reference.html#//apple_ref/c/func/vDSP_vmulD>`_

.. code-block:: scala

    vDSP_vmulD(!lhs, 1, !rhs, 1, !result, 1, lhs.n.length)
