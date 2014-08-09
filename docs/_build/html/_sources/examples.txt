
Examples
=============


Making a ring
-----------------
.. code-block:: python

    let N = 10
    var i = linspace(-1, 1)
    var (x, y) = meshgrid(x, y)
    var z = x^2 + y^2
    var j = argwhere(z < 0.5)
    z[i] = 0


Soft thresholding
--------------------
.. code-block:: python
    
    let N = 10
    var j = linspace(-1, 1)
    var (x, y) = meshgrid(j, j)
    var z = x^2 + y^2
    var i = abs(z) < 0.5
    z[argwhere(i)] = 0
    z[argwhere(1-i)] -= 0.5



