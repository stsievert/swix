## Swift Matrix Library
Swift is a high level language that is asking for some numerical library to
perform computation *fast*, or at the very least *easily*. This is a bare-bones
wrapper for that library.

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
```


#### Arithmetic
```swift
ones(4) * 4 = [4, 4, 4, 4]
ones(4) * (zeros(4) + 2) = [2, 2, 2, 2]

// same for +, -, *, /
```

Note that `*` is not a dot product operator. Following [this Python PEP][pep],
I would have used `@` as a dot product operator (like [PEP 465][pep), but
custom operators [can't use `@`][@]. So, I decided to use the symbol for
extra-important multiplication: `*!`.


## Features to be added
* dot product
* BLAS calling/C integration
* complex number integration


[@]:https://developer.apple.com/library/prerelease/ios/documentation/swift/conceptual/swift_programming_language/AdvancedOperators.html#//apple_ref/doc/uid/TP40014097-CH27-XID_48
[ones]:http://docs.scipy.org/doc/numpy/reference/generated/numpy.ones.html
[zeros]:http://docs.scipy.org/doc/numpy/reference/generated/numpy.zeros.html#numpy.zeros
[pep]:http://legacy.python.org/dev/peps/pep-0465/#implementation-details
