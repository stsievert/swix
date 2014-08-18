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


var x = arange(4*4).reshape((4,4))


x[0..<3, 1] = array(1, 2, 3)
println(x[2..<4, 1])
x[2..<4, 1] = array(-4, -29)
x[1, 2..<4] = array(-5, -30)
println(x)








