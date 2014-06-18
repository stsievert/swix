swift-complex
=============

Complex numbers in [Swift]

[Swift]: https://developer.apple.com/swift/

Usage
-----

### in your project:

Just add complex.swift to it

### via command line:

````shell
xcrun swift main.swift complex.swift
````

Synopsis
--------

````swift
let z0 = 1 + 1.i
let z1 = 1 - 1.i
println(z0 * z1)            // (2.0+0.0.i)
println(z0 * z1 == z0 + z1) // true
println(z0 * z1 == 2)       // true
````

Description
-----------

complex.swift implements all the functionality of [std::complex in c++11], arguably more intuitively. 


[std::complex in c++11]: http://www.cplusplus.com/reference/complex/

### Difference from C++11

* Instead of defining the constant `i`, `Double` and `Complex` has a property `.i` which returns `self * Complex(0,1)` so it does not pollute the identifier `i`, too popularly used for iteration to make it a constant.
* Following functions are also provided as properties:
  * `z.real` for `real(z)`
  * `z.imag` for `imag(z)`
  * `z.abs` for `abs(z)`
  * `z.arg` for `arg(z)`
  * `z.norm` for `norm(z)`
  * `z.conj` for `conj(z)`
  * `z.proj` for `proj(z)`
* Construct a complex number via polar notation as:
  * `Complex(abs:magnitude, arg:argument)`
* In addition to `pow()`, it comes with the `**` operator
* Not generic -- yet
