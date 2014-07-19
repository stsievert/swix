## Swift Matrix and Machine Learning Library
Apple's Swift is a high level language that's *asking* for some numerical
library to perform computation *fast* or at the very least *easily*. This is a
bare-bones wrapper for that library.

A way to have iOS run high-level code similar to Python or Matlab is something
I've been waiting for, and am incredibly excited to see the results. This will
make porting complex signal processing algorithms to C *much* easier. Porting
from Python/MATLAB to C was (and is) a pain in the butt, and this library aims
to make the Python/MATLAB to iOS conversion *simple.*

As an example, here's some Objective-C sample code that utilizes the
[Accelerate framework][accel]:

```objc
void copy(double* x, double* y, int N){
    cblas_dcopy(N, x, 1, y, 1);
}
void add_two_vectors(double * x, double * y, double * result, int N){
    copy(y, result, N);
    cblas_daxpy(N, 1.0, x, 1, result, 1);
}
void add_scalar(double x, double * y, double * result, int N){
    vDSP_vsaddD(y, 1, &x, result, 1, N)
}
void multiply_two_vectors(double * x, double * y, double * result, int N){
    vDSP_vmulD(x, 1, y, 1, result, 1, N);
}
void set_value(double value, double * x, int N){
    catlas_dset(N, value, x, 1);
}
void main(){
    int N = 10;
    double * x = (double *)malloc(sizeof(double) * N);
    double * y = (double *)malloc(sizeof(double) * N);
    double * temp = (double *)malloc(sizeof(double) * N);
    double * result = (double *)malloc(sizeof(double) * N);

    set_value(3.142, x, N);
    set_value(1.618, y, N);
    add_two_vectors(x, y, temp, N);
    add_scalar(4, temp, temp, N);
    multiply_two_vectors(x, temp, result, N);
}
```

The equivalent Swift syntax with this library?

```swift
let N = 10
var x = ones(N) * pi
var y = ones(N) * phi
var result = (x+y+4)*x
```

While this library is basic, I expect something like [NumPy][numpy] to be
released: a mathematical library that includes more than you would ever
possibly need. 

In most cases, this library calls [Accelerate][accel] or [OpenCV][opencv]. I
optimized what I needed to, meaning all operators and select mathematical
functions are fast while the functions I didn't need are slow. If you want to
speed up some function or add add another feature in those libraries, feel free
to submit a pull request (preferred!) or contact me at [@stsievert][st] or
[sieve121@umn.edu](mailto:sieve121@umn.edu).

Currently, this library gives you

* operators (+, etc) and various functions (sin, etc) that operate on entire arrays
* easy initializers for 1D and 2D arrays
* dot product, matrix inversion, solution to linear system of equations
* machine learning algorithms (SVM, kNN, SVD/PCA, more to come)
* One dimensional Fourier transforms
* speed optimization for operators/select simple functions/all complex functions

When I was crafting this library, I primarily followed the footsteps and
example set by [NumPy][numpy]. For the more complex mathematical functions
(e.g., SVD) I tested it against NumPy. Matlab, at least for the SVD, returns
slightly different output.

Additionally, I followed NumPy's syntax whenever possible. For example, NumPy
and Matlab differ in their initializer called `ones` by `ones((M,N))` and
`ones(M, N)` respectively. If in doubt or getting weird compiler bugs, look at
[NumPy for Matlab users][nfm].

[nfm]:http://wiki.scipy.org/NumPy_for_Matlab_Users

## Documentation 
Details on how to install and individual functions can be found in [swix's
documentation][swix-doc]

## Third Party Frameworks/Libraries
* [Accelerate][accel]
* [OpenCV][opencv]
* [swix-complex][complex]
* [ScalarArithemetic][scalar]

## Features to be added
* `x[0..<4] = 1`. I tried implementing this but had to add some annoying types;
  `var y:matrix = x[0..<5]`. I'll leave it be for now.
* cocoapods

[opencv]:http://opencv.org
[scalar]:https://github.com/seivan/ScalarArithmetic
[complex]:https://github.com/dankogai/swift-complex
[numpy]:http://www.numpy.org
[accel]:https://developer.apple.com/library/prerelease/mac/documentation/Accelerate/Reference/AccelerateFWRef/_index.html#//apple_ref/doc/uid/TP40009465
[@]:https://developer.apple.com/library/prerelease/ios/documentation/swift/conceptual/swift_programming_language/AdvancedOperators.html#//apple_ref/doc/uid/TP40014097-CH27-XID_48
[ones]:http://docs.scipy.org/doc/numpy/reference/generated/numpy.ones.html
[zeros]:http://docs.scipy.org/doc/numpy/reference/generated/numpy.zeros.html#numpy.zeros
[pep]:http://legacy.python.org/dev/peps/pep-0465/#implementation-details
[swix-doc]:http://swix.readthedocs.org/en/latest/
[st]:https://twitter.com/stsievert
