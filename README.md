## Swift Matrix and Machine Learning Library
Apple's Swift is a high level language that's *asking* for some numerical
library to perform computation *fast* or at the very least *easily*. This is a
bare-bones wrapper for that library.

A way to have iOS run high-level code similar to Python or Matlab is something
I've been waiting for, and am incredibly excited to see the results. This will
make porting complex signal processing algorithms to C *much* easier. Porting
from Python/MATLAB to C was (and is) a pain in the butt, and this library aims
to make the conversion between a Python/Matlab algorithm and a mobile app
*simple.*

In most cases, this library calls [Accelerate][accel] or [OpenCV][opencv]. If
you want to speed up some function or add add another feature in those
libraries, feel free to submit a pull request (preferred!) or contact me at
[@stsievert][st] or [sieve121@umn.edu](mailto:sieve121@umn.edu). Oh, and if you
use this project I'd love to hear about it.

Currently, this library gives you

* operators and various functions (sin, etc) that operate on entire arrays
* helper function (reshape, reverse, delete, repeat, etc)
* easy initializers for 1D and 2D arrays
* complex math (dot product, matrix inversion, eigenvalues, etc)
* machine learning algorithms (SVM, kNN, SVD/PCA, more to come)
* one dimensional Fourier transforms
* speed optimization using Accelerate and OpenCV

When I was crafting this library, I primarily followed the footsteps and
example set by [NumPy][numpy]. For the more complex mathematical functions
(e.g., SVD) I tested it against NumPy. Matlab, at least for the SVD, returns
slightly different output.

Additionally, I followed NumPy's syntax whenever possible. For example, NumPy
and Matlab differ in their initializer called `ones` by `ones((M,N))` and
`ones(M, N)` respectively. If in doubt or getting weird compiler bugs, look at
[NumPy for Matlab users][nfm] or the section on possible swix bugs while
[installing] or [nasty bugs] that may pop up.

[installing]:http://swix.readthedocs.org/en/latest/installation.html
[nasty bugs]:http://swix.readthedocs.org/en/latest/bugs.html
[nfm]:http://wiki.scipy.org/NumPy_for_Matlab_Users

## FAQ
>> Why does this library exist?

> Not only should you be able to do simple math in arrays like in [Surge], Swift
  makes it possible to call high level mathematical functions just like in
  Python/Matlab.

>> How does this library compare to Python/Matlab?

> Complete speed results can be found in *[Speed]*

>> Why are you developing this library?

> Since I'm finishing up my EE degree, I have to do a senior project. This
  project will be a machine learning project and I know that a math library
  will be useful.

> Plus, I want to make it easy for mathematicians to port their algorithms to a
  mobile app. Back in the ObjC days, this meant porting the algorithm to C.

> It's a common mistake for inexperienced engineers to develop something
  instead of looking elsewhere. I started developing this project because I
  couldn't find similar projects elsewhere and needed this project quickly. I
  expect a more complete library will be released *eventually.*

[Speed]:http://scottsievert.github.io/swix/speed.html
[Surge]:https://github.com/mattt/Surge

## Documentation 
Details on how to install and individual functions can be found in [swix's
documentation][swix-doc].

[mobile friendly version]:http://swix.readthedocs.org/
[swix-doc]:http://scottsievert.github.io/swix/

## Third Party Frameworks/Libraries
* [Accelerate][accel]
* [OpenCV][opencv]

...and I used some of [SwiftAccelerate][ais] to avoid some BLAS/LAPACK agony.

##### To be integrated
* [swix-complex][complex]
* [ScalarArithemetic][scalar]

[ais]:https://github.com/haginile/SwiftAccelerate
[so]:http://stackoverflow.com/q/24727674/1141256
[opencv]:http://opencv.org
[scalar]:https://github.com/seivan/ScalarArithmetic
[complex]:https://github.com/dankogai/swift-complex
[numpy]:http://www.numpy.org
[accel]:https://developer.apple.com/library/prerelease/mac/documentation/Accelerate/Reference/AccelerateFWRef/_index.html#//apple_ref/doc/uid/TP40009465
[@]:https://developer.apple.com/library/prerelease/ios/documentation/swift/conceptual/swift_programming_language/AdvancedOperators.html#//apple_ref/doc/uid/TP40014097-CH27-XID_48
[ones]:http://docs.scipy.org/doc/numpy/reference/generated/numpy.ones.html
[zeros]:http://docs.scipy.org/doc/numpy/reference/generated/numpy.zeros.html#numpy.zeros
[pep]:http://legacy.python.org/dev/peps/pep-0465/#implementation-details
[st]:https://twitter.com/stsievert
