//
//  oneD_cmath.m
//  swix
//
//  Created by Scott Sievert on 6/12/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Accelerate/Accelerate.h>

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
double* fft_objc(NSArray* x){
    unsigned long N = [x count];
    
    double * yy = (double *)malloc(sizeof(double) * N);
//    vDSP_fft_zripD ( FFTSetupD __vDSP_Setup, const DSPDoubleSplitComplex *__vDSP_C, vDSP_Stride __vDSP_IC, vDSP_Length __vDSP_Log2N, FFTDirection __vDSP_Direction );
    FFTSetupD setup = vDSP_create_fftsetupD((int)log2(N), FFT_RADIX2);
//    vDSP_fft_zripD(setup);
    return yy;
}
