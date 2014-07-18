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
    Mat zMat(1, N, CV_64F, z);
    int oper=-1;
    if      ([op isEqualToString:@"<"  ]) {oper = CMP_LT;}
    else if ([op isEqualToString:@">"  ]) {oper = CMP_GT;}
    else if ([op isEqualToString:@"<=" ]) {oper = CMP_LE;}
    else if ([op isEqualToString:@">=" ]) {oper = CMP_GE;}
    else if ([op isEqualToString:@"==" ]) {oper = CMP_EQ;}
    else if ([op isEqualToString:@"!=="]) {oper = CMP_NE;}
    else printf("Careful! Your operation isn't recognized!\n");
    printf("double len: %lu\n", sizeof(double));
    
    compare(xMat, yMat, zMat, CMP_LT);
    
    double * zH = (double *)malloc(sizeof(double) * N);
    matToPointer(zMat, zH, N);
    
    std::cout << zMat << std::endl;
    for (int i=0; i<N; i++) printf("%f, ", zH[i]);
    printf("\n");
}
void matToPointer(Mat x, double * y, int N){
//    double * yP = x.ptr<double>(0);
//    copy(yP, y, N);
    if  (!x.isContinuous()){
        printf("Careful! The OpenCV::Mat-->double* conversion didn't go well as x is not continuous in memory! (message printed from swix/objc/opencv.mm:matToPointer)\n");
    }
    uchar* ptr = x.data;
    double* ptrD = (double*)ptr;
    copy(ptrD, y, N);
}
void copy(double* x, double * y, int N){
    cblas_dcopy(N, x, 1, y, 1);
}
@end


