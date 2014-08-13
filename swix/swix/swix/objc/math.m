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























