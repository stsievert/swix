//
//  main.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

// some other useful tips that need an iOS app to use:
//  1. UIImage to raw array: http://stackoverflow.com/a/1262893/1141256
//  2. raw array to UIImage: http://stackoverflow.com/a/12868860/1141256

// For these tests, we're going to assume "easy" functions work like normal (abs, sum, pow, etc). It's the operators and stuff like that we want to test.

import Foundation

// TESTS
let N = 10

func operator_test(){
    func operator2d_test(){
        var x = zeros((N,N)) + 10
        var y = 4+ones((N,N))
        assert(0.2 * x*y / 10 == ones((N,N)))
    }
    operator2d_test()
    var x = ones(N)
    var y = ones(N) * N.double
    assert(y / x == ones(N) * 10)
    println("    basic 1d and 2d operators work")
}
func range_test(){
    var x = arange(4)
    var y = x[0..<2]
    assert(y == arange(2))
    
    var z = zeros(4)
    z[0..<2] = ones(2)
    assert(z == array(1, 1, 0, 0))
    println("    x[0..<2] = ones(2) and y = z[3..<8] works in the 1d case!")
}
func argwhere_test(){
    var x = zeros(N)
    var y = zeros(N)
    x[0..<5] = ones(5)
    var i = argwhere(x ~== y)
    assert(i == array(5, 6, 7, 8, 9))
    x[argwhere(x<2)] = ones(argwhere(x<2).n)
    println("    can use argwhere. x[argwhere(x<2)]=zeros(argwhere(x<2).n)  works for both 1d and 2d.")
}
func matrix2d_indexing_test(){
    var x = array("1 2 3; 4 5 6; 7 8 9")
    x[0|2, 0|2] = ones((2,2))
    assert(x == array("1 1 3; 1 1 6; 7 8 9"))
    println("    use x[0|2, 0|2] to index *exclusively* (and 0!2 for inclusive)")
    println("    can use x[0|2, 1], x[1, 0..<2] or x[0..<2, 0|2] to also index")
}
func matrix2d_indexing_matrix_test(){
    var x = array("1 2 3; 4 5 6; 7 8 9")
    assert(x[array(0, 1, 2, 3, 4, 5)] == array(1, 2, 3, 4, 5, 6))
    println("    x[matrix] works and indexes the matrix row first")
}

println("running tests...")
operator_test()
range_test()
argwhere_test()
matrix2d_indexing_test()
matrix2d_indexing_matrix_test()

var x = ones(8)
var (Yr, Yi) = fft(x)
println(Yr)
println(Yi)

var xR = ifft(Yr, Yi)
println(xR)













