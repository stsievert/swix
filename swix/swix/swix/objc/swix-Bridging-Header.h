//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import <Accelerate/Accelerate.h>
#import "OpenCV.h"

void fft_objc(double*xx, int N, double* yr, double* yi);
void ifft_objc(double* yr, double* yi, int N, double* x);
void dot_objc(double* x, double* y, double* z, int m, int n, int k);
void transpose_objc(double* x, double* y, int M, int N);
void mod_objc(double * x, double mod, double * y, int N);
void index_xa_b_objc(double * x, double*a, double*b, int N);
void svd_objc(double * xx, int m, int n, double* sigma, double* vt, double* u);
void inv_objc(double * x, int M, int N);
void test();
void eig_objc(double* x, double* value_real, double* value_imag, double* vector, int N);



