//
//  main.swift
//  swix
//
//  Created by Scott Sievert on 6/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
let N = 10

func addTest_1D(){
    var x = zeros(N)
    var y = ones(N)
    var z = ones(N)
    assert((y+x) == z);
}
func mulTest_1D(){
    var x = zeros(N) + 2
    var y = zeros(N) + 1
    assert(x*y == zeros(N)+2)
}
func closeTest_1D(){
    var x = zeros(N)
    var y = zeros(N)+1e-10
    assert(x ~== y)
}
func a2Darray(){
    // ahhh... need to define +-*/ for 2D arrays too
    var x = zeros((4,4))
    x[0][0] = 1
    x[1][0] = 2
}
func addTest_2D(){
    var x = 1+zeros((N,N/2))
    var y = zeros((N,N/2))
    var z = zeros((N,N/2))
    assert((y+x) == z+1);
}
func aboutEqual_2d(){
    var x = 1+zeros((N,N/2))+1e-10
    var y = zeros((N,N/2))
    var z = zeros((N,N/2))
    assert((y+x) ~~ (z+1));
}
func sin_1d(){
    var y = zeros(N)+pi
    assert(sin(y) ~== zeros(N))
}
func log_1d(){
    var y = zeros(N)+1
    var z = log(y)
    assert(log(z) ~== zeros(N))
}

addTest_1D()
mulTest_1D()
closeTest_1D()
a2Darray()
addTest_2D()
aboutEqual_2d()
sin_1d()
log_1d()

var x = ones(N)
var y = ones(N)
