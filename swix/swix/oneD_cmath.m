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
DSPDoubleComplex* fft_objc(NSArray* x){
    unsigned long N = [x count];
    
    double * xx = NSArrayToDoublePointer(x);
    FFTSetupD setup = vDSP_create_fftsetupD((int)log2(N), FFT_RADIX2);
    DSPDoubleSplitComplex xxx;
    xxx.realp = xx;
    xxx.imagp = zeros_objc((int)N);
    vDSP_fft_zripD(setup, &xxx, 1, (int)log2(N), kFFTDirection_Forward);
    
    DSPDoubleComplex* x4 = (DSPDoubleComplex*)malloc(sizeof(DSPDoubleComplex) * 2 * N);
    vDSP_ztocD(&xxx, 1, x4, 1, N);
    return x4;
}
