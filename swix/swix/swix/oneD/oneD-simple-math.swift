//
//  oneD_math.swift
//  swix
//
//  Created by Scott Sievert on 6/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//


import Foundation
import Accelerate


// SLOW PARTS: almost everything
//  to speed up first: abs, sign, norm, rand, randn

/// applies the function to every element of an array and takes only that argument. This is just a simple for-loop. If you want to use some custom fancy function, define it yourself.
func apply_function(function: Double->Double, x: matrix) -> matrix{
    var y = zeros(x.count)
    for i in 0..<x.count{
        y[i] = function(x[i])
    }
    return y
}
func apply_function(function: String, x: matrix)->matrix{
    var y = zeros_like(x)
    var n = vDSP_Length(x.n)
    if function=="abs"{
        vDSP_vabsD(!x, 1, !y, 1, n);}
    else if function=="sign"{
        sign_objc(!x, !y, x.n.cint)}
    else if function=="cumsum"{
        cumsum_objc(!x, !y, x.n.cint)}
    else {assert(false, "Function not recongized")}
    return y
}
// OPTIMIZED FUNCTIONS
func sum(x: matrix) -> Double{
    return sum_objc(!x, x.n.cint)}
func avg(x: matrix) -> Double{
    return sum(x) / x.n}
func std(x: matrix) -> Double{
    return sqrt(variance(x))}
func variance(x: matrix) -> Double{
    return sum(pow(x - avg(x), 2) / x.count.double)}
func cumsum(x: matrix) -> matrix{
    return apply_function("cumsum", x)}
func rand(N: Int, seed:Int=42) -> matrix{
    var x = zeros(N)
    rand_objc(!x, N.cint, seed.cint, 1)
    return x
}
func randn(N: Int, mean: Double=0, sigma: Double=1, seed:Int=42) -> matrix{
    var x = zeros(N)
    rand_objc(!x, N.cint, seed.cint, 3)
    var y = (x * sigma) + mean;
    return y
}
func min(x: matrix, absValue:Bool=false) -> Double{
    return min_objc(!x, x.n.cint)}
func max(x: matrix, absValue:Bool=false) -> Double{
    return max_objc(!x, x.n.cint)}
func sign(x: matrix)->matrix{
    return apply_function("sign", x)}
func abs(x: matrix) -> matrix{
    return apply_function("abs", x)}

// optimized for power==2
func pow(x: matrix, power: Double) -> matrix{
    var y = zeros(x.count)
    if power==2{
        vDSP_vsqD(!x, 1, !y, 1, vDSP_Length(x.n.cint))
    } else{
        if close(2, power) {
            println("Careful! Large speed optimization missed because power not exactly 2!")
        }
        for i in 0..<x.count{
            y[i] = pow(x[i], power)}
    }
    return y
}

// UNOPTIMIZED FUNCTIONS
func sin(x: matrix) -> matrix{
    return apply_function(sin, x)
}
func cos(x: matrix) -> matrix{
    return apply_function(cos, x)
}
func tan(x: matrix) -> matrix{
    return apply_function(tan, x)
}
/// log_e(.)
func log(x: matrix) -> matrix{
    var y = apply_function(log, x)
    return y
}
func sqrt(x: matrix) -> matrix{
    var y = apply_function(sqrt, x)
    return y
}
func round(x: matrix) -> matrix{
    return apply_function(round, x)
}
func floor(x: matrix) -> matrix{
    var y = apply_function(floor, x)
    return y
}
func ceil(x: matrix) -> matrix{
    var y = apply_function(ceil, x)
    return y
}
func sign(x: Double) -> Double{
    return x < 0 ? -1 : 1}
func norm(x: matrix, type:String="l2") -> Double{
    if type=="l2"{ return sqrt(sum(pow(x, 2)))}
    if type=="l1"{ return sum(abs(x))}
    if type=="l0"{
        var count = 0.0
        for i in 0..<x.n{
            if x[i] != 0{
                count += 1}}
        return count}
    assert(false, "type of norm unrecongnized")
    return -1.0
}
func close(x: Double, y: Double)->Bool{
    return abs(x-y)<1e-9 ? true : false
}









