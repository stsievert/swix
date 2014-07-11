//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import <Accelerate/Accelerate.h>

//DSPDoubleComplex* fft_objc(NSArray* x);
//DSPDoubleComplex* fft_objc(double*xx, int N);
//DSPDoubleSplitComplex* fft_objc(double*xx, int N, double* yr, double* yi);
void fft_objc(double*xx, int N, double* yr, double* yi);
//double* ifft_objc(NSArray * yr, NSArray * yi, int N);
void ifft_objc(double* yr, double* yi, int N, double* x);