//
//  oneD_math.swift
//  swix
//
//  Created by Scott Sievert on 6/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

func apply_function(function: Double->Double, x: Array<Double>) -> Array<Double>{
    var y = zeros(x.count)
    for i in 0..x.count{
        y[i] = function(x[i])
    }
    return y
}

//* fft, fft2, ifft, ifft2
//* logical and, or, not
//* l0, l1, l2 norm
//* real, imag, conj
//* diag


func sin(x: Array<Double>) -> Array<Double>{
    var y = apply_function(sin, x)
    return y
}
func cos(x: Array<Double>) -> Array<Double>{
    var y = apply_function(cos, x)
    return y
}
func tan(x: Array<Double>) -> Array<Double>{
    var y = apply_function(tan, x)
    return y
}
func log(x: Array<Double>) -> Array<Double>{
    var y = apply_function(log, x)
    return y
}
func abs(x: Array<Double>) -> Array<Double>{
    var y = apply_function(abs, x)
    return y
}
func sqrt(x: Array<Double>) -> Array<Double>{
    var y = apply_function(sqrt, x)
    return y
}
func pow(x: Array<Double>, power: Double) -> Array<Double>{
    var y = zeros(x.count)
    for i in 0..x.count{
        y[i] = pow(x[i], power)
    }
    return y
}
func sum(x: Array<Double>) -> Double{
    var y = zeros(x.count)
    var s: Double = 0
    for i in 0..x.count{
        s = x[i] + s
    }
    return s
}
func avg(x: Array<Double>) -> Double{
    var y: Double = sum(x)
    
    return y / Double(x.count)
}
func std(x: Array<Double>) -> Double{
    var y: Double = avg(x)
    var z = x - y
    return sqrt(sum(pow(z, 2) / Double(x.count)))
}
func variance(x: Array<Double>) -> Double{
    var y: Double = avg(x)
    var z = x - y
    return sum(pow(z, 2) / Double(x.count))
}


