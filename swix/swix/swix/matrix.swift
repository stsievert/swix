//
//  initing.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

// the matrix definition goes here

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
            var x = zeros(r.endIndex - r.startIndex)
            var j = 0
            for i in r{
                x[j] = grid[i]
                j += 1
            }
            return x
        }
        set {
            var j = 0
            for i in r{
                grid[i] = newValue[j]; j+=1
            }
        }
    }
    subscript(r: matrix) -> matrix {
        get {
            var x = zeros(r.n)
            for i in 0..<r.n{
                x[i] = grid[r[i].int]
            }
            return x
        }
        set {
            var j = 0
            for i in 0..<r.n{
                grid[r[i].int] = newValue[j]; j+=1
            }
        }
    }
}

func asmatrix(x: [Double]) -> matrix{
    var y = zeros(x.count)
    for i in 0..<x.count{
        y[i] = x[i]
    }
    return y
}

func println(x: matrix, prefix:String="matrix([", postfix:String="])", newline:String="\n", format:String="%.3f"){
    print(prefix)
    var suffix = ", "
    var printed = false
    for i in 0..<x.n{
        if x.n > 16 && i>3-1 && printed==false{
            print("... ")
            printed = true
        }
        else if printed==true && i<x.n-3{}
        else{
            if i == (x.n-1) { suffix = "" }
            print(NSString(format: format+suffix, x[i]))
        }
    }
    print(postfix)
    print(newline)
}
func print(x: matrix, prefix:String="matrix([", postfix:String="])"){
    println(x, prefix:prefix, postfix:postfix, newline:"")
}




















