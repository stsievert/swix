//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import <Accelerate/Accelerate.h>
#import "OpenCV.h"

void mod_objc(double * x, double mod, double * y, int N);
void index_xa_b_objc(double * x, double*a, double*b, int N);
void svd_objc(double * xx, int m, int n, double* sigma, double* vt, double* u);
void test();



