//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import <Foundation/Foundation.h>
#import <Accelerate/Accelerate.h>

#import <opencv2/opencv.hpp>
#import <opencv2/core/core.hpp>
#import <opencv2/highgui/highgui.hpp>
#import <opencv2/ml/ml.hpp>

#import "machine_learning.h"

double* abs_objc(NSArray * x, int N);
double* zeros_objc(int N);
double* addvectors_objc(NSArray* x, NSArray* y);
DSPDoubleComplex* fft_objc(NSArray* x);
double* ifft_objc(NSArray * yr, NSArray * yi, int N);
double * svd_objc(NSArray * m);

