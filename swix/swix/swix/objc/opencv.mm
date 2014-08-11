//
//  knn.m
//  swix
//
//  Created by Scott Sievert on 7/1/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Accelerate/Accelerate.h>

#import <opencv2/core/core.hpp>
#import <opencv2/highgui/highgui.hpp>
#import <opencv2/ml/ml.hpp>

#import "OpenCV.h"
using namespace cv;


void matToPointer(Mat x, double * y, int N);
void copy(Mat x, double * y, int N);
@implementation CVWrapper
+ (void) flip:(double*)x into:(double*)y how:(NSString*)how M:(int)M N:(int)N{
    Mat xMat(M, N, CV_64F, x);
    Mat yMat(M, N, CV_64F, y);
    int direction=0;
    if ([how isEqualToString:@"ud"]) direction=0;
    if ([how isEqualToString:@"lr"]) direction=1;
    
    flip(xMat, yMat, direction);
}
+ (void) repeat:(double *)x to:(double*)y n_x:(int)n_x n_repeat:(int)n_repeat{
    Mat xMat(n_x, 1, CV_64F, x);
    Mat yMat(n_x*n_repeat, 1, CV_64F, y);
    repeat(xMat, 1, n_repeat, yMat);
    matToPointer(yMat, y, n_x * n_repeat);
    xMat.release();
    yMat.release();
}
+ (void) solve:(double *)A b:(double*)b x:(double*)x m:(int)m n:(int)n{
    Mat Amat(m, n, CV_64F, A);
    Mat bMat(m, 1, CV_64F, b);
    Mat xMat(1, n, CV_64F, x);
    solve(Amat, bMat, xMat);
    matToPointer(xMat, x, n);
}
+ (void) compare:(double*)x with:(double*)y
           using:(NSString*)op into:(double*)z ofLength:(int)N{
    // this isn't working.
    // instead, I can do threshold(abs(x - y), 1e-9)
    
    // threshold: vDSP_vthrscD
    // abs can be vectorized, - vectorized
    Mat xMat(1, N, CV_64F, x);
    Mat yMat(1, N, CV_64F, y);
    Mat zMat;
    if      ([op isEqualToString:@"<"  ]) {zMat = xMat < yMat;}
    else if ([op isEqualToString:@">"  ]) {zMat = xMat > yMat;}
    else if ([op isEqualToString:@"<=" ]) {zMat = xMat <= yMat;}
    else if ([op isEqualToString:@">=" ]) {zMat = xMat >= yMat;}
    else if ([op isEqualToString:@"==" ]) {zMat = xMat == yMat;}
    else if ([op isEqualToString:@"!=="]) {compare(xMat, yMat, zMat, CMP_NE);}
    else printf("*** Careful! Your operation isn't recognized!\n");
    matArgWhereConvert(zMat, z, N);
}
+ (void) compare:(double*)x withDouble:(double)y
           using:(NSString*)op into:(double*)z ofLength:(int)N{
    // this isn't working.
    // instead, I can do threshold(abs(x - y), 1e-9)
    
    // threshold: vDSP_vthrscD
    // abs can be vectorized, - vectorized
    Mat xMat(1, N, CV_64F, x);
    Mat zMat;
    if      ([op isEqualToString:@"<"  ]) {zMat = xMat < y;}
    else if ([op isEqualToString:@">"  ]) {zMat = xMat > y;}
    else if ([op isEqualToString:@"<=" ]) {zMat = xMat <= y;}
    else if ([op isEqualToString:@">=" ]) {zMat = xMat >= y;}
    else if ([op isEqualToString:@"==" ]) {zMat = xMat == y;}
    else if ([op isEqualToString:@"!=="]) {compare(xMat, y, zMat, CMP_NE);}
    else printf("*** Careful! Your operation isn't recognized!\n");
    matArgWhereConvert(zMat, z, N);
}
void matToPointer(Mat x, double * y, int N){
    if  (!x.isContinuous()){
        printf("Careful! The OpenCV::Mat-->double* conversion didn't go well as x is not continuous in memory! (message printed from swix/objc/opencv.mm:matToPointer)\n");
    }
    uchar* ptr = x.data;
    double* ptrD = (double*)ptr;
    copy(ptrD, y, N);
}
void matArgWhereConvert(Mat x, double * y, int N){
    if  (!x.isContinuous()){
        printf("Careful! The OpenCV::Mat-->double* conversion didn't go well as x is not continuous in memory! (message printed from swix/objc/opencv.mm:matToPointer)\n");
    }
    uchar* ptr = x.data;
    // integer to double conversion
    vDSP_vfltu8D(ptr, 1, y, 1, N);
}
void copy(double* x, double * y, int N){
    cblas_dcopy(N, x, 1, y, 1);
}
@end


