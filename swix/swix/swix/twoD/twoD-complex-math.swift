//
//  twoD-complex-math.swift
//  swix
//
//  Created by Scott Sievert on 7/15/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

func svd(x: matrix2d) -> (matrix2d, matrix, matrix2d){
    // 2014-7-15: almost have this working. to change by tomorrow.
    var (m, n) = x.shape
    var nS = m < n ? m : n
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
    
    println(x)
    svd_objc(xP, m.cint, n.cint, sP, vP, uP);
    if m > n {vt = transpose(vt)}

    println(sigma)
    println(vt)
    println(u)

    return (zeros((2,2)), zeros(2), zeros((2,2)))
}