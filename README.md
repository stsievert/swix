## SWift MatrIX library
Swift is a higher level language that is asking for some numerical library to
perform computation *fast.* This is a bare-bones wrapper for that library.

Currently, this library gives you

* [`ones`][ones] and [`zeros`][zeros] (the bare-bones)
* operators `+-*/` that perform computations *elementwise*. ie,
  `[1,2,3]+[4,5,6] = [5,7,9]`
* (to be integrated) `vec`, `dot`, etc. Calling of the BLAS library to give you
  fahst function calls.

## Usage
1. Download this repo.
2. Include the file `swix.swift` in your project.

Boom. Done. The operators for `Array[]()` have been overwritten and Swift works
like you'd expect it to.

#### Init'ing arrays
```swift
ones(4) = [1, 1, 1, 1]
ones((4,4)) = matrix([1, 1],
                     [1, 1])
// same with zeros
```

#### Functions
If you have a function that operates on a single element, it can easily be
applied to the entire array through `apply_function(single_element_function,
matrix2d`

You can see the wiki for a complete list of functions, but this library
implements basic functions such as sin, abs while getting into slightly more
complex norm functions.

This library also can do FFTs.

#### Arithmetic
```swift
ones(4) * 4 = [4, 4, 4, 4]
ones(4) * (ones(4) + 1) = [2, 2, 2, 2]

// same for +, -, *, /
```

Note that `*` is not a dot product operator. Following [this Python PEP][pep],
I decided to use `@` as a dot product operator.


## Features to be added
* 2D arrays
* dot product
* BLAS calling/C integration


[ones]:http://docs.scipy.org/doc/numpy/reference/generated/numpy.ones.html
[zeros]:http://docs.scipy.org/doc/numpy/reference/generated/numpy.zeros.html#numpy.zeros
