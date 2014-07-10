//
//  fft.m
//  swix
//
//  Created by Scott Sievert on 7/9/14.
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