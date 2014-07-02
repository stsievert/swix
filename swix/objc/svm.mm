//
//  machine_learning.m
//  swix
//
//  Created by Scott Sievert on 6/30/14.
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
@implementation cvSVM : NSObject

CvSVM ocvSVM;
CvSVMParams params;
int N; // number of variables
int M; // number of responses
-(NSObject*)init{
    params.svm_type    = CvSVM::C_SVC;
    params.kernel_type = CvSVM::LINEAR;
    params.term_crit   = cvTermCriteria(CV_TERMCRIT_ITER, 100, 1e-6);
    return self;
}
-(void) train:(NSArray *)x targets:(NSArray *)targets{
    // M is the number of responses or rows; N is columns or variables
    M = (int)[x count];
    N = (int)[[x objectAtIndex:0] count];
    
    double * x2 = NSArray2dToDouble(x);
    Mat xMat(M, N, CV_32FC1, x2);
    
    float * t = NSArrayToDouble(targets);
    Mat tMat(M, 1, CV_32FC1, t);
    
    Mat xx = Mat();
    ocvSVM.train(xMat, tMat, xx, xx, params);
}
- (float) predict:(NSArray *)x {
    float * response = NSArrayToDouble(x);
    Mat rMat(1, (int)[x count], CV_32FC1, response);
    float targetPredict = ocvSVM.predict(rMat);
    return targetPredict;
}
@end


// #### HELPER FUNCTIONS
double* NSArray2dToDouble(NSArray * x){
    unsigned long N = [x count];
    unsigned long M = [[x objectAtIndex:0] count];
    double * y = (double *)malloc(sizeof(double) * N * M);
    for (int i=0; i<N; i++){
        for (int j=0; j<M; j++){
            y[i*M + j] = [[[x objectAtIndex:i] objectAtIndex:j] doubleValue];
        }
    }
    return y;
}
float* NSArrayToDouble(NSArray * x){
    int N = (int)[x count];
    float * y = (float *)malloc(sizeof(float) * N);
    for (int i=0; i<N; i++){
        y[i] = [[x objectAtIndex:i] floatValue];
    }
    return y;
}

void SVMtest(){
    
}




















