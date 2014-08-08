//
//  main.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//


import Foundation
runTests()

var x = arange(6).reshape((2,3))
println(sum(x, dim:1))



