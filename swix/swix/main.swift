//
//  main.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

// For these tests, we're going to assume "easy" functions work like normal (abs, sum, pow, etc). It's the operators and stuff like that we want to test.

import Foundation

// TESTS
let N = 10

func operator_test(){
    var x = ones(N)
    var y = ones(N) * N.double
    assert(y / x == ones(N) * 10)
    println("    basic 1d operators work")
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

println("running tests...")
operator_test()
range_test()

//var x = ones(N)
//x[3] = 2
//var y = argwhere(x < 2)
//println(x < 2)
//println(y)
var x = ones(N)
println(x + 10)



