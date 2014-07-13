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
void index_objc(double*x, double*y, double* idx, int N){
    // getting the matrix at selected indices
    vDSP_vindexD(x, idx, 1, y, 1, N);
    // y = x[b[i]] is modified
}