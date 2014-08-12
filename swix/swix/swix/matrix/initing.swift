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
func zeros_like(x: matrix) -> matrix{
    var y:matrix = zeros((x.shape.0, x.shape.1))
    return y
}
func ones(shape: (Int, Int)) -> matrix{
    return zeros(shape)+1
}
func eye(N: Int) -> matrix{
    var x = zeros((N,N))
    x["diag"] = ones(N)
    return x
}
func reshape(x: ndarray, shape:(Int, Int))->matrix{
    return x.reshape(shape)
}
func meshgrid(x: ndarray, y:ndarray) -> (matrix, matrix){
    assert(x.n > 0 && y.n > 0, "If these matrices are empty meshgrid fails")
    var z1 = reshape(repeat(y, x.n), (x.n, y.n))
    var z2 = reshape(repeat(x, y.n, axis:1), (x.n, y.n))
    return (z2, z1)
}


/// array("1 2 3; 4 5 6; 7 8 9") works like matlab. note that string format has to be followed to the dot. String parsing has bugs; I'd use arange(9).reshape((3,3)) or something similar
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
func read_csv(filename:String, prefix:String=S2_PREFIX) -> matrix{
    // docs need to be written on this
    var x = String.stringWithContentsOfFile(prefix+"../"+filename, encoding: NSUTF8StringEncoding, error: nil)
    var y = x!.componentsSeparatedByString("\n")
    var rows = y.count-1
    var array:[Double] = []
    var columns:Int = 0
    for i in 0..<rows{
        var z = y[i].componentsSeparatedByString(",")
        columns = 0
        for num in z{
            array.append(num.doubleValue)
            columns += 1
        }
    }
    var done = zeros((rows, columns))
    done.flat.grid = array
    return done
}































