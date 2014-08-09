.. include:: links.rst

Machine learning
================
This library integrates `OpenCV`_. What I needed was implemented and not much more; if you want something you'll probably have to implement it yourself using OpenCV.

.. _`OpenCV`: http://opencv.org


Docs
+++++++++++++++++++
This is a file that describes classes.

.. automodule:: machine_learning
.. autoclass:: SVM
    :members:
.. autoclass:: kNearestNeighbors
    :members:


Examples
++++++++++++++
`SVM`_ 
----------
.. code-block:: python

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

.. code-block:: python

    var knn = kNearestNeighbors()
    var responses = ones((4,6))
    var targets = arange(4)

    knn.train(responses, targets:targets)
    var result = knn.predict(y, k:3)

`SVD`_ or `PCA`_
-------------------
.. code-block:: python

    var x = ones((2,4))
    var (u, s, v) = svd(x)
    x = ones((4,2))
    (u, s, v) = svd(x)
    println("    var (u, s, v) = svd(x) works. matches python exactly (checked by hand)")

.. code-block:: python

    var x_train:matrix = read_csv("python_testing/csvs/x_train.csv")
    var y_train:ndarray = read_csv("python_testing/csvs/y_train.csv")

    var x_test:matrix = read_csv("python_testing/csvs/x_test.csv")

    var svm = SVM()
    svm.train(x_train, y_train)
    var yhat = svm.predict(x_test)

    // how accurate are we?
    var y_test:ndarray = read_csv("python_testing/csvs/y_test.csv")
    var percent_correct:Double = argwhere(abs(y_test - yhat) < 0.5).n / yhat.n
    println(percent_correct) // about 94% accurate


.. _PCA: https://en.wikipedia.org/wiki/Principal_component_analysis
.. _SVM: https://en.wikipedia.org/wiki/Support_vector_machine
.. _kNN: https://en.wikipedia.org/wiki/K-nearest_neighbor_algorithm
.. _SVD: https://en.wikipedia.org/wiki/Singular_value_decomposition
