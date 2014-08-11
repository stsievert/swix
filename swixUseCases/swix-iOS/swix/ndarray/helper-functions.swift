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
func argwhere(idx: ndarray) -> ndarray{
    // counts non-zero elements, return array of doubles (which can be indexed!).
    
    var i = arange(idx.n)
    var sum = sum_objc(!idx, idx.n.cint)
    var args = zeros(Int(sum))
    find_objc(!idx, !args, !i, idx.n.cint)
    return args
}
func delete(x:ndarray, idx:ndarray) -> ndarray{
    var i = ones(x.n)
    i[idx] *= 0
    return x[argwhere(i)]
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
