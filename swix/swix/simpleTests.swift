//
//  fullTests.swift
//  swix
//
//  Created by Scott Sievert on 7/18/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

class runSimpleTests {
    var N:Int
    init(){
        println("    running many simple tests")
        self.N = 10
        operatorTests()
        comparisonTests()
        functionTests()
        twoDTests()
        readWriteTests()
    }
    func readWriteTests(){
        var x1 = arange(9).reshape((3,3)) * 2
        write_csv(x1, filename:"../../../python_testing/csvs/image.csv")
        var y1:matrix = read_csv("../../../python_testing/csvs/image.csv")
        assert(x1 ~== y1)
        
        var x2 = array(1, 2, 3, 4, 5, 2, 1)
        write_csv(x2, filename:"../../../python_testing/csvs/ndarray.csv")
        var y2:ndarray = read_csv("../../../python_testing/csvs/ndarray.csv")
        assert(x2 ~== y2)
    }
    func twoDTests(){
        var x = arange(9).reshape((3,3))
        assert(x.T ~== transpose(x))
        assert(x.I ~== inv(x))
        assert(x["diag"] ~== array(0, 4, 8))
        var y = x.copy()
        y["diag"] = array(1, 5, 9)
        assert(y ~== array(1, 1, 2, 3, 5, 5, 6, 7, 9).reshape((3,3)))
        assert(eye(2) ~== array(1, 0, 0, 1).reshape((2,2)))
        
        assert(x.flat[array(1, 4, 5, 6)] ~== x[array(1, 4, 5, 6)])
        y = x.copy()
        y[array(1, 4, 5, 6)] = ones(4)
        assert(y ~== array(0, 1, 2, 3, 1, 1, 1, 7, 8).reshape((3,3)))
        
        var z = arange(3*4).reshape((3,4))
        assert(sum(z, dim:0) ~== array(6, 22, 38))
        assert(sum(z, dim:1) ~== array(12, 15, 18, 21))
    }
    func functionTests(){
        var x = array(-1, 0, 1)
        
        assert(abs(x) ~== array(1, 0, 1))
        assert(sign(x+0.1) ~== array(-1, 1, 1))
        assert(sum(x+1)     == 3)
        assert(cumsum(x+1) ~== array(0, 1, 3))
        assert(pow(x+1, 2) ~== array(0, 1, 4))
        assert(((x+1)^2)   ~== array(0, 1, 4))
        assert(variance(ones(4)) == 0)
        assert(std(ones(4)) == 0)
        assert(avg(x) == 0)
        assert(abs(avg(rand(1000)) - 0.5) < 0.1)
        assert(abs(avg(randn(1000))) < 0.1)
        assert(abs(std(randn(1000)) - 1) < 0.2)
        var y = randn((100,100))
        assert(abs(avg(y.flat)) < 0.1)
        y = rand((100, 100))
        assert(abs(avg(y.flat) - 0.5) < 0.1)
        
        assert(repeat(array(0, 1), 2) ~== array(0, 1, 0, 1))
        assert(repeat(array(0, 1), 2, how:"elements") ~== array(0, 0, 1, 1))
        
        var xC = zeros_like(x)
        copy(x, xC)
        assert(xC ~== x.copy())
        
        assert(array("0 1 2; 3 4 5") ~== arange(6).reshape((2,3)))
        
        var z1 = array(0, 1)
        var z2 = array(2, 3)
        var (z11, z22) = meshgrid(z1, z2)
        assert(z11 ~== array(0, 0, 1, 1).reshape((2,2)))
        assert(z22 ~== array(2, 3, 2, 3).reshape((2,2)))
        
        assert(x.min() == min(x))
        assert(x.min() == -1)
        
        assert(x.max() == max(x))
        assert(x.max() == 1)
        
        var z = array(-3, -2, -1, 0, 1, 2, 3)
        assert(z[argwhere(z < 0)] ~== array(-3, -2, -1))
        assert((z < 0) ~== array(1, 1, 1, 0, 0, 0, 0))
    }
    func operatorTests(){
        // l and o similar to 1 and 0
        var l = ones(N)
        var o = zeros(N)
        
        // PLUS
        assert((o+1.double) ~== l)
        assert((1.double+o) ~== l)
        assert((l+o) ~== l)
        
        // MINUS
        assert((l - o) ~== l)
        assert((l - 1) ~== o)
        assert((1 - o) ~== l)
        
        // MULTIPLY
        assert(((o+1) * l) ~== l)
        assert((l * 1) ~== l)
        assert((1 * l) ~== l)
        
        // DIVIDE
        assert(((l+1)/2) ~== l)
        assert((o/l) ~== o)
        assert((1 / l) ~== l)
        
        // POW
        assert((array(1, 2, 3)^2) ~== array(1, 4, 9))
        
        // MODULO
        assert(array(1, 3.14, 2.1)%1.0 ~== array(0, 0.14, 0.1))
    }
    func comparisonTests(){
        //     true:  <, >, <=, >=, ==, !==
        var x = array(0, 3,  3,  4,  5,  7)
        var y = array(1, 2,  3,  4,  5,  6)
        
        // matrix <op> matrix
        assert((x < y) ~== array(1, 0, 0, 0, 0, 0))
        assert((x > y) ~== array(0, 1, 0, 0, 0, 1))
        assert((x <= y) ~== array(1, 0, 1, 1, 1, 0))
        assert((x >= y) ~== array(0, 1, 1, 1, 1, 1))
        assert((x == y) ~== array(0, 0, 1, 1, 1, 0))
        assert((x !== y) ~== array(1, 1, 0, 0, 0, 1))
        
        // double <op> matrix
        assert((4 < x) ~== array(0, 0, 0, 0, 1, 1))
        assert((4 > x) ~== array(1, 1, 1, 0, 0, 0))
        assert((4 >= x) ~== array(1, 1, 1, 1, 0, 0))
        assert((4 <= x) ~== array(0, 0, 0, 1, 1, 1))
        
        // matrix <op> ouble
        assert((x > 4) ~== array(0, 0, 0, 0, 1, 1))
        assert((x < 4) ~== array(1, 1, 1, 0, 0, 0))
        assert((x <= 4) ~== array(1, 1, 1, 1, 0, 0))
        assert((x >= 4) ~== array(0, 0, 0, 1, 1, 1))
    }
}













