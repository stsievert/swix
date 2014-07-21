//
//  twoD-initing.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate

func zeros(shape: (Int, Int)) -> matrix{
    return matrix(columns: shape.1, rows: shape.0)
}
func ones(shape: (Int, Int)) -> matrix{
    return zeros(shape)+1
}
func diag(x: matrix) -> ndarray{
    var m = x.shape.0
    var n = x.shape.1
    var size = n < m ? n : m
    var y = zeros(size)
    diag_objc(!x, !y, m.cint, n.cint)
    return y
}
func eye(n: Int) -> matrix{
    var y = zeros((n,n))
    for i in 0..<n{
        y[i,i] = 1
    }
    return y
}
func reshape(x: ndarray, shape:(Int, Int))->matrix{
    var y = zeros(shape)
    y.flat = x
    return y
}
func meshgrid(x: ndarray, y:ndarray) -> (matrix, matrix){
    var z1 = reshape(repeat(y, x.n), (x.n, y.n))
    var z2 = reshape(repeat(x, y.n, how:"elements"), (x.n, y.n))
    return (z2, z1)
}

/// array("1 2 3; 4 5 6; 7 8 9") works like matlab. note that string format has to be followed to the dot.
func array(matlab_like_string: String)->matrix{
    var mls = matlab_like_string
    var rows = mls.componentsSeparatedByString(";")
    var r = rows.count
    var c = 0
    for char in rows[0]{
        if char == " " {}
        else {c += 1}
    }
    var x = zeros((r, c))
    var start:Int
    var i:Int=0, j:Int=0
    for row in rows{
        var nums = row.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        if nums[0] == ""{start=1}
        else {start=0}
        j = 0
        for n in start..<nums.count{
            x[i, j] = nums[n].floatValue.double
            j += 1
        }
        i += 1
    }
    return x
}






























