## Swift Matrix Library
Apple's Swift is a high level language that is asking for some numerical
library to perform computation *fast*, or at the very least *easily*. This is a
bare-bones wrapper for that library.

A way to have iOS run matlab-like code is something I've been waiting for, and
am incredibly excited to see the results. This will make porting complex signal
processing algorithms to C *much* easier, meaning that more of the general
public can see these algorithms *on their mobile device.*

For example, setting every element in an array to a single value involved
something like `for {int i=0; i<N; i++} x[i] = 3;`. With Swift (and this
library), it's just `var x = ones(N) * 3`.

While this library is basic (and hacked together in two days), I expect
something like [NumPy][numpy] to be released: a mathematical library that
includes more than needed. I should mention that this library just wraps Swift
and does not call other libraries, such as the powerful [Accelerate
framework][accel]. If you find a function to add, feel free to submit a pull
request.

Currently, this library gives you

* easy initializers for 1D and 2D arrays
* nice operators
* various functions (sin, abs, pow, etc) that operate on entire arrays

This library inherits heavily from NumPy. The syntax and operators are similar.
When in doubt about what a function does, look at NumPy's docs (although swix's
docs are included in the wiki).

## Usage
1. Download this repo.
2. Include the folder `swix` in your project.

Boom. Done. 

The operators for `Array[]()` have been overwritten and Swift works
like you'd expect it to. This is a bug -- I want to preserve Array as is.

#### Functions
If you have a function that operates on a single element, it can easily be
applied to the entire array through `apply_function(single_element_function,
matrix2d`

You can see the wiki for a complete list of functions, but this library
implements basic functions such as sin, abs while getting into slightly more
complex norm functions.

This library also can do FFTs.

#### Init'ing arrays
```swift
ones(4) = [1, 1, 1, 1]
ones((4,4)) = matrix([1, 1],
                     [1, 1])
// same with zeros
array(1, 2, 3, 4) = [1, 2, 3, 4]
array("[1 2; 4 5]") = matrix([1 2],
                             [4 5])
```


#### Arithmetic
```swift
ones(4) * 4 = [4, 4, 4, 4]
ones(4) * (zeros(4) + 2) = [2, 2, 2, 2]

// same for +, -, *, /
```

Note that `*` is not a dot product operator.  I would have used `@` as a dot
product operator (like [PEP 465][pep], but custom operators [can't use `@`][@].
So, I decided to use the symbol for extra-important multiplication: `*!`.

## Features to be added
* FFT
* BLAS calling/C integration
* better complex number integration


[numpy]:http://www.numpy.org
[accel]:https://developer.apple.com/library/prerelease/mac/documentation/Accelerate/Reference/AccelerateFWRef/_index.html#//apple_ref/doc/uid/TP40009465
[@]:https://developer.apple.com/library/prerelease/ios/documentation/swift/conceptual/swift_programming_language/AdvancedOperators.html#//apple_ref/doc/uid/TP40014097-CH27-XID_48
[ones]:http://docs.scipy.org/doc/numpy/reference/generated/numpy.ones.html
[zeros]:http://docs.scipy.org/doc/numpy/reference/generated/numpy.zeros.html#numpy.zeros
[pep]:http://legacy.python.org/dev/peps/pep-0465/#implementation-details
