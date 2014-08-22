//
//  math.swift
//  swix
//
//  Created by Scott Sievert on 7/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate


// integration
func cumtrapz(x:ndarray)->ndarray{
    // integrate and see the steps at each iteration
    var y = zeros_like(x)
    var dx:CDouble = 1.0
    vDSP_vtrapzD(!x, 1.stride, &dx, !y, 1.stride, x.n.length)
    return y
}
func trapz(x:ndarray)->Double{
    // integrate and get the final value
    return cumtrapz(x)[-1]
}
// basic definitions
func inner(x:ndarray, y:ndarray)->Double{
    // the inner product. aka dot product, but I use dot product as a short for matrix multiplication
    return sum(x * y)
}
func outer(x:ndarray, y:ndarray)->matrix{
    // the outer product.
    var (xm, ym) = meshgrid(x, y)
    return xm * ym
}
// fourier transforms
func fft(x: ndarray) -> (ndarray, ndarray){
    var N:CInt = x.n.cint
    var yr = zeros(N.int)
    var yi = zeros(N.int)
    
    // setup for the accelerate calling
    var radix:FFTRadix = FFTRadix(FFT_RADIX2)
    var pass:vDSP_Length = vDSP_Length((log2(N.double)+1.0).int)
    var setup:FFTSetupD = vDSP_create_fftsetupD(pass, radix)
    var log2n:Int = (log2(N.double)+1.0).int
    var z = zeros(N.int)
    var x2:DSPDoubleSplitComplex = DSPDoubleSplitComplex(realp: !x, imagp:!z)
    var y = DSPDoubleSplitComplex(realp:!yr, imagp:!yi)
    var dir = FFTDirection(FFT_FORWARD)
    var stride = 1.stride
    
    // perform the actual computation
    vDSP_fft_zropD(setup, &x2, stride, &y, stride, log2n.length, dir)
    
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
    var stride = 1.stride
    
    // doing the actual computation
    vDSP_fft_zropD(setup, &x2, stride, &result, stride, log2n.length, dir)
    
    // this divide seems wrong
    x /= 16.0
    return x
}
func fftconvolve(x:ndarray, kernel:ndarray)->ndarray{
    // convolve two arrays using the fourier transform.
    // zero padding, assuming kernel is smaller than x
    var k_pad = zeros_like(x)
    k_pad[0..<kernel.n] = kernel
    
    // performing the fft
    var (Kr, Ki) = fft(k_pad)
    var (Xr, Xi) = fft(x)
    
    // computing the multiplication (yes, a hack)
    // (xr+xi*j) * (yr+yi*j) = xr*xi - xi*yi + j*(xi*yr) + j*(yr*xi)
    var Yr = Xr*Kr - Xi*Ki
    var Yi = Xr*Ki + Xi*Kr
    var y = ifft(Yr, Yi)
    return y
}