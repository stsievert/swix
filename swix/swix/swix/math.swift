//
//  math.swift
//  swix
//
//  Created by Scott Sievert on 7/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate

// fft, ifft, dot product, haar wavelet
func dot(x: matrix2d, y: matrix2d) -> matrix2d{
    var (Mx, Nx) = x.shape
    var (My, Ny) = y.shape
    assert(Nx == My, "Matrix sizes not compatible for dot product")
    var z = zeros((Mx, Ny))
    
    dot_objc(!x, !y, !z, Mx.cint, Ny.cint, Nx.cint)
    
    return z
}


func fft(x: ndarray) -> (ndarray, ndarray){
    var N:CInt = x.n.cint
    var yr = zeros(N.int)
    var yi = zeros(N.int)
    fft_objc(!x, N, !yr, !yi);
    
    return (yr, yi)
}
func ifft(yr: ndarray, yi: ndarray) -> ndarray{
    var N = yr.n
    var x = zeros(N)
    ifft_objc(!yr, !yi, N.cint, !x);

    return x
}