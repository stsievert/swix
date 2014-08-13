//
//  fft.m
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Accelerate/Accelerate.h>
double* zeros_objc(int N);


void fft_objc(double* xx, int N, double*yr, double* yi){
    FFTSetupD setup = vDSP_create_fftsetupD((int)log2(N)+1, FFT_RADIX2);
    DSPDoubleSplitComplex xxx;
    xxx.realp = xx;
    xxx.imagp = zeros_objc((int)N);
    
    DSPDoubleSplitComplex yyy;
    yyy.realp = yr;
    yyy.imagp = yi;
    
    vDSP_fft_zropD(setup, &xxx, 1, &yyy, 1, (int)log2(N)+1, FFT_FORWARD);
}
void ifft_objc(double* yr, double* yi, int N, double* x){
    FFTSetupD setup = vDSP_create_fftsetupD((int)log2(N)+1, FFT_RADIX2);
    DSPDoubleSplitComplex x2;
    x2.realp = yr;//(double *)malloc(sizeof(double) * 2*N);
    x2.imagp = yi;//(double *)malloc(sizeof(double) * 2*N);
    
    DSPDoubleSplitComplex result;
    result.realp = x;//(double *)malloc(sizeof(double) * 2*N);
    result.imagp = (double *)malloc(sizeof(double) * 2*N);

    vDSP_fft_zropD(setup, &x2, 1, &result, 1, (int)log2(N)+1, FFT_INVERSE);
}
void svd_objc(double * xx, int m, int n, double* s, double* vt, double* u){
    // adapted from the buggy code at http://stackoverflow.com/questions/5047503/lapack-svd-singular-value-decomposition
    __CLPK_integer lda = (__CLPK_integer)m;
    long numberOfSingularValues = m < n ? m : n;
    
    // Workspace and status variables:
    __CLPK_integer _n = n;
    __CLPK_integer _m = m;
    double* work = (double*)malloc(sizeof(double) * 2);
    __CLPK_integer lwork = -1;
    __CLPK_integer * iwork = (__CLPK_integer *)malloc(sizeof(__CLPK_integer) * 8 * numberOfSingularValues);
    __CLPK_integer info = 0;
    
    // Call dgesdd_ with lwork = -1 to query optimal workspace size:
    dgesdd_("A", &_m, &_n, xx, &lda, s, u, &_m, vt, &_n, work, &lwork, iwork, &info);
    
    // Optimal workspace size is returned in work[0].
    lwork = work[0];
    free(work);
    work = (double *)malloc(lwork * sizeof(double));
    
    // Call dgesdd_ to do the actual computation:
    dgesdd_("A", &_m, &_n, xx, &lda, s, u, &_m, vt, &_n, work, &lwork, iwork, &info);
    
    free(work);
    free(iwork);
}























