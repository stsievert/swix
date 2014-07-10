//
//  image.m
//  swix
//
//  Created by Scott Sievert on 7/10/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

#import <Foundation/Foundation.h>
//
//  imageToHSV.m
//  AVCam
//
//  Created by Scott Sievert on 7/10/14.
//  Copyright (c) 2014 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>
#import <Accelerate/Accelerate.h>
#import "image.h"

@interface imageToHSV ()
@end
@implementation imageToHSV : NSObject

void copy(float * source, float * dest, int N){
    cblas_scopy(N, source, 1, dest, 1);
}
-(void)imageToRawArray:(UIImage*)image into:(float *)array pix:(long)count
{
    // First get the image into your data buffer
    CGImageRef imageRef = [image CGImage];
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char *rawData = (unsigned char*) calloc(height * width * 4, sizeof(unsigned char));
    NSUInteger bytesPerPixel = 4;
    NSUInteger bytesPerRow = bytesPerPixel * width;
    NSUInteger bitsPerComponent = 8;
    CGContextRef context = CGBitmapContextCreate(rawData, width, height,
                                                 bitsPerComponent, bytesPerRow, colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
    CGContextRelease(context);
    
    // unsigned char to float conversion
    vDSP_vfltu8(rawData, 1, array, 1, 4*count);
    free(rawData);
}

// functions to manipulate images/python stuff
-(UIImage *)UIImageFromRawArray:(float *)array image:(UIImage *)image forwardInverseOrNull:(NSString *)way
{
    const size_t Width = image.size.width;
    const size_t Height = image.size.height;
    const size_t Area = Width * Height;
    const size_t ComponentsPerPixel = 4; // rgba
    
    uint8_t * pixelData = (uint8_t *) malloc(sizeof(uint8_t) * Area * ComponentsPerPixel);
    
    // copying from the floating array to an array of ints.
    float * floating = (float *)malloc(sizeof(float) * Area * ComponentsPerPixel);
    copy(array, floating, (int)(4 * Area));
    vDSP_vfixu8(floating, 1, pixelData, 1, 4 * Area);
    
    // create the bitmap context:
    const size_t BitsPerComponent = 8;
    const size_t BytesPerRow=((BitsPerComponent * Width) / 8) * ComponentsPerPixel;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef gtx = CGBitmapContextCreate(&pixelData[0], Width, Height, BitsPerComponent, BytesPerRow, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedLast);
    
    // create the image:
    CGImageRef toCGImage = CGBitmapContextCreateImage(gtx);
    UIImage * uiimage = [[UIImage alloc] initWithCGImage:toCGImage];
    
    CGContextRelease(gtx);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(toCGImage);
    free(pixelData);
    free(floating);
    
    return uiimage;
}
@end
