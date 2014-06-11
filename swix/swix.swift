//
//  swiix.swift
//  swiix
//
//  Created by Scott Sievert on 6/10/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate

// nice initing
func ones(length: Int) -> Array<Double> {
    var x = Array(count: length, repeatedValue: 1.0)
    return x
}
func zeros(length: Int) -> Array<Double> {
    var x = Array(count: length, repeatedValue: 0.0)
    return x
}
func zeros(length: (Int, Int)) -> Array<Array<Double>> {
    /* returns two dimensional array of zeros */
    // from http://stackoverflow.com/questions/24051490/multidimensional-arrays-in-swift
    var NumColumns = length.0
    var NumRows = length.1
    
    var array = Array<Array<Double>>()
    for column in 0..NumColumns {
        array.append(Array(count:NumRows, repeatedValue:Double(0)))
    }
    return array
}

func println(x: Array<Array<Double>>)  {
    /* print arrays nicely for small arrays. not nice for larger arrays */
    let NumRows = x.count
    for i in 0..NumRows{
        if i==0{
            print("array(")
        }else{
            print("      ")
        }
        print(x[i])
        if i==(NumRows-1){
            print(")")
        }
        print("\n")
    }
}

// calling BLAS functions for dot, vec, +-*/ etc
func dot(left: Array<Double>, right: Array<Double>){
    println("in dot product")
}


// EQUALITY OPERATORS
// ~== : almost equal
operator infix ~== {associativity none precedence 140}
func ~== (left: Array<Double>, right: Array<Double>) -> Bool{
    if left.count != right.count{
        println("`~=` only works with arrays of equal size!")
    }
    assert(left.count == right.count)
    var N = left.count
    var x = zeros(N)
    var not_false = 0
    for i in 0..N{
        if (left[i] - right[i]) > 1e-9{
            return false
        }
    }
    return true
}
// ==
operator infix == {associativity none precedence 140}
func == (left: Array<Double>, right: Array<Double>) -> Bool{
    if left.count != right.count{
        println("`==` only works with arrays of equal size!")
    }
    assert(left.count == right.count)
    var N = left.count
    var x = zeros(N)
    var not_false = 0
    for i in 0..N{
        if left[i] != right[i]{
            return false
        }
    }
    return true
}

// ARTITHEMETIC OPERATORS
// +
operator infix + {associativity none precedence 140}
func + (left: Array<Double>, right: Array<Double>) -> Array<Double>{
    if left.count != right.count{
        println("`+` only works with arrays of equal size!")
    }
    assert(left.count == right.count)
    var N = left.count
    var x = zeros(N)
    for i in 0..N{
        x[i] = left[i] + right[i]
    }
    return x

}
func + (left: Double, right: Array<Double>) -> Array<Double>{
    var N = right.count
    var x = zeros(N)
    for i in 0..N{
        x[i] = left + right[i]
    }
//    var input = left.bridgeToObjectiveC().doubleValue
//    var inreal: CMutablePointer<Double> = &input
//    println(inreal)
//    vDSP_vsaddD(right, 1, input, inreal.value, 1, N)
    return x
}
func + (left: Array<Double>, right: Double) -> Array<Double>{
    var N = left.count
    var x = zeros(N)
    for i in 0..N{
        x[i] = left[i] + right
    }
    return x
}
// -
operator infix - {associativity none precedence 140}
func - (left: Array<Double>, right: Array<Double>) -> Array<Double>{
    if left.count != right.count{
        println("`+` only works with arrays of equal size.")
    }
    assert(left.count == right.count)
    var N = left.count
    var x = zeros(N)
    for i in 0..N{
        x[i] = left[i] - right[i]
    }
    return x
}
func - (left: Double, right: Array<Double>) -> Array<Double>{
    var N = right.count
    var x = zeros(N)
    for i in 0..N{
        x[i] = left - right[i]
    }
    return x
}
func - (left: Array<Double>, right: Double) -> Array<Double>{
    var N = left.count
    var x = zeros(N)
    for i in 0..N{
        x[i] = left[i] - right
    }
    return x
}


// *
operator infix * {associativity none precedence 140}
func * (left: Array<Double>, right: Array<Double>) -> Array<Double>{
    if left.count != right.count{
        println("`*` only works with arrays of equal size. It does element wise multiplication, not dot product (like NumPy)")
    }
    assert(left.count == right.count)
    var N = left.count
    var x = zeros(N)
    for i in 0..N{
        x[i] = left[i] * right[i]
    }
    return x
}
func * (left: Double, right: Array<Double>) -> Array<Double>{
    var N = right.count
    var x = zeros(N)
    for i in 0..N{
        x[i] = left * right[i]
    }
    return x
}
func * (left: Array<Double>, right: Double) -> Array<Double>{
    var N = left.count
    var x = zeros(N)
    for i in 0..N{
        x[i] = left[i] * right
    }
    return x
}
// /
operator infix / {associativity none precedence 140}
func / (left: Array<Double>, right: Array<Double>) -> Array<Double>{
    if left.count != right.count{
        println("`/` only works with arrays of equal size. It does element wise multiplication")
    }
    assert(left.count == right.count)
    var N = left.count
    var x = zeros(N)
    for i in 0..N{
        x[i] = left[i] / right[i]
    }
    return x
}
func / (left: Double, right: Array<Double>) -> Array<Double>{
    var N = right.count
    var x = zeros(N)
    for i in 0..N{
        x[i] = left / right[i]
    }
    return x
}
func / (left: Array<Double>, right: Double) -> Array<Double>{
    var N = left.count
    var x = zeros(N)
    for i in 0..N{
        x[i] = left[i] / right
    }
    return x
}
