
Machine learning
================

Again, examples. They're more useful.

`SVD`_ 
----------
::

    var svm = SVM()

    // our responses. 
    var responses = reshape(ones(2*3), (2, 3))

    // OpenCV can fail for too similar inputs (probably synthetic)
    for i in 0..3{
        responses[1][i] = -1
    }

    // our targets.
    var targets = ones(2); targets[1] = -1

    // train with responses
    svm.train(responses, targets: targets)

    // predict
    var y = -1 * ones(3) // must have same size!
    var result = svm.predict(y)

`kNN`_
-----------

I haven't and don't have a use case for this; my simple test failed although I
believe it's correct.

::

    var knn = kNearestNeighbors()
    var responses = ones((4,6))
    var targets = arange(4)

    knn.train(responses, targets:targets)
    var result = knn.predict(y, k:3)

`SVD`_ or `PCA`_
-------------------
::

    var x = ones((2,4))
    var (u, s, v) = svd(x)
    x = ones((4,2))
    (u, s, v) = svd(x)
    println("    var (u, s, v) = svd(x) works. matches python exactly (checked by hand)")

.. _PCA: https://en.wikipedia.org/wiki/Principal_component_analysis
.. _SVM: https://en.wikipedia.org/wiki/Support_vector_machine
.. _kNN: https://en.wikipedia.org/wiki/K-nearest_neighbor_algorithm
.. _SVD: https://en.wikipedia.org/wiki/Singular_value_decomposition
