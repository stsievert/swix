//
//  twoD-image.swift
//  swix
//
//  Created by Scott Sievert on 7/30/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

/* 
 *   some other useful tips that need an iOS app to use:
 *    1. UIImage to raw array[0]:
 *    2. raw array to UIImage[1]:
 *  
 *   for a working implementation, see[2] (to be published shortly)
 *  
 *   [0]:http://stackoverflow.com/a/1262893/1141256
 *   [1]:http://stackoverflow.com/a/12868860/1141256
 *   [2]:https://github.com/scottsievert/saliency/blob/master/AVCam/AVCam/saliency/imageToRawArray.m
 *
 *
 */

import Foundation

func rgb2hsv_pixel(R:Double, G:Double, B:Double)->(Double, Double, Double){
    // tested against wikipedia/HSL_and_HSV. returns (H, S_hsv, V)
    var M = max(array(R, G, B))
    var m = min(array(R, G, B))
    var C = M - m
    var Hp:Double = 0
    if      M==R {Hp = ((G-B)/C) % 6}
    else if M==G {Hp = ((B-R)/C) + 2}
    else if M==B {Hp = ((R-G)/C) + 4}
    var H = 60 * Hp
    var V = M
    var S = 0.0
    if !(V==0) {S = C/V}
    
    return (H, S, V)
}


func rgb2hsv(r:matrix, g:matrix, b:matrix)->(matrix, matrix, matrix){
    assert(r.shape.0 == g.shape.0)
    assert(b.shape.0 == g.shape.0)
    assert(r.shape.1 == g.shape.1)
    assert(b.shape.1 == g.shape.1)
    var h = zeros_like(r)
    var s = zeros_like(g)
    var v = zeros_like(b)
    for i in 0..<r.shape.0{
        for j in 0..<r.shape.1{
            var (h_p, s_p, v_p) = rgb2hsv_pixel(r[i,j], g[i,j], b[i,j])
            h[i,j] = h_p
            s[i,j] = s_p
            v[i,j] = v_p
        }
    }
    return (h, s, v)
}
func rgb2_hsv_vplane(r:matrix, g:matrix, b:matrix)->matrix{
    return max(max(r, g), b)
}


func savefig(x:matrix, filename:String, save:Bool=true, show:Bool=false){
    // assumes Python is on your $PATH and pylab/etc are installed
    // prefix should point to the swix folder!
    // prefix is defined in numbers.swift
    // assumes python is on your path
    write_csv(x, filename:"swix/temp.csv")
    system("cd "+S2_PREFIX+"; "+PYTHON_PATH + " imshow.py \(filename) \(save) \(show)")
    system("rm "+S2_PREFIX+"temp.csv")
}
func imshow(x: matrix){
    savefig(x, "junk", save:false, show:true)
}

//func UIImageToRGBA(image:UIImage)->(matrix, matrix, matrix, matrix){
//    // returns red, green, blue and alpha channels
//    
//    // init'ing
//    var imageRef = image.CGImage
//    var width = CGImageGetWidth(imageRef)
//    var height = CGImageGetHeight(imageRef)
//    var colorSpace = CGColorSpaceCreateDeviceRGB()
//    var bytesPerPixel = 4
//    var bytesPerRow:UInt = UInt(bytesPerPixel) * UInt(width)
//    var bitsPerComponent:UInt = 8
//    var pix = Int(width) * Int(height)
//    var count:Int = 4*Int(pix)
//    
//    // pulling the color out of the image
//    var rawData:[CUnsignedChar] = Array(count:count, repeatedValue:0)
//    var bitmapInfo = CGBitmapInfo.fromRaw(CGImageAlphaInfo.PremultipliedLast.toRaw())!
//    var context = CGBitmapContextCreate(&rawData, UInt(width), UInt(height), bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo)
//    CGContextDrawImage(context, CGRectMake(0,0,CGFloat(width), CGFloat(height)), imageRef)
//    
//    
//    // unsigned char to double conversion
//    var rawDataArray = zeros(count)-1
//    vDSP_vfltu8D(&rawData, 1, &rawDataArray.grid, 1, count.length)
//    
//    // pulling the RGBA channels out of the color
//    var i = arange(pix)
//    var r = zeros((Int(height), Int(width)))-1;
//    r.flat = rawDataArray[4*i+0]
//    
//    var g = zeros((Int(height), Int(width)));
//    g.flat = rawDataArray[4*i+1]
//    
//    var b = zeros((Int(height), Int(width)));
//    b.flat = rawDataArray[4*i+2]
//    
//    var a = zeros((Int(height), Int(width)));
//    a.flat = rawDataArray[4*i+3]
//    return (r, g, b, a)
//}
//func RGBAToUIImage(r:matrix, g:matrix, b:matrix, a:matrix)->UIImage{
//    // setup
//    var height = r.shape.0
//    var width = r.shape.1
//    var area = height * width
//    var componentsPerPixel = 4 // rgba
//    var compressedPixelData = zeros(4*area)
//    var N = width * height
//    
//    // double to unsigned int
//    var i = arange(N)
//    compressedPixelData[4*i+0] = r.flat
//    compressedPixelData[4*i+1] = g.flat
//    compressedPixelData[4*i+2] = b.flat
//    compressedPixelData[4*i+3] = a.flat
//    var pixelData:[CUnsignedChar] = Array(count:area*componentsPerPixel, repeatedValue:0)
//    vDSP_vfixu8D(&compressedPixelData.grid, 1, &pixelData, 1, vDSP_Length(componentsPerPixel*area))
//    
//    // creating the bitmap context
//    var colorSpace = CGColorSpaceCreateDeviceRGB()
//    var bitsPerComponent = 8
//    var bytesPerRow = ((bitsPerComponent * width) / 8) * componentsPerPixel
//    var bitmapInfo = CGBitmapInfo.fromRaw(CGImageAlphaInfo.PremultipliedLast.toRaw())!
//    var context = CGBitmapContextCreate(&pixelData, UInt(width), UInt(height), UInt(bitsPerComponent), UInt(bytesPerRow), colorSpace, bitmapInfo)
//    
//    // creating the image
//    var toCGImage = CGBitmapContextCreateImage(context)
//    var image:UIImage = UIImage.init(CGImage:toCGImage)
//    return image
//}
//func resizeImage(image:UIImage, shape:(Int, Int)) -> UIImage{
//    // nice variables
//    var (height, width) = shape
//    var cgSize = CGSizeMake(width, height)
//    
//    // draw on new CGSize
//    UIGraphicsBeginImageContextWithOptions(cgSize, false, 0.0)
//    image.drawInRect(CGRectMake(0, 0, width, height))
//    var newImage = UIGraphicsGetImageFromCurrentImageContext()
//    UIGraphicsEndImageContext()
//    return newImage
//}
