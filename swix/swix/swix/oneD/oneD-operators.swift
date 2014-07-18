//
//  oneD-functions.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate

// SLOW PARTS: COMPARISON
// almost all of these function can be sped up (drastically) with Accelerate



func make_operator(lhs:matrix, operator:String, rhs:matrix) -> matrix{
    assert(lhs.n == rhs.n, "Sizes must match!")
    var array = zeros(lhs.n) // lhs[i], rhs[i]
    var arg_b = zeros(lhs.n)
    var arg_c = zeros(lhs.n)
    
    // see [1] on how to integrate Swift and accelerate
    // [1]:https://github.com/haginile/SwiftAccelerate
    if operator=="+" || operator=="-" || operator=="*" || operator=="/" || operator=="<" || operator==">" || operator=="<=" || operator==">="{
        var result = zeros(lhs.n)
        copy(lhs, result)
        var N = lhs.n
        if operator=="+"
            {cblas_daxpy(N.cint, 1.0.cdouble, !rhs, 1.cint, !result, 1.cint);}
        else if operator=="-"
            {cblas_daxpy(N.cint, -1.0.cdouble, !rhs, 1.cint, !result, 1.cint);}
        else if operator=="*"
            {vDSP_vmulD(!lhs, 1, !rhs, 1, !result, 1, vDSP_Length(lhs.grid.count))}
        else if operator=="/"
            {vDSP_vdivD(!rhs, 1, !lhs, 1, !result, 1, vDSP_Length(lhs.grid.count))}
        else if operator=="<" || operator==">" || operator==">=" || operator=="<="{
            result = zeros(lhs.n)
            compare_objc(!lhs, !rhs, !result, result.n.cint, operator.nsstring);
        }
        else {assert(false, "Operator not recongized!")}
        return result
    }
    else{
        for i in 0..<lhs.n{
            if operator == "<"{
                  if lhs[i] < rhs[i]{ array[i] = 1 }
            } else if operator == ">"{
                         if lhs[i] > rhs[i]{ array[i] = 1 }
            }else if operator == "<"{
                        if lhs[i] < rhs[i]{ array[i] = 1 }
            } else if operator == "<="{
                         if lhs[i] <= rhs[i]{ array[i] = 1 }
            } else if operator == ">="{
                         if lhs[i] >= rhs[i]{ array[i] = 1 }
            }else { assert(false, "Operator not reconginzed!") }
        }
    }
    return array
}
func make_operator(lhs:matrix, operator:String, rhs:Double) -> matrix{
    var array = zeros(lhs.n)
    if operator == "%" || operator=="*" || operator=="+" || operator=="/" || operator == "-"{
        var right = [rhs]
        if operator == "%"
            {mod_objc(!lhs, rhs, !array, lhs.n.cint);
        } else if operator == "*"
            {mul_scalar_objc(!lhs, rhs.cdouble, !array, lhs.n.cint)}
        else if operator == "+"
            {vDSP_vsaddD(!lhs, 1, &right, !array, 1, vDSP_Length(lhs.grid.count))}
        else if operator=="/"
            {vDSP_vsdivD(!lhs, 1, &right, !array, 1, vDSP_Length(lhs.grid.count))}
        else if operator=="-"
            {array = make_operator(lhs, "-", ones(lhs.n)*rhs)}
        else {assert(false, "Operator not recongnized! Error with the speedup?")}
    } else{
        for i in 0..<lhs.n{
            if operator == "<"{
                  if lhs[i] < rhs{ array[i] = 1 }
            } else if operator == ">"{
                         if lhs[i] > rhs{ array[i] = 1 }
            } else if operator == "<"{
                         if lhs[i] < rhs{
                            array[i] = 1 }
            } else if operator == "<="{
                         if lhs[i] <= rhs{
                            array[i] = 1 }
            } else if operator == ">="{
                         if lhs[i] >= rhs{ array[i] = 1 }
            } else if operator == "-"{
                 array[i] = lhs[i] - rhs
            } else if operator == "**"{
                array[i] = pow(lhs[i], rhs)
            } else { assert(false, "Operator not reconginzed!") }
        }
    }
    return array
}
func make_operator(lhs:Double, operator:String, rhs:matrix) -> matrix{
    var array = zeros(rhs.n) // lhs[i], rhs[i]
    if operator=="*" || operator=="+" || operator=="-" || operator=="/"{
        var xP = matrixToPointer(rhs)
        var arrayP = matrixToPointer(array)
        var l = ones(rhs.n) * lhs
        if operator == "*"
            {array = make_operator(rhs, "*", lhs)}
        else if operator == "+"{
            array = make_operator(rhs, "+", lhs)}
        else if operator=="-"
            {array = -1 * make_operator(rhs, "-", lhs)}
        else if operator=="/"{
            array = make_operator(l, "/", rhs)}
    } else{
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
            } else { assert(false, "Operator not reconginzed!") }
        }
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
    return make_operator(lhs, ">=", rhs)}
func >= (lhs: matrix, rhs: matrix) -> matrix{
    return make_operator(lhs, ">=", rhs)}
func >= (lhs: Double, rhs: matrix) -> matrix{
    assert(false, "For some reason these operators don't work'")
    return make_operator(lhs, ">=", rhs)}
// LESS THAN OR EQUAL
operator infix <= {associativity none precedence 140}
func <= (lhs: matrix, rhs: Double) -> matrix{
    assert(false, "For some reason these operators don't work'")
    return make_operator(lhs, "<=", rhs)}
func <= (lhs: matrix, rhs: matrix) -> matrix{
    return make_operator(lhs, "<=", rhs)}
func <= (lhs: Double, rhs: matrix) -> matrix{
    assert(false, "For some reason these operators don't work'")
    return make_operator(lhs, "<=", rhs)}






























