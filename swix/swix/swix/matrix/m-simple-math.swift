//
//  twoD-math.swift
//  swix
//
//  Created by Scott Sievert on 7/10/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate

func apply_function(function: ndarray->ndarray, x: matrix)->matrix{
    var y = function(x.flat)
    var z = zeros_like(x)
    z.flat = y
    return z
}

// TRIG
func sin(x: matrix) -> matrix{
    return apply_function(sin, x)
}
func cos(x: matrix) -> matrix{
    return apply_function(cos, x)
}
func tan(x: matrix) -> matrix{
    return apply_function(tan, x)
}
func tanh(x: matrix) -> matrix {
    return apply_function(tanh, x)
}

// BASIC INFO
func abs(x: matrix) -> matrix{
    return apply_function(abs, x)
}
func sign(x: matrix) -> matrix{
    return apply_function(sign, x)
}

// POWER FUNCTION
func pow(x: matrix, power: Double) -> matrix{
    var y = pow(x.flat, power)
    var z = zeros_like(x)
    z.flat = y
    return z
}
func sqrt(x: matrix) -> matrix{
    return apply_function(sqrt, x)
}

// ROUND
func floor(x: matrix) -> matrix{
    return apply_function(floor, x)
}
func ceil(x: matrix) -> matrix{
    return apply_function(ceil, x)
}
func round(x: matrix) -> matrix{
    return apply_function(round, x)
}

// LOG
func log(x: matrix) -> matrix{
    return apply_function(log, x)
}

// BASIC STATS
func min(x:matrix, y:matrix)->matrix{
    var z = zeros_like(x)
    z.flat = min(x.flat, y.flat)
    return z
}
func max(x:matrix, y:matrix)->matrix{
    var z = zeros_like(x)
    z.flat = max(x.flat, y.flat)
    return z
}


// AXIS
func sum(x: matrix, axis:Int = -1) -> ndarray{
    // arg dim: indicating what dimension you want to sum over. For example, if dim==0, then it'll sum over dimension 0 -- it will add all the numbers in the 0th dimension, x[0..<x.shape.0, i]
    assert(axis==0 || axis==1, "if you want to sum over the entire matrix, call `sum(x.flat)`.")
    if axis==1{
        var n = x.shape.1
        var m = ones((n,1))
        return (x *! m).flat
    }
    else if axis==0 {
        var n = x.shape.0
        var m = ones((1,n))
        return (m *! x).flat
    }
    
    // the program will never get below this line
    assert(false)
    return zeros(1)
}
func prod(x: matrix, axis:Int = -1) -> ndarray{
    assert(axis==0 || axis==1, "if you want to sum over the entire matrix, call `sum(x.flat)`.")
    var y = log(x)
    var z = sum(y, axis:axis)
    return exp(z)
}
func mean(x:matrix, axis:Int = -1) -> ndarray{
    assert(axis==0 || axis==1, "If you want to find the average of the whole matrix call `mean(x.flat)`")
    var div = axis==0 ? x.shape.0 : x.shape.1
    return sum(x, axis:axis) / div.double
}















