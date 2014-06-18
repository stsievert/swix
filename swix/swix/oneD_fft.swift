//
//  oneD_fft.swift
//  swix
//
//  Created by Scott Sievert on 6/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate



/// drops into objc to compute. returns an UnsafePointer. accessible through y[i].real or y[i].imag and for loops -- does not conform to +-*/ etc
func fft(x: matrix) -> (matrix, matrix){
/*
 *
 *  Be warned: returns a plain c style array accessible through for-loops. Returns an UnsafePointer<DSPDoubleComplex>; I think I'm going to use 
 *
 *      Usage example:
 *      var x = arange(8)
 *      y = fft(x)
 *      for i in 0..x.count{
 *          print(y[i].real)
 *          println(y[i].imag)
 *      }
 *
 */
    let N = x.count
    var arg1 = NSArray(array: x)
    var yy = fft_objc(arg1)

    // yr = y.real, yi = y.imag
    var yr = zeros(x.count)
    var yi = zeros(x.count)
    
    // slow but nice
    for i in 0..x.count{
        yr[i] = yy[i].real
        yi[i] = yy[i].imag
    }
    return (yr, yi)
}

/// computes the ifft of the complex UnsafePointer returned by fft
func ifft(yr: matrix, yi: matrix) -> matrix{
    let N = yr.count
    assert(yr.count == yi.count)
    var yyr = NSArray(array: yr)
    var yyi = NSArray(array: yi)
    var x = ifft_objc(yyr, yyi, CInt(N));
    var x2 = convertDoubleToMatrix(x, N)
    return x2
}
