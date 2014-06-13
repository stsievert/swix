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
    println("    zeros(N) + ones(N) == ones(N)")
}
func mulTest_1D(){
    var x = zeros(N) + 2
    var y = zeros(N) + 1
    assert(x*y == zeros(N)+2)
    println("    x*y == zeros(N)+2")

}
func closeTest_1D(){
    var x = zeros(N)
    var y = zeros(N)+1e-10
    assert(x ~== y)
    println("    x ~== y)")
}
func a2Darray(){
    // ahhh... need to define +-*/ for 2D arrays too
    var x = zeros((4,4))
    x[0][0] = 1
    x[1][0] = 2
    println("    use x[0] to access first row, x[1][1] to access second row second column")
}
func addTest_2D(){
    var x = 1+zeros((N,N/2))
    var y = zeros((N,N/2))
    var z = zeros((N,N/2))
    assert((y+x) == z+1);
    println("    (y+x) == z+1)")
}
func aboutEqual_2d(){
    var x = 1+zeros((N,N/2))+1e-10
    var y = zeros((N,N/2))
    var z = zeros((N,N/2))
    assert((y+x) ~~ (z+1));
    println("    (y+x)~~(z+1)")
}
func sin_1d(){
    var y = zeros(N)+pi
    assert(sin(y) ~== zeros(N))
    println("    sin(ones(N)*pi) ~== zeros(N)")
}
func log_1d(){
    var y = zeros(N)+1
    var z = log(y)
    assert(log(z) ~== zeros(N))
    println("    log(zeros(N)+1) ~== zeros(N)")
}
func pow_1d(){
    var y = zeros(N)+2
    var z = pow(y, 2)
    assert(z ~== (zeros(N)+4))
    println("    pow(zeros(N)+2) ~== zeros(N)+4")
}
func sum_test(){
    var y = ones(N)
    assert(sum(y) == N)
    println("    sum(ones(N)) == N")
}
func avg_1d(){
    var y = ones(N)
    assert(avg(y) == 1)
    println("    avg(ones(N)) = 1")
}
func std_1d(){
    var y = array(2,4,4,4,5,5,7,9)
    assert(std(y) == 2)
    println("    std(y) == 2")
}
func var_1d(){
    var y = array(2,4,4,4,5,5,7,9)
    assert(variance(y) == 4)
    println("    variance(y) == 4")
}
func array1d(){
    var y = array(1,1,1,1)
    var z = ones(4)
    assert(z == y)
    println("    ones(4) == array(1,1,1,1)")
}
func l2norm_1d(){
    var y = array(1,-2,3)
    assert(sqrt(1+4+9) == l2norm(y))
    println("    l2norm(y) = sqrt(1+4+9)")
}
func l1norm_1d(){
    var y = array(1,-2,3)
    assert(sqrt(1+2+3) == l1norm(y))
    println("    l1norm = sqrt(1+2+3)")
}
func l0norm_1d(){
    var y = array(1,0,0,0,0,15,-1)
    assert(3 == l0norm(y))
    println("    l0norm(array(1,0,0,0,0,15,-1)) == 3")
}
func sum_2d(){
    var y = ones((4,4))
    assert(sum(y) == 4*4)
    println("    sum(ones((4,4)) = 4*4")
}
func numberClassTest(){
    var x = number(n: 1, j:2)
    var y = x.real
    var z = x.imag
    println("    x.real, x.imag accessible")
}
func twoD_arrayTest(){
    var x = array("[1 2; 4 5]")
    var z = zeros((2,2))
    z[0][0] = 1
    z[0][1] = 2
    z[1][0] = 4
    z[1][1] = 5
    assert(x == z)
    println("    array(\"[1 2; 4 5]\" == z")
}
func dot_test(){
    var x = diag(ones(3))
    var y = array("[1 2 3; 4 5 6; 7 8 9]")
    var z = x *! y
    assert(y == z)
    println("    dot product checks: I *! y == y")
    println("    diag checks: diag(ones(3)) = I")
}
func assingment(){
    var x = ones(4)
    x[2...3] = [7, 8]
    assert(x == array(1, 1, 7, 8))
    println("    can assigned x[2...3] = [7, 8]")
}
func assingment2d(){
    var x = ones((6, 6))
//    println(x[2...3][2...3])
//    x[2...3][2...3] = [[7, 8], [7, 8]]
    println(" ** bug: cannot assign x[2...3][2...3] = [[7, 8], [7, 8]]")
}
func floorTest(){
    var x = ones((N,N))*pi
    var y = floor(x)
    assert(y == ones((N,N))*3)
    println("    floor(matrix2d) works")
}
func ceilTest(){
    var x = ones(N)*pi
    var y = ceil(x)
    assert(y == ones(N)*4)
    println("    ceil(matrix) works")
}

println("testing...")

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
twoD_arrayTest()
dot_test()
assingment()
assingment2d()
floorTest()
ceilTest()

var x = ones((4,4))
var y:Double = 4.1





























