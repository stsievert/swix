//
//  initing.swift
//  swix
//
//  Created by Scott Sievert on 7/2/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
func diag(x: Double...) -> matrix2d{
    let N = x.count
    var y = zeros((N,N))
    for i in 0..<N{
        y[i][i] = x[i]
    }
    return y
}
func eye(N: Int) -> matrix2d{
    var x = zeros((N,N))
    for i in 0..<N{
        x[i][i] = 1
    }
    return x
}
func linspace(min: Double, max: Double, num: Int=50) -> matrix{
    var x = zeros(num)
    for i in 0..<num{
        x[i] = min + i*(max - min) / num
    }
    return x
}
/// arange(N) = [0, 1, ..., N-1]. use the optional argument `x` to change if this function is exclusive or not. there's a duplicate function arange(min, max)
func arange(max: Double, x exclusive: Bool = true) -> matrix{
    /*
    *   arange(max) == [0.0, 1.0, 2.0]
    *
    *   There's a duplicate function that uses
    *   arange(min, max) == [min, ..., max-1]'
    */
    var pad = 0
    if !exclusive {pad = 1}
    var x = zeros(max.int+pad)
    for i in 0..<max.int+pad{
        x[i] = i.double
    }
    return x
}
func asmatrix(x: Slice<Double>) -> matrix{
    var y = zeros(x.count)
    for i in 0..<x.count{
        y[i] = x[i]
    }
    return y
}
// nice initins
/// ones(3) = [1, 1, 1]
func ones(length: Int) -> matrix {
    var x = Array(count: length, repeatedValue: 1.0)
    var xx = zeros(length)
    return x
}
/// zeros(3) = [0, 0, 0]
func zeros(length: Int) -> matrix {
    // leaving these without Accelerate integration -- gives recursion errors since convertPointerToMatrix depends on zeros
    var x = Array(count: length, repeatedValue: 0.0)
    return x
}

/// make an array out of the supplied numbers. ie, array(1, 2, 3, 4).
func array(numbers: Double...) -> matrix{
    var x = zeros(numbers.count)
    var i = 0
    for number in numbers{
        x[i] = number
        i++
    }
    return x
}
/// arange(M, N) = [M, M+1...N-1]. use optional argument `x` to change if this function is exclusive or not. there's an almost-duplicate function that sets min=0 and only requires max.
func arange(min: Double, max: Double, x exclusive: Bool = true) -> matrix{
    var pad = 0
    if !exclusive {pad = 1}
    var x = zeros(max.int - min.int + pad)
    for i in 0..<max.int-min.int+pad{
        x[i] = i.double + min
    }
    return x
}