.. swix documentation master file, created by
   sphinx-quickstart on Thu Jul 17 20:15:30 2014.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Numbers and constants
================================

Swix defines several convince constants including π (or pi), φ (or phi), e, inf, as well as the
smallest possible difference between a float or double, ``FLOAT_EPSILON`` and
``DOUBLE_EPSILON``

It should be noted that this library defaults to the type ``double``. While it
does use the most memory, it's the most precise. If the compiler ever complains
about conversion or can't find a function, try calling it with a double value.

I've extended the native types to include a dot syntax. That is,
``Int(3).double`` will return 3.0. These are included for ``Int``, ``Double``,
``CInt``, and ``Float``. For integrating with C, use ``Int(3).cint``.

The library includes both `ScalarArithmetic`_ and `swift-complex`_. This means
that numbers have handy conversions and we can access complex numbers through
``1.0+1.0.i`` respectively.


Docs
++++++++++++++
.. automodule:: numbers
    :members:




.. _ScalarArithmetic: https://github.com/seivan/ScalarArithmetic
.. _swift-complex: https://github.com/dankogai/swift-complex
