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

-(NSObject*)init{
    return self;
}
-(void) train:(NSArray *)x targets:(NSArray *)targets{
}
- (float) predict {
    return 3.14;
}
@end












