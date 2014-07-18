//
//  indexing.m
//  swix
//
//  Created by Scott Sievert on 7/13/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Accelerate/Accelerate.h>
#import <stdint.h>
void diag_objc(double* x, double* y, int M, int N){
    int min = N < M ? N : M; // min
    for (int i=0; i<min; i++){
        y[i] = x[i*N + i];
    }
}
void diag_set_objc(double * x, double * y, int M, int N){
    int min = N < M ? N : M;
    for (int i=0; i<min; i++){
        x[i*N + i] = y[i];
    }
}
void index_objc(double*x, double*y, double* idx, int N){
    // getting the matrix at selected indices; y[i] = x[b[i]]
    vDSP_vindexD(x, idx, 1, y, 1, N);
}
double* zeros_objc(int N){
    double * x = (double *)malloc(sizeof(double) * N);
    double value = 0.0;
    vDSP_vfillD(&value, x, 1, N);
    return x;
}
void linspace_objc(double* x, int N, double min, double step){
    vDSP_vrampD(&min, &step, x, 1, N);
}
double min_objc(double* x, int N){
    double minC = 0.0;
    vDSP_minvD(x, 1, &minC, N);
    return minC;
}
double max_objc(double* x, int N){
    double maxC = 0.0;
    vDSP_maxvD(x, 1, &maxC, N);
    return maxC;
}
void mod_objc(double * x, double mod, double * y, int N){
    for (int i=0; i<N; i++){
        y[i] = fmod(x[i], mod);
    }
    
}
void index_xa_b_objc(double* x, double* a, double* b, int N){
    int * j = (int *)malloc(sizeof(int) * N);
    vDSP_vfix32D(a, 1, j, 1, N); // double to int
    for (int i=0; i<N; i++){
        x[j[i]] = b[i];
    }
}
void copy_objc(double*x, double*y, int N){
    cblas_dcopy(N, x, 1, y, 1);
}
void mul_scalar_objc(double* x, double A, double* y, int N){
    double C = 0;
    vDSP_vsmsaD(x, 1, &A, &C, y, 1, N);
}

void compare_objc(double* x, double* y, double* z, int N, NSString* operation){
    int operationInt = -1;
    // converting to int; it's (presumably) faster
    // follows OpenCV's compare[0] convention
    // [0]:http://docs.opencv.org/modules/core/doc/operations_on_arrays.html#compare
    if ([operation isEqualToString:@"=="]) {operationInt = 0;}
    if ([operation isEqualToString:@">"])  {operationInt = 1;}
    if ([operation isEqualToString:@">="]) {operationInt = 2;}
    if ([operation isEqualToString:@"<"])  {operationInt = 3;}
    if ([operation isEqualToString:@"<="]) {operationInt = 4;}
    if ([operation isEqualToString:@"!=="]){operationInt = 5;}
    
    for (int i=0; i<N; i++){
             if (operationInt==0 &&   x[i] == y[i]) {z[i] = 1;}
        else if (operationInt==1 &&   x[i] >  y[i]) {z[i] = 1;}
        else if (operationInt==2 &&   x[i] >= y[i]) {z[i] = 1;}
        else if (operationInt==3 &&   x[i] <  y[i]) {z[i] = 1;}
        else if (operationInt==4 &&   x[i] <= y[i]) {z[i] = 1;}
        else if (operationInt==5 && !(x[i] == y[i])){z[i] = 1;}
    }
}


























