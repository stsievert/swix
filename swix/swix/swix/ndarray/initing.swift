//
//  initing.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate

// SLOW PARTS: array(doubles), read_csv, write_csv. not a huge deal -- hopefully not used in final code

func zeros(N: Int) -> ndarray{
    return ndarray(n: N)
}
func ones(N: Int) -> ndarray{
    return ndarray(n: N)+1
}
func arange(max: Double, x exclusive:Bool = true) -> ndarray{
    var x = arange(0, max, x:exclusive)
    return x
}
func arange(min: Double, max: Double, x exclusive: Bool = true) -> ndarray{
    var pad = 0
    if !exclusive {pad = 1}
    let N = max.int - min.int + pad
    var x = zeros(N)
    var xP = matrixToPointer(x)
    var minP = CDouble(min)
    
    linspace_objc(xP, (N+pad).cint, (minP), 1.0)
    return x
}
func linspace(min: Double, max: Double, num: Int=50) -> ndarray{
    var x = zeros(num+0)
    var xP = matrixToPointer(x)
    linspace_objc(xP, num.cint, min.cdouble, ((max-min)/(num-1)).double)
    return x
}
func array(numbers: Double...) -> ndarray{
    // okay to leave unoptimized, only used for testing
    var x = zeros(numbers.count)
    var i = 0
    for number in numbers{
        x[i] = number
        i++
    }
    return x
}
func repeat(x: ndarray, N:Int, how:String="ndarray") -> ndarray{
    var y = zeros(x.n * N)
    var xP = matrixToPointer(x)
    var yP = matrixToPointer(y)
    CVWrapper.repeat(!x, to:!y, n_x:x.n.cint, n_repeat:N.cint)
    var z = zeros((x.n, N))
    z.flat = y
    if how=="ndarray" {z = transpose(z)}
    else if how=="elements" {}
    return z.flat
}
func copy(x: ndarray) -> ndarray{
    return x.copy()
}
func read_csv(filename:String, prefix:String=S2_PREFIX) -> ndarray{
    var x = String.stringWithContentsOfFile(prefix+"../"+filename, encoding: NSUTF8StringEncoding, error: nil)
    var array:[Double] = []
    var columns:Int = 0
    var z = x!.componentsSeparatedByString(",")
    columns = 0
    for i in 0..<z.count-1{
            var num = z[i]
            array.append(num.doubleValue)
            columns += 1
    }
    var done = zeros(1 * columns)
    done.grid = array
    return done
}
func write_csv(x:ndarray, #filename:String, prefix:String=S2_PREFIX){
    var seperator=","
    var str = ""
    for i in 0..<x.n{
        seperator = i == x.n-1 ? "," : ","
        str += String(format: "\(x[i])"+seperator)
    }
    str += "\n"
    var error:NSError?
    str.writeToFile(prefix+"../"+filename, atomically: false, encoding: NSUTF8StringEncoding, error: &error)
    if let error=error{
        println("File probably wasn't recognized \n\(error)")
    }
    
}





















