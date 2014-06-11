//
//  main.swift
//  swix
//
//  Created by Scott Sievert on 6/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
let N = 10

func addTest(){
    var x = zeros(N)
    var y = ones(N)
    var z = ones(N)
    assert((y+x) == z);
}
func mulTest(){
    var x = zeros(N) + 2
    var y = zeros(N) + 1
    assert(x*y == zeros(N)+2)
}
func closeTest(){
    var x = zeros(N)
    var y = zeros(N)+1e-10
    assert(x ~== y)
}
func a2Darray(){
    var x = zeros((2,2))
    x[0][0] = 1
    x[1][0] = 2
    println(x)
}


addTest()
mulTest()
closeTest()
a2Darray()

var x = ones(N)
var y = ones(N)
