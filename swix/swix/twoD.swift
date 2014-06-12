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
func zeros(length: (Int, Int)) -> matrix2d {
    /* returns two dimensional array of zeros */
    // help from http://stackoverflow.com/questions/24051490/multidimensional-arrays-in-swift
    var NumColumns = length.0
    var NumRows = length.1
    
    var array = matrix2d()
    for column in 0..NumColumns {
        array.append(Array(count:NumRows, repeatedValue:Double(0)))
    }
    return array
}
func ones(length: (Int, Int)) -> matrix2d {
    /* returns two dimensional array of zeros */
    // help from http://stackoverflow.com/questions/24051490/multidimensional-arrays-in-swift
    var NumColumns = length.0
    var NumRows = length.1
    
    var array = matrix2d()
    for column in 0..NumColumns {
        array.append(Array(count:NumRows, repeatedValue:Double(1)))
    }
    return array
}

// nice printing
func println(x: matrix2d)  {
    /* print arrays nicely for small arrays. not nice for larger arrays */
    let NumRows = x.count
    for i in 0..NumRows{
        if i==0{
            print("matrix(")
        }else{
            print("       ")
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

// ==
operator infix == {associativity none precedence 140}
func == (left: matrix2d, right: matrix2d) -> Bool{
    if left.count != right.count{
        println("`==` only works with arrays of equal size!")
    }
    if left[0].count != right[0].count{
        println("`==` only works with arrays of equal size!")
    }
    assert(left.count == right.count)
    assert(left[0].count == right[0].count)
    var N = left.count
    var M = left[0].count
    for i in 0..M{
        for j in 0..N{
            if left[j][i] != right[j][i]{
                return false
            }
        }
    }
    return true
    
}

// ~~ : about equal
operator infix ~~ {associativity none precedence 140}
func ~~ (left: matrix2d, right: matrix2d) -> Bool{
    if left.count != right.count{
        println("`==` only works with arrays of equal size!")
    }
    if left[0].count != right[0].count{
        println("`==` only works with arrays of equal size!")
    }
    assert(left.count == right.count)
    assert(left[0].count == right[0].count)
    var N = left.count
    var M = left[0].count
    for i in 0..M{
        for j in 0..N{
            if left[j][i] - right[j][i] > 1e-9{
                return false
            }
        }
    }
    return true
}






