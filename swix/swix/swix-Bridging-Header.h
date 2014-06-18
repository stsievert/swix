//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import <Foundation/Foundation.h>
#import <Accelerate/Accelerate.h>
double* abs_objc(NSArray * x, int N);
double* zeros_objc(int N);
double* addvectors_objc(NSArray* x, NSArray* y);
DSPDoubleComplex* fft_objc(NSArray* x);
double* ifft_objc(NSArray * yr, NSArray * yi, int N);