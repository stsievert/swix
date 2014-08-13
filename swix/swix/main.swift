//
//  main.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//


import Foundation
import Swift

var x = eye(4) * 2
var y = x.I
println(x)
println(y)
println(x *! y)

runTests()
//SpeedTests()




