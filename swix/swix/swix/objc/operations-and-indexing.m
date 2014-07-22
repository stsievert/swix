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

// UNOPTIMIZED
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

// OPTIMIZED
double sum_objc(double* x, int N){
    double sum = 0;
    vDSP_sveD(x, 1, &sum, N);
    return sum;
}
void find_objc(double* x, double* args, double* idx, int N){
    // x: array of ones and zeros (but counts non-zeros)
    // idx: array of indecies... 0..<N
    // args: the array of arguments, to be overwritten
    vDSP_vcmprsD(idx, 1, x, 1, args, 1, N);
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
void copy_objc(double*x, double*y, int N){
    cblas_dcopy(N, x, 1, y, 1);
}
void mul_scalar_objc(double* x, double A, double* y, int N){
    double C = 0;
    vDSP_vsmsaD(x, 1, &A, &C, y, 1, N);
}
void sign_objc(double* x, double* y, int N){
    // writes sign(x) into y
    double o = 0;
    double l = 1;
    vDSP_vlimD(x, 1, &o, &l, y, 1, N);
}
void cumsum_objc(double* x, double* y, int N){
    double scalar = 1;
    vDSP_vrsumD(x, 1, &scalar, y, 1, N);
}
void rand_objc(double* x, int N, int seedS, int type){
    __CLPK_integer i = type;
    __CLPK_integer * seed = (__CLPK_integer *)malloc(sizeof(__CLPK_integer) * 4);
    for (int j=0; j<4; j++){
        seed[j] = j;}
    seed[0] = seedS;
    __CLPK_integer nn = N;
    
    // making the random array
    dlarnv_(&i, seed, &nn, x);
}
























