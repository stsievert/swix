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
    //println(x)
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
func pow_1d(){
    var y = zeros(N)+2
    var z = pow(y, 2)
    assert(z ~== (zeros(N)+4))
}
func sum_test(){
    var y = ones(N)
    assert(sum(y) == N)
}
func avg_1d(){
    var y = ones(N)
    assert(avg(y) == 1)
}
func std_1d(){
    var y = array(2,4,4,4,5,5,7,9)
    assert(std(y) == 2)
}
func var_1d(){
    var y = array(2,4,4,4,5,5,7,9)
    assert(variance(y) == 4)
}
func array1d(){
    var y = array(1,1,1,1)
    var z = ones(4)
    assert(z == y)
}
func l2norm_1d(){
    var y = array(1,-2,3)
    assert(sqrt(1+4+9) == l2norm(y))
}
func l1norm_1d(){
    var y = array(1,-2,3)
    assert(sqrt(1+2+3) == l1norm(y))
}
func l0norm_1d(){
    var y = array(1,0,0,0,0,15,-1)
    assert(3 == l0norm(y))
}
func sum_2d(){
    var y = ones((4,4))
    assert(sum(y) == 4*4)
}
func numberClassTest(){
    var x = number(n: 1, j:2)
}
var x = fft(array(1, 2, 3, 4))
println("## testing...")

addTest_1D()
mulTest_1D()
closeTest_1D()
a2Darray()
addTest_2D()
aboutEqual_2d()
sin_1d()
log_1d()
pow_1d()
sum_test()
avg_1d()
var_1d()
array1d()
l0norm_1d()
l1norm_1d()
l2norm_1d()
sum_2d()
numberClassTest()

println("   All test passed")


x = ones(N)
x.append(3)
println(x)











