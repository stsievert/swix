//
//  image.h
//  swix
//
//  Created by Scott Sievert on 7/10/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>
#import <Accelerate/Accelerate.h>

@class imageToHSV;
@interface imageToHSV : NSObject
-(void)imageToRawArray:(UIImage*)image into:(float *)array pix:(long)count;
-(UIImage *)UIImageFromRawArray:(float *)array image:(UIImage *)image forwardInverseOrNull:(NSString *)way;
@end