//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import <Accelerate/Accelerate.h>

DSPDoubleComplex* fft_objc(NSArray* x);
double* ifft_objc(NSArray * yr, NSArray * yi, int N);