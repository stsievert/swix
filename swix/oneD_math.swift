//
//  oneD_math.swift
//  swix
//
//  Created by Scott Sievert on 6/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

func sin(x: Array<Double>) -> Array<Double>{
    var y = zeros(x.count)
    for i in 0..x.count{
        y[i] = sin(x[i])
    }
    return y
}
func cos(x: Array<Double>) -> Array<Double>{
    var y = zeros(x.count)
    for i in 0..x.count{
        y[i] = cos(x[i])
    }
    return y
}
func tan(x: Array<Double>) -> Array<Double>{
    var y = zeros(x.count)
    for i in 0..x.count{
        y[i] = tan(x[i])
    }
    return y
}
func log(x: Array<Double>) -> Array<Double>{
    var y = zeros(x.count)
    for i in 0..x.count{
        y[i] = log(x[i])
    }
    return y
}