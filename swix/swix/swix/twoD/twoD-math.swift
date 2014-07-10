//
//  twoD-math.swift
//  swix
//
//  Created by Scott Sievert on 7/10/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

func apply_function(function: matrix->matrix, x: matrix2d)->matrix2d{
    var y = function(x.flat)
    var z = zeros_like(x)
    z.grid = y.grid
    return z
}
func sin(x: matrix2d) -> matrix2d{
    return apply_function(sin, x)
}
func cos(x: matrix2d) -> matrix2d{
    return apply_function(cos, x)
}
func tan(x: matrix2d) -> matrix2d{
    return apply_function(tan, x)
}
func log(x: matrix2d) -> matrix2d{
    return apply_function(log, x)
}
func abs(x: matrix2d) -> matrix2d{
    return apply_function(abs, x)
}
func sqrt(x: matrix2d) -> matrix2d{
    return apply_function(sqrt, x)
}
func floor(x: matrix2d) -> matrix2d{
    return apply_function(floor, x)
}
func ceil(x: matrix2d) -> matrix2d{
    return apply_function(ceil, x)
}
func randn(N: (Int, Int), mean: Double=0, sigma: Double=1) -> matrix2d{
    var x = zeros(N)
    for i in 0..<x.n{
        x.grid[i] = randn()
    }
    var y = (x * sigma) + mean;
    y.flat = asmatrix(y.grid)
    return y
}
func rand(N: (Int, Int)) -> matrix2d{
    var x = zeros(N)
    for i in 0..<x.n{
        x.grid[i] = rand()
    }
    x.flat = asmatrix(x.grid)
    return x
}






//func pow(x: matrix2d) -> matrix2d{
//    return apply_function(pow, x)
//}
//func pow(x: matrix, power: Double) -> matrix{
//    var y = zeros(x.count)
//    for i in 0..<x.count{
//        y[i] = pow(x[i], power)
//    }
//    return y
//}
//func sum(x: matrix) -> Double{
//    var y = zeros(x.count)
//    var s: Double = 0
//    for i in 0..<x.count{
//        s = x[i] + s
//    }
//    return s
//}
//func avg(x: matrix) -> Double{
//    var y: Double = sum(x)
//    
//    return y / x.count.double
//}
//func std(x: matrix) -> Double{
//    var y: Double = avg(x)
//    var z = x - y
//    return sqrt(sum(pow(z, 2) / x.count.double))
//}
///// variance used since var is a keyword
//func variance(x: matrix) -> Double{
//    var y: Double = avg(x)
//    var z = x - y
//    return sum(pow(z, 2) / x.count.double)
//}
//func norm(x: matrix, type:String="l2") -> Double{
//    if type=="l2"{ return sqrt(sum(pow(x, 2)))}
//    if type=="l1"{ return sum(abs(x))}
//    if type=="l0"{
//        var count = 0.0
//        for i in 0..<x.n{
//            if x[i] != 0{
//                count += 1
//            }
//        }
//        return count
//    }
//    
//    assert(false, "type of norm unrecongnized")
//    return -1.0
//}
//func cumsum(x: matrix) -> matrix{
//    let N = x.count
//    var y = zeros(N)
//    for i in 0..<N{
//        if i==0      { y[i] = x[0]          }
//        else if i==1 { y[i] = x[0] + x[1]   }
//        else         { y[i] = x[i] + y[i-1] }
//    }
//    return y
//}













