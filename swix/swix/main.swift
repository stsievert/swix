//
//  main.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

// For these tests, we're going to assume "easy" functions work like normal (pow, etc). It's the operators and stuff like that we want to test.

import Foundation

// TESTS
let N = 10

func operator_test(){
    var x = ones(N)
    var y = ones(N) * N.double
    assert(y / x == ones(N) * 10)
}

operator_test()
