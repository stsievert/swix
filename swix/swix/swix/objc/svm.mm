//
//  svm.m
//  swix
//
//  Created by Scott Sievert on 7/16/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OpenCV.h"
#import "swix-Bridging-Header.h"
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
-(void) train:(double *)x targets:(double *)targets m:(int)M n:(int)N{
    // M is the number of responses or rows; N is columns or variables
    float * x2 = (float *)malloc(sizeof(float) * M * N);
    float * t2 = (float *)malloc(sizeof(float) * M);
    vDSP_vdpsp(x, 1, x2, 1, M*N);
    vDSP_vdpsp(targets, 1, t2, 1, M*1);
    Mat xMat(M, N, CV_32FC1, x2);
    Mat tMat(M, 1, CV_32FC1, t2);
    Mat x3 = Mat();
    ocvSVM.train(xMat, tMat, x3, x3, params);
}
- (float) predict:(NSArray *)x {
//    float * response = NSArrayToDouble(x);
//    Mat rMat(1, (int)[x count], CV_32FC1, response);
//    float targetPredict = ocvSVM.predict(rMat);
//    return targetPredict;
    return 3.14;
}
@end

//void doubleToFloat(double * x, float * y, int N){
//    vDSP_vdpsp(x, 1, y, 1, N);
//}
