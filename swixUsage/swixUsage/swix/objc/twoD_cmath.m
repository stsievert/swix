//
//  two_cmath.m
//  swix
//
//  Created by Scott Sievert on 6/26/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Accelerate/Accelerate.h>
#define F(x) [NSNumber numberWithDouble:x]

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
}