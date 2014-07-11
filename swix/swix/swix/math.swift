//
//  math.swift
//  swix
//
//  Created by Scott Sievert on 7/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

// fft, ifft, dot product, haar wavelet
func fft(x: matrix) -> (matrix, matrix){
    var N:CInt = x.n.cint
    var yr = zeros(N.int)
    var yi = zeros(N.int)

    var xP = matrixToPointer(x)
    var yrP = matrixToPointer(yr)
    var yiP = matrixToPointer(yi)
    
    fft_objc(xP, N, yrP, yiP);
    var yr2 = pointerToMatrix(yrP, N.int)
    var yi2 = pointerToMatrix(yiP, N.int)
    
    return (yr2, yi2)
}
func ifft(yr: matrix, yi: matrix) -> matrix{
    var N = yr.n
    var x = zeros(N)
    var xP = matrixToPointer(x)
    var yrP = matrixToPointer(yr)
    var yiP = matrixToPointer(yi)
    ifft_objc(yrP, yiP, N.cint, xP);

    var x2 = pointerToMatrix(xP, N)
    return x2
}