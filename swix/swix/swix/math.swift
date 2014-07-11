//
//  math.swift
//  swix
//
//  Created by Scott Sievert on 7/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

// fft, ifft, dot product, haar wavelet
func dot(x: matrix2d, y: matrix2d) -> matrix2d{
    var (Mx, Nx) = x.shape
    var (My, Ny) = y.shape
    assert(Nx == My, "Matrix sizes not compatible for dot product")
    
    var z = zeros((Mx, Ny))
    
    var xP = matrixToPointer(x.flat)
    var yP = matrixToPointer(y.flat)
    var zP = matrixToPointer(z.flat)
    
    dot_objc(xP, yP, zP, Mx.cint, Ny.cint, Nx.cint)
    
    return z
}


func fft(x: matrix) -> (matrix, matrix){
    var N:CInt = x.n.cint
    var yr = zeros(N.int)
    var yi = zeros(N.int)

    var xP = matrixToPointer(x)
    var yrP = matrixToPointer(yr)
    var yiP = matrixToPointer(yi)
    
    fft_objc(xP, N, yrP, yiP);
    
    return (yr, yi)
}
func ifft(yr: matrix, yi: matrix) -> matrix{
    var N = yr.n
    var x = zeros(N)
    var xP = matrixToPointer(x)
    var yrP = matrixToPointer(yr)
    var yiP = matrixToPointer(yi)
    ifft_objc(yrP, yiP, N.cint, xP);

    return x
}