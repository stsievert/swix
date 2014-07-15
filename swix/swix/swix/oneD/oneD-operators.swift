//
//  oneD-functions.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate

// SLOW PARTS: almost everything
// almost all of these function can be sped up (drastically) with Accelerate

func copy(x: matrix, y: matrix){
    var xP = matrixToPointer(x)
    var yP = matrixToPointer(y)
    var N = x.n
    cblas_dcopy(N.cint, xP, 1.cint, yP, 1.cint)
}

func make_operator(lhs:matrix, operator:String, rhs:matrix) -> matrix{
    assert(lhs.n == rhs.n, "Sizes must match!")
    var array = zeros(lhs.n) // lhs[i], rhs[i]
    var arg_b = zeros(lhs.n)
    var arg_c = zeros(lhs.n)
    
    // accelerate integration would go here.
    // see [1] on how to integrate Swift and accelerate
    //
    // [1]:https://github.com/haginile/SwiftAccelerate
    if operator=="+" || operator=="-"{// || operator=="*" || operator=="/"{
        var rP = matrixToPointer(rhs)
        var result = zeros(lhs.n)
        
        copy(lhs, result)
        var lP = matrixToPointer(result)
        var N = lhs.n
        if operator=="+"
            {cblas_daxpy(N.cint, 1.0.cdouble, rP, 1.cint, lP, 1.cint);}
        if operator=="-"
            {cblas_daxpy(N.cint, -1.0.cdouble, rP, 1.cint, lP, 1.cint);}
        return result
    }
    for i in 0..<lhs.n{
        if operator == "<"{
              if lhs[i] < rhs[i]{ array[i] = 1 }
        } else if operator == ">"{
                     if lhs[i] > rhs[i]{ array[i] = 1 }
        }else if operator == "<"{
                    if lhs[i] < rhs[i]{ array[i] = 1 }
        }else if operator == "~=="{
                    if abs(lhs[i] - rhs[i])<1e-9{ array[i] = 1 }
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
//    if operator == "%"{
//        var xP = matrixToPointer(lhs)
//        var arrayP = matrixToPointer(array)
//        mod_objc(xP, arrayP, lhs.n.cint);
//    }
    for i in 0..<lhs.n{
        if operator == "<"{
              if lhs[i] < rhs{ array[i] = 1 }
        } else if operator == ">"{
                     if lhs[i] > rhs{ array[i] = 1 }
        } else if operator == "<"{
                     if lhs[i] < rhs{
                        array[i] = 1 }
        } else if operator == "~=="{
                     if abs(lhs[i] - rhs)<1e-9{ array[i] = 1 }
        } else if operator == "<="{
                     if lhs[i] <= rhs{
                        array[i] = 1 }
        } else if operator == ">="{
                     if lhs[i] >= rhs{ array[i] = 1 }
        } else if operator == "+"{
             array[i] = lhs[i] + rhs
        } else if operator == "-"{
             array[i] = lhs[i] - rhs
        } else if operator == "*"{
             array[i] = lhs[i] * rhs
        } else if operator == "/"{
            array[i] = lhs[i] / rhs
        } else if operator == "**"{
            array[i] = pow(lhs[i], rhs)
        } else if operator == "%"{
            array[i] = lhs[i] % rhs
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
            if         abs(lhs - rhs[i])<1e-9 { array[i] = 1 }
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

// EQUALITY
operator infix ~== {associativity none precedence 140}
func ~== (lhs: matrix, rhs: matrix) -> Bool{
    assert(lhs.n == rhs.n, "`+` only works on arrays of equal size")
    if max(abs(lhs - rhs)) > 1e-6{
        return false
    } else{
        return true
    }
}
func ~== (lhs: matrix, rhs: matrix) -> matrix{
    // sees where two matrices are about equal, for use with argwhere
    return make_operator(lhs, "~==", rhs)
}

// NICE ARITHMETIC
@assignment func += (inout x: matrix, right: Double){
    x = x + right
}
@assignment func *= (inout x: matrix, right: Double){
    x = x * right
}
@assignment func -= (inout x: matrix, right: Double){
    x = x - right
}
@assignment func /= (inout x: matrix, right: Double){
    x = x / right
}

// MOD
operator infix % {associativity none precedence 140}
func % (lhs: matrix, rhs: Double) -> matrix{
    return make_operator(lhs, "%", rhs)}
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
    assert(false, "For some reason these operators don't work'")
    return make_operator(lhs, "=>", rhs)}
func >= (lhs: matrix, rhs: matrix) -> matrix{
    assert(false, "For some reason these operators don't work'")
    return make_operator(lhs, "=>", rhs)}
func >= (lhs: Double, rhs: matrix) -> matrix{
    assert(false, "For some reason these operators don't work'")
    return make_operator(lhs, "=>", rhs)}
// LESS THAN OR EQUAL
operator infix <= {associativity none precedence 140}
func <= (lhs: matrix, rhs: Double) -> matrix{
    assert(false, "For some reason these operators don't work'")
    return make_operator(lhs, "=>", rhs)}
func <= (lhs: matrix, rhs: matrix) -> matrix{
    assert(false, "For some reason these operators don't work'")
    return make_operator(lhs, "=>", rhs)}
func <= (lhs: Double, rhs: matrix) -> matrix{
    assert(false, "For some reason these operators don't work'")
    return make_operator(lhs, "=>", rhs)}






























