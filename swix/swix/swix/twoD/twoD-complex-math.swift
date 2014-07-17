//
//  twoD-complex-math.swift
//  swix
//
//  Created by Scott Sievert on 7/15/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

func svd(x: matrix2d) -> (matrix2d, matrix, matrix2d){
    var (m, n) = x.shape
    var nS = m < n ? m : n // number singular values
    var sigma = zeros(nS)
    var vt = zeros((n,n))
    var u = zeros((m,m))

    var xx = zeros_like(x)
    xx.flat = x.flat
    xx = transpose(xx)
    var xP = matrixToPointer(xx.flat)
    var sP = matrixToPointer(sigma)
    var vP = matrixToPointer(vt.flat)
    var uP = matrixToPointer(u.flat)
    
    svd_objc(xP, m.cint, n.cint, sP, vP, uP);
    
    // to get the svd result to match Python
    var v = transpose(vt)
//    if m >= n {u = transpose(u)}
    u = transpose(u)

    return (u, sigma, v)
}










