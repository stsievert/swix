//
//  svd.m
//  swix
//
//  Created by Scott Sievert on 7/15/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Accelerate/Accelerate.h>
#import <stdint.h>
#import "swix-Bridging-Header.h" // for copy_objc

void svd_objc(double * xx, int m, int n, double* sigma, double* vt, double* u){
    // adapted from http://stackoverflow.com/questions/5047503/lapack-svd-singular-value-decomposition
    // Setup a buffer to hold the singular values:
    int lda = m;
    int numberOfSingularValues = m < n ? m : n;
    
    // Workspace and status variables:
    double workSize;
    double *work = &workSize;
    int lwork = -1;
    int *iwork = malloc(8*numberOfSingularValues);
    int info = 0;
    
    // Call dgesdd_ with lwork = -1 to query optimal workspace size:
    dgesdd_("A", &m, &n, xx, &lda, sigma, u, &m, vt, &n, work, &lwork, iwork, &info);
    
    // Optimal workspace size is returned in work[0].
    lwork = workSize;
    work = malloc(lwork * sizeof *work);
    
    // Call dgesdd_ to do the actual computation:
    dgesdd_("A", &m, &n, xx, &lda, sigma, u, &m, vt, &n, work, &lwork, iwork, &info);
    free(work);
}


