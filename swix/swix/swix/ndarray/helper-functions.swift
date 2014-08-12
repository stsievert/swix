//
//  helper-functions.swift
//  swix
//
//  Created by Scott Sievert on 8/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

func println(x: ndarray, prefix:String="array([", postfix:String="])", newline:String="\n", format:String="%.3f", seperator:String=", ", printWholeMatrix:Bool=false){
    print(prefix)
    var suffix = seperator
    var printed = false
    for i in 0..<x.n{
        if i==x.n-1 { suffix = "" }
        if printWholeMatrix || (x.n)<16 || i<3 || i>(x.n-4){
            print(NSString(format: format+suffix, x[i]))
        }else if printed == false{
            printed = true
            print("..., ")
        }
    }
    print(postfix)
    print(newline)
}
func print(x: ndarray, prefix:String="ndarray([", postfix:String="])", format:String="%.3f", printWholeMatrix:Bool=false){
    println(x, prefix:prefix, postfix:postfix, newline:"", format:format, printWholeMatrix:printWholeMatrix)
}
func concat(x:ndarray, y:ndarray)->ndarray{
    var z = zeros(x.n + y.n)
    z[0..<x.n] = x
    z[x.n..<y.n+x.n] = y
    return z
}
func argwhere(idx: ndarray) -> ndarray{
    // counts non-zero elements, return array of doubles (which can be indexed!).
    
    var i = arange(idx.n)
    var sum = sum_objc(!idx, idx.n.cint)
    var args = zeros(Int(sum))
    find_objc(!idx, !args, !i, idx.n.cint)
    return args
}
func reverse(x:ndarray) -> ndarray{
    var y = x.copy()
    vDSP_vrvrsD(!y, 1.cint, vDSP_Length(y.n.cint))
    return y
}
func sort(x:ndarray)->ndarray{
    var y = x.copy()
    y.sort()
    return y
}
func delete(x:ndarray, idx:ndarray) -> ndarray{
    var i = ones(x.n)
    i[idx] *= 0
    return x[argwhere(i)]
}
func repeat(x: ndarray, N:Int, axis:Int=0) -> ndarray{
    var y = zeros((N, x.n))
    
    // wrapping using OpenCV
    CVWrapper.repeat(!x, to:!y, n_x:x.n.cint, n_repeat:N.cint)
    
    if axis==0{}
    else if axis==1 { y = y.T}
    return y.flat
}
func asarray(x: [Double]) -> ndarray{
    var y = zeros(x.count)
    y.grid = x
    return y
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
