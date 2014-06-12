//
//  twoD_math.swift
//  swix
//
//  Created by Scott Sievert on 6/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
func apply_function(function: Double->Double, x: matrix2d) -> matrix2d{
    var y = zeros((x.count, x[0].count))
    for i in 0..x.count{
        for j in 0..x[0].count{
            y[i][j] = function(x[i][j])
        }
    }
    return y
}
func sin(x: matrix2d) -> matrix2d{
    var y = apply_function(sin, x)
    return y
}
func cos(x: matrix2d) -> matrix2d{
    var y = apply_function(cos, x)
    return y
}
func tan(x: matrix2d) -> matrix2d{
    var y = apply_function(tan, x)
    return y
}
func log(x: matrix2d) -> matrix2d{
    var y = apply_function(log, x)
    return y
}
func abs(x: matrix2d) -> matrix2d{
    var y = apply_function(abs, x)
    return y
}
func sqrt(x: matrix2d) -> matrix2d{
    var y = apply_function(sqrt, x)
    return y
}
func pow(x: matrix2d, power: Double) -> matrix2d{
    var y = zeros((x.count, x[0].count))
    for i in 0..x.count{
        for j in 0..x[0].count{
            y[i][j] = pow(x[i][j], power)
        }
    }
    return y
}
func sum(x: matrix2d) -> Double{
    var s: Double = 0
    for i in 0..x.count{
        for j in 0..x[0].count{
            s = x[i][j] + s
        }
    }
    return s
}

func avg(x: matrix2d) -> Double{
    var y: Double = sum(x)
    
    return y / Double(x.count)
}
func std(x: matrix2d) -> Double{
    var y: Double = avg(x)
    var z = x - y
    return sqrt(sum(pow(z, 2) / Double(x.count)))
}
func variance(x: matrix2d) -> Double{
    var y: Double = avg(x)
    var z = x - y
    return sum(pow(z, 2) / Double(x.count))
}
func l2norm(x: matrix2d) -> Double{
    return sqrt(sum(pow(x, 2)))
}
func l1norm(x: matrix2d) -> Double{
    return sqrt(sum(abs(x)))
}
func l0norm(x: matrix2d) -> Double{
    var norm = 0
    for i in 0..x.count{
        for j in 0..x[0].count{
            if x[i][j] != 0{
                norm += 1
            }
        }
    }
    return Double(norm)
}













