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
        }else if operator == "<"{
                    if lhs[i] < rhs[i]{ array[i] = 1 }
        }else if operator == "~=="{
                    if abs(lhs[i] - rhs[i])<DOUBLE_EPSILON{ array[i] = 1 }
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
        }else { assert(false, "Operator not reconginzed!") }
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
        } else if operator == "<"{
                     if lhs[i] < rhs{ array[i] = 1 }
        } else if operator == "~=="{
                     if abs(lhs[i] - rhs)<DOUBLE_EPSILON{ array[i] = 1 }
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
        }else { assert(false, "Operator not reconginzed!") }
    }
    return array
}
func make_operator(lhs:Double, operator:String, rhs:matrix) -> matrix{
    var array = zeros(rhs.n) // lhs[i], rhs[i]
    for i in 0..<rhs.n{
        if operator == "<"{
            if      lhs < rhs[i]{ array[i] = 1 }
        } else if operator == ">"{
            if             lhs > rhs[i]{ array[i] = 1 }
        } else if operator == "<"{
            if             lhs < rhs[i]{ array[i] = 1 }
        } else if operator == "~=="{
            if         abs(lhs - rhs[i])<DOUBLE_EPSILON { array[i] = 1 }
        } else if operator == "<="{
            if         lhs <= rhs[i]{ array[i] = 1 }
        } else if operator == ">="{
            if             lhs >= rhs[i]{ array[i] = 1 }
        } else if operator == "+"{
            array[i] =     lhs + rhs[i]
        } else if operator == "-"{
            array[i] =      lhs - rhs[i]
        } else if operator == "*"{
            array[i] =     lhs * rhs[i]
        } else if operator == "/"{
            array[i] =     lhs / rhs[i]
        } else { assert(false, "Operator not reconginzed!") }
    }
    return array
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

// EQUALITY
operator infix == {associativity none precedence 140}
func == (lhs: matrix, rhs: matrix) -> Bool{
    assert(lhs.n == rhs.n, "`+` only works on arrays of equal size")
    var x = zeros(lhs.n)
    for i in 0..<lhs.n{
        if lhs[i] != rhs[i]{ return false}
    }
    return true
    
}
operator infix ~== {associativity none precedence 140}
func ~== (lhs: matrix, rhs: matrix) -> matrix{
//    assert(lhs.count == rhs.count, "`~==` only works with arrays of equal size!")
//    var x = zeros(lhs.n)
//    for i in 0..<lhs.n{
//        if abs(lhs[i] - rhs[i]) > 1e-9 {return false}
//    }
    return make_operator(lhs, "~==", rhs)
}

// PLUS
operator infix + {associativity none precedence 140}
func + (lhs: matrix, rhs: matrix) -> matrix{
    return make_operator(lhs, "+", rhs)}
func + (lhs: Double, rhs: matrix) -> matrix{
    return make_operator(lhs, "+", rhs)}
func + (lhs: matrix, rhs: Double) -> matrix{
    return make_operator(lhs, "+", rhs)}
// MINUS
operator infix - {associativity none precedence 140}
func - (lhs: matrix, rhs: matrix) -> matrix{
    return make_operator(lhs, "-", rhs)}
func - (lhs: Double, rhs: matrix) -> matrix{
    return make_operator(lhs, "-", rhs)}
func - (lhs: matrix, rhs: Double) -> matrix{
    return make_operator(lhs, "-", rhs)}
// TIMES
operator infix * {associativity none precedence 140}
func * (lhs: matrix, rhs: matrix) -> matrix{
    return make_operator(lhs, "*", rhs)}
func * (lhs: Double, rhs: matrix) -> matrix{
    return make_operator(lhs, "*", rhs)}
func * (lhs: matrix, rhs: Double) -> matrix{
    return make_operator(lhs, "*", rhs)}
// DIVIDE
operator infix / {associativity none precedence 140}
func / (lhs: matrix, rhs: matrix) -> matrix{
    return make_operator(lhs, "/", rhs)
    }
func / (lhs: Double, rhs: matrix) -> matrix{
    return make_operator(lhs, "/", rhs)}
func / (lhs: matrix, rhs: Double) -> matrix{
    return make_operator(lhs, "/", rhs)}
// LESS THAN
operator infix < {associativity none precedence 140}
func < (lhs: matrix, rhs: Double) -> matrix{
    return make_operator(lhs, "<", rhs)}
func < (lhs: matrix, rhs: matrix) -> matrix{
    return make_operator(lhs, "<", rhs)}
func < (lhs: Double, rhs: matrix) -> matrix{
    return make_operator(lhs, "<", rhs)}
// GREATER THAN
operator infix > {associativity none precedence 140}
func > (lhs: matrix, rhs: Double) -> matrix{
    return make_operator(lhs, ">", rhs)}
func > (lhs: matrix, rhs: matrix) -> matrix{
    return make_operator(lhs, ">", rhs)}
func > (lhs: Double, rhs: matrix) -> matrix{
    return make_operator(lhs, ">", rhs)}
// GREATER THAN OR EQUAL
operator infix >= {associativity none precedence 140}
func >= (lhs: matrix, rhs: Double) -> matrix{
    return make_operator(lhs, "=>", rhs)}
func >= (lhs: matrix, rhs: matrix) -> matrix{
    return make_operator(lhs, "=>", rhs)}
func >= (lhs: Double, rhs: matrix) -> matrix{
    return make_operator(lhs, "=>", rhs)}
// LESS THAN OR EQUAL
operator infix <= {associativity none precedence 140}
func <= (lhs: matrix, rhs: Double) -> matrix{
    return make_operator(lhs, "=>", rhs)}
func <= (lhs: matrix, rhs: matrix) -> matrix{
    return make_operator(lhs, "=>", rhs)}
func <= (lhs: Double, rhs: matrix) -> matrix{
    return make_operator(lhs, "=>", rhs)}






























