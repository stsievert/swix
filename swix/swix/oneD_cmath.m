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

double* abs_objc(NSArray * x, int N){
//-(void)abs_objc:(double *)x N:(int)N{
    
    // converting input to double *
    double * xx = (double *)malloc(sizeof(double) * N);
    for (int i=0; i<[x count]; i++) {
        xx[i] = [[x objectAtIndex:i] doubleValue];
    }
    
    // init'ing output
    double * y = (double *)malloc(sizeof(double) * N);
    for (int i=0; i<N; i++){
        y[i] = 0;
    }
    
    vDSP_vabsD(xx,1,y,1,N);
    
    return y;
    
    
}

