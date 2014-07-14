//
//  twoD-initing.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate

func zeros(shape: (Int, Int)) -> matrix2d{
    return matrix2d(columns: shape.1, rows: shape.0)
}
func ones(shape: (Int, Int)) -> matrix2d{
    return zeros(shape)+1
}
func diag(x: matrix) -> matrix2d{
    let N = x.count
    var y = zeros((N,N))
    for i in 0..<N{
        y[i,i] = x[i]
    }
    return y
}
func eye(n: Int) -> matrix2d{
    return diag(ones(n))
}
func reshape(x: matrix, shape:(Int, Int))->matrix2d{
    var y = zeros(shape)
    y.flat = x
    return y
}
func meshgrid(x: matrix, y:matrix) -> (matrix2d, matrix2d){
    var z1 = reshape(repeat(y, x.n), (x.n, y.n))
    var z2 = reshape(repeat(x, y.n, how:"elements"), (x.n, y.n))
    return (z1, z2)
}

/// array("1 2 3; 4 5 6; 7 8 9") works like matlab. note that string format has to be followed to the dot.
func array(matlab_like_string: String)->matrix2d{
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






























