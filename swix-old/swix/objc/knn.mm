//
//  knn.m
//  swix
//
//  Created by Scott Sievert on 7/1/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "machine_learning.h"

#import <opencv2/core/core.hpp>
#import <opencv2/highgui/highgui.hpp>
#import <opencv2/ml/ml.hpp>
double* NSArray2dToDouble(NSArray * x);
float* NSArrayToDouble(NSArray * x);
using namespace cv;

// #### STATE VECTOR MACHINE
@implementation kNN : NSObject
int kN;
int kM;

CvKNearest cvknn;

-(NSObject*)init{
    return self;
}

- (void) train:(NSArray *)x targets:(NSArray *)tar{
    double * x3 = NSArray2dToDouble(x);
    float * t3 = NSArrayToDouble(tar);
    kM = (int)[x count];
    kN = (int)[[x objectAtIndex:0] count];
    
    Mat x4(kM, kN, CV_32FC1, x3);
    Mat t4(kM, 1, CV_32FC1, t3);
    
    cvknn.train(x4, t4);
    
}
- (float) predict:(NSArray *)x k:(int)k{
    float * x2 = NSArrayToDouble(x);
    Mat x3(1, (int)[x count], CV_32FC1, x2);
    float targetPredict = cvknn.find_nearest(x3, k);
    
    return targetPredict;
}
@end












