//
//  oneD-functions.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

func make_operator(lhs:matrix, operator:String, rhs:matrix) -> matrix{
    assert(lhs.n == rhs.n, "Sizes must match!")
    var array = zeros(lhs.n) // lhs[i], rhs[i]
    var arg_b = zeros(lhs.n)
    var arg_c = zeros(lhs.n)
    for i in 0..<lhs.n{
        if operator == "<"{
            if lhs[i] < rhs[i]{ array[i] = 1 }
        } else if operator == ">"{
            if lhs[i] > rhs[i]{ array[i] = 1 }
        }else if operator == "=="{
            if lhs[i] == rhs[i]{ array[i] = 1 }
        } else if operator == "<="{
            if lhs[i] <= rhs[i]{ array[i] = 1 }
        } else if operator == ">="{
            if lhs[i] >= rhs[i]{ array[i] = 1 }
        } else if operator == "+"{
            array[i] = lhs[i] + rhs[i]
        } else if operator == "-"{
            array[i] = lhs[i] - rhs[i]
        } else if operator == "*"{
            array[i] = lhs[i] * rhs[i]
        }  else if operator == "/"{
            array[i] = lhs[i] / rhs[i]
        }else { assert(0==1, "Operator not reconginzed!") }
    }
    return array
}
func make_operator(lhs:matrix, operator:String, rhs:Double) -> matrix{
    var array = zeros(lhs.n)
    for i in 0..<lhs.n{
        if operator == "<"{
            if lhs[i] < rhs{ array[i] = 1 }
        } else if operator == ">"{
            if lhs[i] > rhs{ array[i] = 1 }
        } else if operator == "=="{
            if lhs[i] == rhs{ array[i] = 1 }
        } else if operator == "<="{
            if lhs[i] <= rhs{ array[i] = 1 }
        } else if operator == ">="{
            if lhs[i] >= rhs{ array[i] = 1 }
        } else if operator == "+"{
            array[i] = lhs[i] + rhs
        } else if operator == "-"{
            array[i] = lhs[i] - rhs
        } else if operator == "*"{
            array[i] = lhs[i] * rhs
        }else if operator == "/"{
            array[i] = lhs[i] / rhs
        }else { assert(0==1, "Operator not reconginzed!") }
    }
    return array
}
func make_operator(lhs:Double, operator:String, rhs:matrix) -> matrix{
    var array = zeros(rhs.n) // lhs[i], rhs[i]
    for i in 0..<rhs.n{
        if operator == "<"{
            if lhs < rhs[i]{ array[i] = 1 }
        } else if operator == ">"{
            if lhs > rhs[i]{ array[i] = 1 }
        } else if operator == "=="{
            if lhs == rhs[i]{ array[i] = 1 }
        } else if operator == "<="{
            if lhs <= rhs[i]{ array[i] = 1 }
        } else if operator == ">="{
            if lhs >= rhs[i]{ array[i] = 1 }
        } else if operator == "+"{
            array[i] = lhs + rhs[i]
        } else if operator == "-"{
            array[i] = lhs - rhs[i]
        } else if operator == "*"{
            array[i] = lhs * rhs[i]
        } else if operator == "/"{
            array[i] = lhs / rhs[i]
        } else { assert(0==1, "Operator not reconginzed!") }
    }
    return array
}

/// argwhere(x < 2) or argwhere(x < y) works as expected
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
    return make_operator(left, "+", right)}
func + (left: Double, right: matrix) -> matrix{
    return make_operator(left, "+", right)}
func + (left: matrix, right: Double) -> matrix{
    return make_operator(left, "+", right)}
// MINUS
operator infix - {associativity none precedence 140}
func - (left: matrix, right: matrix) -> matrix{
    return make_operator(left, "-", right)}
func - (left: Double, right: matrix) -> matrix{
    return make_operator(left, "-", right)}
func - (left: matrix, right: Double) -> matrix{
    return make_operator(left, "-", right)}
// TIMES
operator infix * {associativity none precedence 140}
func * (left: matrix, right: matrix) -> matrix{
    return make_operator(left, "*", right)}
func * (left: Double, right: matrix) -> matrix{
    return make_operator(left, "*", right)}
func * (left: matrix, right: Double) -> matrix{
    return make_operator(left, "*", right)}
// DIVIDE
operator infix / {associativity none precedence 140}
func / (left: matrix, right: matrix) -> matrix{
    return make_operator(left, "/", right)
    }
func / (left: Double, right: matrix) -> matrix{
    return make_operator(left, "/", right)}
func / (left: matrix, right: Double) -> matrix{
    return make_operator(left, "/", right)}
// LESS THAN
operator infix < {associativity none precedence 140}
func < (left: matrix, right: Double) -> matrix{
    return make_operator(left, "<", right)}
func < (left: matrix, right: matrix) -> matrix{
    assert(left.n == right.n, "Sizes don't match!")
    return make_operator(left, "<", right)}
func < (left: Double, right: matrix) -> matrix{
    return make_operator(left, "<", right)}
// GREATER THAN
operator infix > {associativity none precedence 140}
func > (left: matrix, right: Double) -> matrix{
    return make_operator(left, "<", right)}
func > (left: matrix, right: matrix) -> matrix{
    assert(left.n == right.n, "Sizes don't match!")
    return make_operator(left, "<", right)}
func > (left: Double, right: matrix) -> matrix{
    return make_operator(left, "<", right)}































