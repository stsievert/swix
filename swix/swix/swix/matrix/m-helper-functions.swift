//
//  helper-functions.swift
//  swix
//
//  Created by Scott Sievert on 8/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

// NORMs
func norm(x:matrix, ord:String="assumed to be 'fro' for Frobenius")->Double{
    if ord == "fro" {return norm(x.flat, ord:2)}
    assert(false, "Norm type assumed to be \"fro\" for Forbenius norm!")
    return -1
}
func norm(x:matrix, ord:Double=2)->Double{
    if      ord ==  inf {return max(sum(abs(x), axis:1))}
    else if ord == -inf {return min(sum(abs(x), axis:1))}
    else if ord ==  1   {return max(sum(abs(x), axis:0))}
    else if ord == -1   {return min(sum(abs(x), axis:0))}
    else if ord ==  2 {
        // compute only the largest singular value?
        var (u, s, v) = svd(x, compute_uv:false)
        return s[0]
    }
    else if ord == -2 {
        // compute only the smallest singular value?
        var (u, s, v) = svd(x, compute_uv:false)
        return s[-1]
    }
    
    assert(false, "Invalid norm for matrices")
    return -1
}

func det(x:matrix)->Double{
    var result:CDouble = 0.0
    CVWrapper.det(!x, n:x.shape.0.cint, m:x.shape.1.cint, result:&result)
    return result
}

// basics
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
func rot90(x:matrix, k:Int=1)->matrix{
    // k is assumed to be less than or equal to 3
    var y = x.copy()
    if k == 1 {return fliplr(x).T}
    if k == 2 {return flipud(fliplr(y))}
    if k == 3 {return flipud(x).T}
    assert(false, "k is assumed to satisfy 1 <= k <= 3")
    return y
}

// modifying matrices, modifying equations
func transpose (x: matrix) -> matrix{
    var m = x.shape.1
    var n = x.shape.0
    var y = zeros((m, n))
    vDSP_mtransD(!x, 1.stride, !y, 1.stride, m.length, n.length)
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

func tril(x: matrix) -> ndarray{
    var (m, n) = x.shape
    var (mm, nn) = meshgrid(arange(m), arange(n))
    var i = mm - nn
    var j = (i < 0+S2_THRESHOLD)
    i[argwhere(j)] <- 0
    i[argwhere(1-j)] <- 1
    return argwhere(i)
}
func triu(x: matrix)->ndarray{
    var (m, n) = x.shape
    var (mm, nn) = meshgrid(arange(m), arange(n))
    var i = mm - nn
    var j = (i > 0-S2_THRESHOLD)
    i[argwhere(j)] <- 0
    i[argwhere(1-j)] <- 1
    return argwhere(i)
}

// PRINTING
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
