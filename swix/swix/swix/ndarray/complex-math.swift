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
    fft_objc(!x, N, !yr, !yi);
    
    // this divide seems wrong
    yr /= 2.0
    yi /= 2.0
    return (yr, yi)
}
func ifft(yr: ndarray, yi: ndarray) -> ndarray{
    var N = yr.n
    var x = zeros(N)
    ifft_objc(!yr, !yi, N.cint, !x);
    
    // this divide seems wrong
    x /= 16.0
    return x
}