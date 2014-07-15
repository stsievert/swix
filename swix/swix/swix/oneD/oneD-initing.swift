//
//  initing.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate

// SLOW PARTS: array(doubles). not a huge deal

func zeros(N: Int) -> matrix{
    return matrix(n: N)
}
func ones(N: Int) -> matrix{
    return matrix(n: N)+1
}
func arange(max: Double, x exclusive:Bool = true) -> matrix{
    var x = arange(0, max, x:exclusive)
    return x
}
func arange(min: Double, max: Double, x exclusive: Bool = true) -> matrix{
    var pad = 0
    if !exclusive {pad = 1}
    let N = max.int - min.int + pad
    var x = zeros(N)
    var xP = matrixToPointer(x)
    var minP = CDouble(min)
    
    linspace_objc(xP, (N+pad).cint, (minP), 1.0)
    return x
}
func linspace(min: Double, max: Double, num: Int=50) -> matrix{
    var x = zeros(num+1)
    var xP = matrixToPointer(x)
    linspace_objc(xP, 1+num.cint, min.cdouble, ((max-min)/num).double)
    return x
}
func array(numbers: Double...) -> matrix{
    var x = zeros(numbers.count)
    var i = 0
    for number in numbers{
        x[i] = number
        i++
    }
    return x
}
func repeat(x: matrix, N:Int, how:String="matrix") -> matrix{
    var y = zeros(x.n * N)
    var xP = matrixToPointer(x)
    var yP = matrixToPointer(y)
    CVWrapper.repeat(xP, to:yP, n_x:x.n.cint, n_repeat:N.cint)
    var z = zeros((x.n, N))
    z.flat = y
    if how=="matrix" {z = transpose(z)}
    else if how=="elements" {}
    return z.flat
}




















