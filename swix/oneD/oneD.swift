//
//  oneD.swift
//  swix
//
//  Created by Scott Sievert on 6/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation







/// nice printing. optional args: format. ie, use format:"%.3f" to show 3 decimals (c style syntax).
func println(x: matrix, format: String = "%.3f")  {
    /* print arrays nicely for small arrays. not nice for larger arrays */
    let N = x.count
    var suffix = ", "
    print("matrix([")
    if N < 16{
        for i in 0..N{
            if i == (N-1) { suffix = ""}
            print(NSString(format: format+suffix, x[i]))
        }
        
    } else{
        for i in 0..8{
            if i==(8-1) { suffix = ""}
            print(NSString(format: format+suffix, x[i]))
        }
        suffix = ", "
        print(", ... ")
        for i in N-8..N{
            if i==(N-1) { suffix = ""}
            print(NSString(format: format+suffix, x[i]))
        }
        
        
    }
    print("])\n")
}
func print(x: matrix, prefix: String = "matrix([", postfix: String="])", format: String="%.3f")  {
    /* print arrays nicely for small arrays. not nice for larger arrays */
    let N = x.count
    var suffix = ", "
//    print("matrix([")
    print(prefix)
    if N < 16{
        for i in 0..N{
            if i == (N-1) { suffix = ""}
            print(NSString(format: format+suffix, x[i]))
        }
        
    } else{
        for i in 0..8{
            if i==(8-1) { suffix = ""}
            print(NSString(format: format+suffix, x[i]))
        }
        suffix = ", "
        print(", ... ")
        for i in N-8..N{
            if i==(N-1) { suffix = ""}
            print(NSString(format: format+suffix, x[i]))
        }
        
        
    }
    print(postfix)

}
// EQUALITY OPERATORS
// ~== : almost equal
/// ~== checks for almost equality in 1d arrays. two numbers are almost equal if `(x[i] - y[i]) < 1e-9
operator infix ~== {associativity none precedence 140}
func ~== (left: matrix, right: matrix) -> Bool{
    if left.count != right.count{
        println("`~=` only works with arrays of equal size!")
    }
    assert(left.count == right.count)
    var N = left.count
    var x = zeros(N)
    var not_false = 0
    for i in 0..N{
        if (left[i] - right[i]) > 1e-9{
            return false
        }
    }
    return true
}
// ==
/// strict equaility. can be very very difficult with incredibly precise floats -- look at ~== instead.
operator infix == {associativity none precedence 140}
func == (left: matrix, right: matrix) -> Bool{
    if left.count != right.count{
        println("`==` only works with arrays of equal size!")
    }
    assert(left.count == right.count)
    var N = left.count
    var x = zeros(N)
    var not_false = 0
    for i in 0..N{
        if left[i] != right[i]{
            return false
        }
    }
    return true
}


