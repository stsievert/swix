//
//  initing.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate

// the matrix definition and related functions go here
func toArray(seq: Range<Int>) -> matrix {
    // improve with https://gist.github.com/nubbel/d5a3639bea96ad568cf2
    var start:Double = seq.startIndex.double * 1.0
    var end:Double   = seq.endIndex.double * 1.0
    var s = arange(start, end, x:true)
    return s
}

struct matrix {
    let n: Int
    var count: Int
    var grid: [Double]
    init(n: Int) {
        self.n = n
        self.count = n
        grid = Array(count: n, repeatedValue: 0.0)
    }
    func indexIsValidForRow(index: Int) -> Bool {
        return index >= 0 && index < n
    }
    subscript(index: Int) -> Double {
        get {
            assert(indexIsValidForRow(index), "Index out of range")
            return grid[index]
        }
        set {
            assert(indexIsValidForRow(index), "Index out of range")
            grid[index] = newValue
        }
    }
    subscript(r: Range<Int>) -> matrix {
        get {
            // assumes that r is not [0, 1, 2, 3...] not [0, 2, 4...]
            return self[toArray(r)]
        }
        set {self[toArray(r)].grid = newValue.grid}
    }
    subscript(r: matrix) -> matrix {
        get {
            var y = zeros(r.n)
            var xP = matrixToPointer(self)
            var yP = matrixToPointer(y)
            var rP = matrixToPointer(r)
            index_objc(xP, yP, rP, r.n.cint)
            return y
        }
        set {
            var j = 0
            // FOR LOOP
            for i in 0..<r.n{
                assert(r[i] % 1.0 == 0.0, "Index values must be whole numbers")
                grid[r[i].int] = newValue[j]; j+=1
            }
        }
    }
}

func asmatrix(x: [Double]) -> matrix{
    var y = zeros(x.count)
    y.grid = x
    return y
}

func println(x: matrix, prefix:String="matrix([", postfix:String="])", newline:String="\n", format:String="%.3f", printWholeMatrix:Bool=false){
    print(prefix)
    var suffix = ", "
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
func print(x: matrix, prefix:String="matrix([", postfix:String="])", format:String="%.3f", printWholeMatrix:Bool=false){
    println(x, prefix:prefix, postfix:postfix, newline:"", format:format, printWholeMatrix:printWholeMatrix)
}
func zeros_like(x: matrix) -> matrix{
    return zeros(x.n)
}
/// argwhere(x < 2) or argwhere(x < y) works as more or less as expected. returns an array of type double (bug, todo)
func argwhere(idx: matrix) -> matrix{
    var count = 0
    for i in 0..<idx.n{
        if idx[i]==1 {count += 1}
    }
    var args = zeros(count)
    var j = 0;
    for i in 0..<idx.n{
        if idx[i]==1{
            args[j] = i.double; j+=1
        }
    }
    return args
}

// RANGE. | for exclusive range, ! for inclusive range. | chosen for similiarity with Python, ! chosen because ! has a dot, closer to ...
operator infix | {associativity none precedence 140}
func | (lhs: Int, rhs: Int) -> Range<Int>{
    return lhs..<rhs
}
operator infix ! {associativity none precedence 140}
func ! (lhs: Int, rhs: Int) -> Range<Int>{
    return lhs...rhs
}


















