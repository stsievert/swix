## Swift Matrix Library
Apple's Swift is a high level language that is asking for some numerical
library to perform computation *fast*, or at the very least *easily*. This is a
bare-bones wrapper for that library.

A way to have iOS run matlab-like code is something I've been waiting for, and
am incredibly excited to see the results. This will make porting complex signal
processing algorithms to C *much* easier. Porting from MATLAB to C was a pain
in the ass, and this library aims to make the MATLAB to iOS conversion
*simple.*

As an example, setting every element in an array to a single value with C
involved something like 
`double* x = (double*)malloc(sizeof(double) * N); for {int i=0; i<N; i++} x[i] = 3;`. 
With Swift (and this library), it's just `var x = ones(N) * 3`.

While this library is basic (most of it hacked together in two days), I expect
something like [NumPy][numpy] to be released: a mathematical library that
includes more than needed. I should mention that in most cases, this library
just wraps Swift and does not call other libraries, such as the powerful
[Accelerate framework][accel]. If you want to add a feature, feel free to
submit a pull request.

Currently, this library gives you

* easy initializers for 1D and 2D arrays
* various functions (sin, etc) and operators (+, etc) that operate on entire arrays
* dot product
* FFTs (1D only)

When I was crafting this library, I primarily depended on [NumPy][numpy]. The
syntax and operators are relatively similar, so if you're in doubt on how to
use a function, just look at NumPy's docs or swix's docs in the wiki.

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

This library also can do one dimensional FFTs.

#### Init'ing arrays
```swift
ones(4) == [1, 1, 1, 1]
ones((4,4)) == matrix([1, 1],
                     [1, 1])
// same with zeros
array(1, 2, 3, 4) == [1, 2, 3, 4]
array("[1 2; 4 5]") == matrix([1 2],
                             [4 5])
```


#### Arithmetic
```swift
ones(4) * 4 == [4, 4, 4, 4]
ones(4) * (zeros(4) + 2) == [2, 2, 2, 2]

// same for +, -, *, /
```

Note that `*` is not a dot product operator.  I would have used `@` as a dot
product operator (like [PEP 465][pep], but custom operators [can't use `@`][@].
So, I decided to use the symbol for extra-important multiplication: `*!`.

## Features to be added
* indexing. `x[0..3] = 1, x[0, 0..3] = 2, x[0..2] = array(4,9)` etc
* Accelerate Framework integration. The bares bones are figured out and I just
  need to do the grunt work.
* better complex number integration. Currently, `fft(x)` returns two separate
  vectors. This can be integrated with [swift-complex][complex].
* better 2D matrix implementation. An array of arrays or a class that uses `matrix[row*width +
  column]`?

## Third Party Frameworks/Libraries
* [OpenCV][opencv]
* [swix-complex][complex]
* [ScalarArithemetic][scalar]

[opencv]:http://opencv.org
[scalar]:https://github.com/seivan/ScalarArithmetic
[complex]:https://github.com/dankogai/swift-complex
[numpy]:http://www.numpy.org
[accel]:https://developer.apple.com/library/prerelease/mac/documentation/Accelerate/Reference/AccelerateFWRef/_index.html#//apple_ref/doc/uid/TP40009465
[@]:https://developer.apple.com/library/prerelease/ios/documentation/swift/conceptual/swift_programming_language/AdvancedOperators.html#//apple_ref/doc/uid/TP40014097-CH27-XID_48
[ones]:http://docs.scipy.org/doc/numpy/reference/generated/numpy.ones.html
[zeros]:http://docs.scipy.org/doc/numpy/reference/generated/numpy.zeros.html#numpy.zeros
[pep]:http://legacy.python.org/dev/peps/pep-0465/#implementation-details
