//
//  oneD_cmath.m
//  swix
//
//  Created by Scott Sievert on 6/12/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Accelerate/Accelerate.h>
#define F(x) [NSNumber numberWithDouble:x]
NSArray*  NSArrayWith2DDouble(double * x, int n, int m);

double* zeros_objc(int N){
    double * x = (double *)malloc(sizeof(double) * N);
    double value = 0.0;
    vDSP_vfillD(&value, x, 1, N);
    return x;
}
double* NSArrayToDoublePointer(NSArray* x){
    unsigned long N = [x count];
    double * xx = (double *)malloc(sizeof(double) * N);
    for (int i=0; i<[x count]; i++) {
        xx[i] = [[x objectAtIndex:i] doubleValue];
    }
    return xx;
    
}

double* abs_objc(NSArray * x, int N){
    double* xx = NSArrayToDoublePointer(x);
    double * y = zeros_objc(N);
    
    vDSP_vabsD(xx,1,y,1,N);
    return y;
}

double* addvectors_objc(NSArray* x, NSArray* y){
    unsigned long N = [x count];
    double* xx = NSArrayToDoublePointer(x);
    double* yy = NSArrayToDoublePointer(y);
    double* zz = (double*)malloc(sizeof(double) * N);
    
    vDSP_vsaddD(xx, 1, yy, zz, 1, N);
    
    return zz;
}
DSPDoubleComplex* fft_objc(NSArray* x){
    unsigned long N = [x count];
    
    double * xx = NSArrayToDoublePointer(x);
    FFTSetupD setup = vDSP_create_fftsetupD((int)log2(N)+1, FFT_RADIX2);
    DSPDoubleSplitComplex xxx;
    xxx.realp = xx;
    xxx.imagp = zeros_objc((int)N);
    
    DSPDoubleSplitComplex yyy;
    yyy.realp = (double *)malloc(sizeof(double) * 2*N);
    yyy.imagp = (double *)malloc(sizeof(double) * 2*N);
    
    vDSP_fft_zropD(setup, &xxx, 1, &yyy, 1, (int)log2(N)+1, FFT_FORWARD);
    
    // can be sped up with accelerate multiply
    for (int i=0; i<N; i++) {
        yyy.realp[i] = yyy.realp[i] / 2;
        yyy.imagp[i] = yyy.imagp[i] / 2;
    }
    
    DSPDoubleComplex* x4 = (DSPDoubleComplex*)malloc(sizeof(DSPDoubleComplex) * 4 * N);
    vDSP_ztocD(&yyy, 1, x4, 2, N);
    return x4;
}
double* ifft_objc(//DSPDoubleComplex* x, int N){
                  NSArray* yr, NSArray* yi, int N){
    
    DSPDoubleComplex* x = (DSPDoubleComplex *)malloc(sizeof(DSPDoubleComplex) * N * 2);
    // slow but nice
    for (int i=0; i<N; i++){
        x[i].real = [[yr objectAtIndex:i] doubleValue];
        x[i].imag = [[yi objectAtIndex:i] doubleValue];
    }
    FFTSetupD setup = vDSP_create_fftsetupD((int)log2(N)+1, FFT_RADIX2);
    DSPDoubleSplitComplex x2;
    x2.realp = (double *)malloc(sizeof(double) * 2*N);
    x2.imagp = (double *)malloc(sizeof(double) * 2*N);
    
    DSPDoubleSplitComplex result;
    result.realp = (double *)malloc(sizeof(double) * 2*N);
    result.imagp = (double *)malloc(sizeof(double) * 2*N);
    vDSP_ctozD(x, 2, &x2, 1, N);
    
    vDSP_fft_zropD(setup, &x2, 1, &result, 1, (int)log2(N)+1, FFT_INVERSE);
    
    // why 16? beats me. can be sped up with accelerate
    for (int i=0; i<N; i++) result.realp[i] = result.realp[i]/16;
    return result.realp;
}
double* svd_objc(NSArray * x){
    // adapted from http://stackoverflow.com/questions/5047503/lapack-svd-singular-value-decomposition
    int m = (int)[x count];
    int n = (int)[[x objectAtIndex:0] count];
    int lda = m;
    double * xx = (double *)malloc(sizeof(double) * m * n);
    for (int i=0; i<m; i++){
        for (int j=0; j<n; j++){
            xx[j*m + i] = [[[x objectAtIndex:i] objectAtIndex:j] doubleValue];
        }
    }
    // Setup a buffer to hold the singular values:
    int numberOfSingularValues = m < n ? m : n;
    int nS = numberOfSingularValues;
    double *s = malloc(numberOfSingularValues * sizeof *s);
    
    // Setup buffers to hold the matrices U and Vt:
    double *u = malloc(m*m * sizeof *u);
    double *vt = malloc(n*n * sizeof *vt);
    
    // Workspace and status variables:
    double workSize;
    double *work = &workSize;
    int lwork = -1;
    int *iwork = malloc(8*numberOfSingularValues);
    int info = 0;
    
    // Call dgesdd_ with lwork = -1 to query optimal workspace size:
    dgesdd_("A", &m, &n, xx, &lda, s, u, &m, vt, &n, work, &lwork, iwork, &info);
    
        // Optimal workspace size is returned in work[0].
        lwork = workSize;
    work = malloc(lwork * sizeof *work);
    
    // Call dgesdd_ to do the actual computation:
    dgesdd_("A", &m, &n, xx, &lda, s, u, &m, vt, &n, work, &lwork, iwork, &info);
    double * ret = (double*)malloc(sizeof(double) * (m+n*n+m*m));
    for (int i=0; i<nS;   i++) ret[i] = s[i];
    for (int i=0; i<n*n; i++) ret[i+nS] = vt[i];
    for (int i=0; i<m*m; i++) ret[i+nS+n*n] = u[i];
    return ret;

//    return dic;
}

NSArray*  NSArrayWith2DDouble(double * x, int n, int m){
    NSArray* xx;
    
    for (int i=0; i<m; i++){
        for (int j=0; j<m; j++){
            [[xx objectAtIndex:i] addObject: F(x[i*m+j]) ];
        }
    }
    
    return xx;
}











