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

var x:Double = 3.0
var y:Double = 3.0 + 1e-10

func ~= (x:Double, y:Double)->Bool{
    return abs(x-y) < 1e-9
}







