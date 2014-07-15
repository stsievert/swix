//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import <Accelerate/Accelerate.h>
#import "OpenCV.h"

void fft_objc(double*xx, int N, double* yr, double* yi);
void ifft_objc(double* yr, double* yi, int N, double* x);
void dot_objc(double* x, double* y, double* z, int m, int n, int k);
void index_objc(double*x, double*y, double* idx, int N);