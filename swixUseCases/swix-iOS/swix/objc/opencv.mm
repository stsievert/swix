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
void matToPointer(Mat x, double * y, int N){
    double * yP = x.ptr<double>(0);
    copy(yP, y, N);
}
void copy(double* x, double * y, int N){
    cblas_dcopy(N, x, 1, y, 1);
}
@end

