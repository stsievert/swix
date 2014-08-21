//
//  main.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//


import Foundation
import Swift


runTests()
//SpeedTests()

var x = array(1, 2, 3, 4).reshape((2,2))
println(x)
println(norm(x, ord:-inf))
println(norm(x, ord:-2))
println(norm(x, ord:-1))
println(norm(x, ord:1))
println(norm(x, ord:2))
println(norm(x, ord:inf))
println(sum(abs(x), axis:1))

