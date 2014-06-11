//
//  twoD_arth.swift
//  swix
//
//  Created by Scott Sievert on 6/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
// ARITHMETIC OPERATORS
// +
operator infix + {associativity none precedence 140}
func + (left: Array<Array<Double>>, right: Array<Array<Double>>) -> Array<Array<Double>>{
    if left.count != right.count{
        println("`+` only works with arrays of equal size!")
    }
    assert(left.count == right.count)
    assert(left[0].count == right[0].count)
    var N = left.count
    var M = left[0].count
    var x = zeros((N, M))
    for i in 0..M{
        for j in 0..N{
            x[j][i] = left[j][i] + right[j][i]
        }
    }
    return x
    
}
func + (left: Array<Array<Double>>, right: Double) -> Array<Array<Double>>{
    var N = left.count
    var M = left[0].count
    var x = zeros((N, M))
    for i in 0..M{
        for j in 0..N{
            x[j][i] = left[j][i] + right
        }
    }
    return x
}
func + (left: Double, right: Array<Array<Double>>) -> Array<Array<Double>>{
    var N = right.count
    var M = right[0].count
    var x = zeros((N, M))
    for i in 0..M{
        for j in 0..N{
            x[j][i] = right[j][i] + left
        }
    }
    return x
}
// *
operator infix * {associativity none precedence 140}
func * (left: Array<Array<Double>>, right: Array<Array<Double>>) -> Array<Array<Double>>{
    if left.count != right.count{
        println("`*` only works with arrays of equal size!")
    }
    assert(left.count == right.count)
    assert(left[0].count == right[0].count)
    var N = left.count
    var M = left[0].count
    var x = zeros((N, M))
    for i in 0..M{
        for j in 0..N{
            x[j][i] = left[j][i] * right[j][i]
        }
    }
    return x
    
}
func * (left: Array<Array<Double>>, right: Double) -> Array<Array<Double>>{
    var N = left.count
    var M = left[0].count
    var x = zeros((N, M))
    for i in 0..M{
        for j in 0..N{
            x[j][i] = left[j][i] * right
        }
    }
    return x
}
func * (left: Double, right: Array<Array<Double>>) -> Array<Array<Double>>{
    var N = right.count
    var M = right[0].count
    var x = zeros((N, M))
    for i in 0..M{
        for j in 0..N{
            x[j][i] = right[j][i] * left
        }
    }
    return x
}
// -
operator infix - {associativity none precedence 140}
func - (left: Array<Array<Double>>, right: Array<Array<Double>>) -> Array<Array<Double>>{
    if left.count != right.count{
        println("`-` only works with arrays of equal size!")
    }
    assert(left.count == right.count)
    assert(left[0].count == right[0].count)
    var N = left.count
    var M = left[0].count
    var x = zeros((N, M))
    for i in 0..M{
        for j in 0..N{
            x[j][i] = left[j][i] - right[j][i]
        }
    }
    return x
    
}
func - (left: Array<Array<Double>>, right: Double) -> Array<Array<Double>>{
    var N = left.count
    var M = left[0].count
    var x = zeros((N, M))
    for i in 0..M{
        for j in 0..N{
            x[j][i] = left[j][i] - right
        }
    }
    return x
}
func - (left: Double, right: Array<Array<Double>>) -> Array<Array<Double>>{
    var N = right.count
    var M = right[0].count
    var x = zeros((N, M))
    for i in 0..M{
        for j in 0..N{
            x[j][i] = right[j][i] - left
        }
    }
    return x
}
// /
operator infix / {associativity none precedence 140}
func / (left: Array<Array<Double>>, right: Array<Array<Double>>) -> Array<Array<Double>>{
    if left.count != right.count{
        println("`/` only works with arrays of equal size!")
    }
    assert(left.count == right.count)
    assert(left[0].count == right[0].count)
    var N = left.count
    var M = left[0].count
    var x = zeros((N, M))
    for i in 0..M{
        for j in 0..N{
            x[j][i] = left[j][i] / right[j][i]
        }
    }
    return x
    
}
func / (left: Array<Array<Double>>, right: Double) -> Array<Array<Double>>{
    var N = left.count
    var M = left[0].count
    var x = zeros((N, M))
    for i in 0..M{
        for j in 0..N{
            x[j][i] = left[j][i] / right
        }
    }
    return x
}
func / (left: Double, right: Array<Array<Double>>) -> Array<Array<Double>>{
    var N = right.count
    var M = right[0].count
    var x = zeros((N, M))
    for i in 0..M{
        for j in 0..N{
            x[j][i] = right[j][i] / left
        }
    }
    return x
}