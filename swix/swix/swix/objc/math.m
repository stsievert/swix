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


void dot_objc(double* x, double* y, double* z, int m, int n, int k){
    cblas_dgemm(CblasRowMajor,
                CblasNoTrans,
                CblasNoTrans,
                m, n, k, 1.0,
                x, k, y, n,
                1.0, z, n);
}

void fft_objc(double* xx, int N, double*yr, double* yi){
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
        yr[i] = yyy.realp[i];
        yi[i] = yyy.imagp[i];
    }
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

    // why 16? beats me. can be sped up with accelerate
    for (int i=0; i<N; i++){
        result.realp[i] = result.realp[i]/16;
        x[i] = result.realp[i];
    }
}
void svd_objc(double * xx, int m, int n, double* s, double* vt, double* u){
    // adapted from the buggy code at http://stackoverflow.com/questions/5047503/lapack-svd-singular-value-decomposition
    // on MacOSX, I get errors about passing long to int and on iOS I get errors about passing int to long. I'll go with iOS defaults.
    long lda = (long)m;
    long mm = m;
    long nn = n;
    long numberOfSingularValues = m < n ? m : n;
    
    // Workspace and status variables:
    double* work = (double*)malloc(sizeof(double) * 2);
    long lwork = -1;
    long* iwork = (long *)malloc(sizeof(long) * 8 * numberOfSingularValues);
    long info = 0;
    
    // Call dgesdd_ with lwork = -1 to query optimal workspace size:
    dgesdd_("A", &mm, &nn, xx, &lda, s, u, &mm, vt, &nn, work, &lwork, iwork, &info);
    
    // Optimal workspace size is returned in work[0].
    lwork = work[0];
    free(work);
    work = (double *)malloc(lwork * sizeof(double));
    
    // Call dgesdd_ to do the actual computation:
    dgesdd_("A", &mm, &nn, xx, &lda, s, u, &mm, vt, &nn, work, &lwork, iwork, &info);
    
    free(work);
    free(iwork);
}
void transpose_objc(double* x, double* y, int M, int N){
    vDSP_mtransD(x, 1, y, 1, M, N);
}
void inv_objc(double * x, long M, long N){
    // compiler complains on MacOSX but this compiles for iOS
    // "this works" meaning long/int issues
    // M rows, N cols
    long *ipiv = (long *)malloc(sizeof(long) * M * M);
    long lwork = N*N;
    double *work = (double*)malloc(sizeof(double) * lwork);
    long info;
    
    dgetrf_(&N, &N, x, &N, ipiv, &info);
    dgetri_(&N, x, &N, ipiv, work, &lwork, &info);
    
    free(work);
    free(ipiv);
}
void eig_objc(double* x, double* value_real, double* value_imag, double* vector, int N){
    // doesn't match python. return correct eigenvalues but not eigenvectors
    double * work = (double*)malloc(sizeof(double) * N * N); // N
    int lwork = 4*N;
    int info = 1;
    char jobvl  = 'V';
    char jobvr = 'N';
    work[0] = lwork;
    dgeev_(&jobvl, &jobvr, &N, x, &N, // 5
           value_real, value_imag, vector, &N, vector, &N, // 11
           work, &lwork, &info);
}























