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

// SLOW PARTS: x[ndarray, ndarray] set, modulo operator

func toArray(seq: Range<Int>) -> ndarray {
    // improve with [1]
    // [1]:https://gist.github.com/nubbel/d5a3639bea96ad568cf2
    var start:Double = seq.startIndex.double * 1.0
    var end:Double   = seq.endIndex.double * 1.0
    var s = arange(start, end, x:true)
    return s
}

struct ndarray {
    let n: Int
    var count: Int
    var grid: [Double]
    init(n: Int) {
        self.n = n
        self.count = n
        grid = Array(count: n, repeatedValue: 0.0)
    }
    func reshape(shape: (Int,Int)) -> matrix{
        assert(shape.0 * shape.1 == n, "Number of elements must not change.")
        var y:matrix = zeros(shape)
        y.flat = self
        return y
    }
    func copy() -> ndarray{
        var y = zeros(n)
        cblas_dcopy(self.n.cint, !self, 1.cint, !y, 1.cint)
        return y
    }
    func indexIsValidForRow(index: Int) -> Bool {
        return index >= 0 && index < n
    }
    func min() -> Double{
        return min_objc(!self, n.cint)
    }
    func max() -> Double{
        return max_objc(!self, n.cint)
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
    subscript(r: Range<Int>) -> ndarray {
        get {
            // assumes that r is not [0, 1, 2, 3...] not [0, 2, 4...]
            return self[toArray(r)]
        }
        set {
            self[toArray(r)].grid = newValue.grid}
    }
    subscript(r: ndarray) -> ndarray {
        get {
            //assert((r%1.0) ~== zeros_like(r))
            // ndarray has fractional parts, and those parts get truncated
            // dropped for speed results (depends on for-loop in C)
//            assert((r.max() < self.n) && (r.min() >= 0), "An index is out of bounds")
            var y = zeros(r.n)
            index_objc(!self, !y, !r, r.n.cint)
            return y
        }
        set {
//            assert((r.max() < self.n) && (r.min() >= 0), "An index is out of bounds")
            // asked stackoverflow question at [1]
            // [1]:http://stackoverflow.com/questions/24727674/modify-select-elements-of-an-array
            // tried basic optimization myself, but the compiler took care of that.
            index_xa_b_objc(!self, !r, !newValue, r.n.cint)
        }
    }
}

func asmatrix(x: [Double]) -> ndarray{
    var y = zeros(x.count)
    y.grid = x
    return y
}

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
func zeros_like(x: ndarray) -> ndarray{
    return zeros(x.n)
}
func argwhere(idx: ndarray) -> ndarray{
    // counts non-zero elements, return array of doubles (which can be indexed!).

    var i = arange(idx.n)
    var sum = sum_objc(!idx, idx.n.cint)
    var args = zeros(Int(sum))
    find_objc(!idx, !args, !i, idx.n.cint)
    return args
}

// RANGE. | for exclusive range. | chosen for similiarity with Python
infix operator  | {associativity none precedence 140}
func | (lhs: Int, rhs: Int) -> Range<Int>{
    return lhs..<rhs
}


















