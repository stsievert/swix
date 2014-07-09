//
//  initing.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

// operators etc go here

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
}

func println(x: matrix, prefix:String="matrix([", postfix:String="])", newline:String="\n", format:String="%.3f"){
    print(prefix)
    var suffix = ", "
    for i in 0..<x.n{
        if i == (x.n-1) { suffix = "" }
        print(NSString(format: format+suffix, x[i]))
    }
    print(postfix)
    print(newline)
}
func print(x: matrix, prefix:String="matrix([", postfix:String="])"){
    println(x, prefix:prefix, postfix:postfix, newline:"")
}

// EQUALITY
operator infix == {associativity none precedence 140}
func == (left: matrix, right: matrix) -> Bool{
    assert(left.n == right.n, "`+` only works on arrays of equal size")
    var x = zeros(left.n)
    for i in 0..<left.n{
        if left[i] != right[i]{ return false}
    }
    return true
    
}
operator infix ~== {associativity none precedence 140}
func ~== (left: matrix, right: matrix) -> Bool{
    assert(left.count == right.count, "`~==` only works with arrays of equal size!")
    var x = zeros(left.n)
    for i in 0..<left.n{
        if abs(left[i] - right[i]) > 1e-9 {return false}
    }
    return true
}

// PLUS
operator infix + {associativity none precedence 140}
func + (left: matrix, right: matrix) -> matrix{
    assert(left.n == right.n, "`+` only works on arrays of equal size")
    var x = zeros(left.n)
    for i in 0..<left.n{
        x[i] = left[i] + right[i]
    }
    return x
    
}
func + (left: Double, right: matrix) -> matrix{
    var N = right.n
    var x = zeros(N)
    for i in 0..<N{
        x[i] = left + right[i]
    }
    return x
}
func + (left: matrix, right: Double) -> matrix{
    var N = left.n
    var x = zeros(N)
    for i in 0..<N{
        x[i] = left[i] + right
    }
    return x
}

// MINUS
operator infix - {associativity none precedence 140}
func - (left: matrix, right: matrix) -> matrix{
    assert(left.n == right.n, "`+` only works on arrays of equal size")
    var x = zeros(left.n)
    for i in 0..<left.n{
        x[i] = left[i] - right[i]
    }
    return x
    
}
func - (left: Double, right: matrix) -> matrix{
    var N = right.n
    var x = zeros(N)
    for i in 0..<N{
        x[i] = left - right[i]
    }
    return x
}
func - (left: matrix, right: Double) -> matrix{
    var N = left.n
    var x = zeros(N)
    for i in 0..<N{
        x[i] = left[i] - right
    }
    return x
}
// TIMES
operator infix * {associativity none precedence 140}
func * (left: matrix, right: matrix) -> matrix{
    assert(left.n == right.n, "`+` only works on arrays of equal size")
    var x = zeros(left.n)
    for i in 0..<left.n{
        x[i] = left[i] * right[i]
    }
    return x
    
}
func * (left: Double, right: matrix) -> matrix{
    var N = right.n
    var x = zeros(N)
    for i in 0..<N{
        x[i] = left * right[i]
    }
    return x
}
func * (left: matrix, right: Double) -> matrix{
    var N = left.n
    var x = zeros(N)
    for i in 0..<N{
        x[i] = left[i] * right
    }
    return x
}
// DIVIDE
operator infix / {associativity none precedence 140}
func / (left: matrix, right: matrix) -> matrix{
    assert(left.n == right.n, "`+` only works on arrays of equal size")
    var x = zeros(left.n)
    for i in 0..<left.n{
        x[i] = left[i] / right[i]
    }
    return x
    
}
func / (left: Double, right: matrix) -> matrix{
    var N = right.n
    var x = zeros(N)
    for i in 0..<N{
        x[i] = left / right[i]
    }
    return x
}
func / (left: matrix, right: Double) -> matrix{
    var N = left.n
    var x = zeros(N)
    for i in 0..<N{
        x[i] = left[i] / right
    }
    return x
}

















