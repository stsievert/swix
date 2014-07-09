//
//  oneD_math.swift
//  swix
//
//  Created by Scott Sievert on 6/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//


import Foundation
import Accelerate

/// applies the function to every element of an array and takes only that argument. This is just a simple for-loop. If you want to use some custom fancy function, define it yourself.
func apply_function(function: Double->Double, x: matrix) -> matrix{
    var y = zeros(x.count)
    for i in 0..<x.count{
        y[i] = function(x[i])
    }
    return y
}
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
/// drops into objc
func abs(x: matrix) -> matrix{
    return apply_function(abs, x)
}
func sqrt(x: matrix) -> matrix{
    var y = apply_function(sqrt, x)
    return y
}
func floor(x: matrix) -> matrix{
    var y = apply_function(floor, x)
    return y
}
func ceil(x: matrix) -> matrix{
    var y = apply_function(ceil, x)
    return y
}
func pow(x: matrix, power: Double) -> matrix{
    var y = zeros(x.count)
    for i in 0..<x.count{
        y[i] = pow(x[i], power)
    }
    return y
}
func sum(x: matrix) -> Double{
    var y = zeros(x.count)
    var s: Double = 0
    for i in 0..<x.count{
        s = x[i] + s
    }
    return s
}
func avg(x: matrix) -> Double{
    var y: Double = sum(x)
    
    return y / x.count.double
}
func std(x: matrix) -> Double{
    var y: Double = avg(x)
    var z = x - y
    return sqrt(sum(pow(z, 2) / x.count.double))
}
/// variance used since var is a keyword
func variance(x: matrix) -> Double{
    var y: Double = avg(x)
    var z = x - y
    return sum(pow(z, 2) / x.count.double)
}
func norm(x: matrix, type:String="l2") -> Double{
    if type=="l2"{ return sqrt(sum(pow(x, 2)))}
    if type=="l1"{ return sum(abs(x))}
    if type=="l0"{
        var count = 0.0
        for i in 0..<x.n{
            if x[i] != 0{
                count += 1
            }
        }
        return count
    }
    
    assert(false, "type of norm unrecongnized")
    return -1.0
}
func cumsum(x: matrix) -> matrix{
    let N = x.count
    var y = zeros(N)
    for i in 0..<N{
        if i==0      { y[i] = x[0]          }
        else if i==1 { y[i] = x[0] + x[1]   }
        else         { y[i] = x[i] + y[i-1] }
    }
    return y
}
func rand() -> Double{
    return Double(arc4random()) / pow(2, 32)
}
func rand(N: Int) -> matrix{
    var x = zeros(N)
    for i in 0..<N{
        x[i] = rand()
    }
    return x
}
func randn() -> Double{
    var u:Double = rand()
    var v:Double = rand()
    var x = sqrt(-2*log(u))*cos(2*pi*v);
    return x
}
func randn(N: Int, mean: Double=0, sigma: Double=1) -> matrix{
    var x = zeros(N)
    for i in 0..<N{
        x[i] = randn()
    }
    var y = (x * sigma) + mean;
    return y
}









