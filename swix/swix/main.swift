//
//  main.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//


import Foundation

runTests()
//SpeedTests()


var x = rand((4,4))
var (u, s, v) = svd(x)
println(u)
println(s)
//println(v)

