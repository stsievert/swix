//
//  math.swift
//  swix
//
//  Created by Scott Sievert on 7/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate

// fft, ifft
func fft(x: ndarray) -> (ndarray, ndarray){
    var N:CInt = x.n.cint
    var yr = zeros(N.int)
    var yi = zeros(N.int)
    
    // setup for the accelerate calling
    var radix:FFTRadix = FFTRadix(FFT_RADIX2)
    var pass:vDSP_Length = vDSP_Length((log2(N.double)+1.0).int)
    var setup:FFTSetupD = vDSP_create_fftsetupD(pass, radix)
    var log2n:Int = (log2(N.double)+1.0).int
    var z = zeros(N)
    var x2:DSPDoubleSplitComplex = DSPDoubleSplitComplex(realp: !x, imagp:!z)
    var y = DSPDoubleSplitComplex(realp:!yr, imagp:!yi)
    var dir = FFTDirection(FFT_FORWARD)
    var stride = vDSP_Stride(1)
    
    // perform the actual computation
    vDSP_fft_zropD(setup, &x2, stride, &y, stride, vDSP_Length(log2n), dir)
    
    // this divide seems wrong
    yr /= 2.0
    yi /= 2.0
    return (yr, yi)
}
func ifft(yr: ndarray, yi: ndarray) -> ndarray{
    var N = yr.n
    var x = zeros(N)
    
    // setup for the accelerate calling
    var radix:FFTRadix = FFTRadix(FFT_RADIX2)
    var pass:vDSP_Length = vDSP_Length((log2(N.double)+1.0).int)
    var setup:FFTSetupD = vDSP_create_fftsetupD(pass, radix)
    var log2n:Int = (log2(N.double)+1.0).int
    var z = zeros(N)
    var x2:DSPDoubleSplitComplex = DSPDoubleSplitComplex(realp: !yr, imagp:!yi)
    var result:DSPDoubleSplitComplex = DSPDoubleSplitComplex(realp: !x, imagp:!z)
    var dir = FFTDirection(FFT_INVERSE)
    var stride = vDSP_Stride(1)
    
    // doing the actual computation
    vDSP_fft_zropD(setup, &x2, stride, &result, stride, vDSP_Length(log2n), dir)
    
    // this divide seems wrong
    x /= 16.0
    return x
}