//
//  oneD_cmath.m
//  swix
//
//  Created by Scott Sievert on 6/12/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Accelerate/Accelerate.h>
#include <stdio.h>

double* zeros_objc(int N){
    double * x = (double *)malloc(sizeof(double) * N);
    double value = 0.0;
    vDSP_vfillD(&value, x, 1, N);
    return x;
}

double* abs_objc(NSArray * x, int N){
    // converting input (NSArray*) to double*
    double * xx = (double *)malloc(sizeof(double) * N);
    for (int i=0; i<[x count]; i++) {
        xx[i] = [[x objectAtIndex:i] doubleValue];
    }
    
    // init'ing output
    double * y = zeros_objc(N);
    vDSP_vabsD(xx,1,y,1,N);
    
    return y;
}

