//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import <Accelerate/Accelerate.h>
#import "OpenCV.h"

void fft_objc(double*xx, int N, double* yr, double* yi);
void ifft_objc(double* yr, double* yi, int N, double* x);
void dot_objc(double* x, double* y, double* z, int m, int n, int k);
void index_objc(double*x, double*y, double* idx, int N);
void transpose_objc(double* x, double* y, int M, int N);
void linspace_objc(double* x, int N, double min, double step);
double min_objc(double* x, int N);
double max_objc(double* x, int N);
void mod_objc(double * x, double mod, double * y, int N);
void index_xa_b_objc(double * x, double*a, double*b, int N);
void copy_objc(double*x, double*y, int N);
void mul_scalar_objc(double* x, double A, double* y, int N);
void svd_objc(double * xx, int m, int n, double* sigma, double* vt, double* u);


