//
//  helper-functions.swift
//  swix
//
//  Created by Scott Sievert on 8/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
func println(x: matrix, prefix:String="matrix([", postfix:String="])", newline:String="\n", format:String="%.3f", printWholeMatrix:Bool=false){
    print(prefix)
    var suffix = ", "
    var pre:String
    var post:String
    var printedSpacer = false
    for i in 0..<x.shape.0{
        // pre and post nice -- internal variables
        if i==0 {pre = ""}
        else {pre = "        "}
        if i==x.shape.0-1{post=""}
        else {post = "],\n"}
        
        if printWholeMatrix || x.shape.0 < 16 || i<4-1 || i>x.shape.0-4{
            print(x[i, 0..<x.shape.1], prefix:pre, postfix:post, format: format, printWholeMatrix:printWholeMatrix)
        }
        else if printedSpacer==false{
            printedSpacer=true
            println("        ...,")
        }
    }
    print(postfix)
    print(newline)
}
func print(x: matrix, prefix:String="matrix([", postfix:String="])", newline:String="\n", format:String="%.3f", printWholeMatrix:Bool=false){
    println(x, prefix:prefix, postfix:postfix, newline:"", format:format, printWholeMatrix:printWholeMatrix)
}
func argwhere(idx: matrix) -> ndarray{
    return argwhere(idx.flat)
}
func flipud(x:matrix)->matrix{
    var y = x.copy()
    CVWrapper.flip(!x, into:!y, how:"ud", m:x.shape.0.cint, n:x.shape.1.cint)
    return y
}
func fliplr(x:matrix)->matrix{
    var y = x.copy()
    CVWrapper.flip(!x, into:!y, how:"lr", m:x.shape.0.cint, n:x.shape.1.cint)
    return y
}
func transpose (x: matrix) -> matrix{
    var m = x.shape.1
    var n = x.shape.0
    var y = zeros((m, n))
    vDSP_mtransD(!x, 1.stride, !y, 1.stride, vDSP_Length(m), vDSP_Length(n))
    return y
}
func kron(A:matrix, B:matrix)->matrix{
    // an O(n^4) operation!
    func assign_kron_row(A:matrix, B:matrix,inout C:matrix, p:Int, m:Int, m_max:Int){
        var row = (m+0)*(p+0) + p-0
        row = m_max*m + 1*p
        
        var i = arange(B.shape.1 * A.shape.1)
        var n1 = arange(A.shape.1)
        var q1 = arange(B.shape.1)
        var (n, q) = meshgrid(n1, q1)
        C[row, i] = A[m, n.flat] * B[p, q.flat]
    }
    var C = zeros((A.shape.0*B.shape.0, A.shape.1*B.shape.1))
    for p in 0..<A.shape.1{
        for m in 0..<B.shape.1{
            assign_kron_row(A, B, &C, p, m, A.shape.1)
        }
    }
    
    return C
}
func write_csv(x:matrix, #filename:String, prefix:String=S2_PREFIX){
    var seperator=","
    var str = ""
    for i in 0..<x.shape.0{
        for j in 0..<x.shape.1{
            seperator = j == x.shape.1-1 ? "" : ","
            str += String(format: "\(x[i, j])"+seperator)
        }
        str += "\n"
    }
    var error:NSError?
    str.writeToFile(prefix+"../"+filename, atomically: false, encoding: NSUTF8StringEncoding, error: &error)
    if let error=error{
        println("File probably wasn't recognized \n\(error)")
    }
}

