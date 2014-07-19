//
//  oneD-functions.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate

func make_operator(lhs:matrix, operator:String, rhs:matrix) -> matrix{
    assert(lhs.n == rhs.n, "Sizes must match!")
    var array = zeros(lhs.n) // lhs[i], rhs[i]
    var arg_b = zeros(lhs.n)
    var arg_c = zeros(lhs.n)
    
    // see [1] on how to integrate Swift and accelerate
    // [1]:https://github.com/haginile/SwiftAccelerate
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
        CVWrapper.compare(!lhs, with: !rhs, using: operator.nsstring, into: !result, ofLength: lhs.n.cint)
        // since opencv uses images which use 8-bit values
        result /= 255
    }
    else {assert(false, "Operator not recongized!")}
    return result
}
func make_operator(lhs:matrix, operator:String, rhs:Double) -> matrix{
    var array = zeros(lhs.n)
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
    else if operator=="<" || operator==">" || operator=="<=" || operator==">="{
        CVWrapper.compare(!lhs, withDouble:rhs.cdouble, using:operator.nsstring, into:!array, ofLength:lhs.n.cint)
        array /= 255
    }
    else {assert(false, "Operator not recongnized! Error with the speedup?")}
    return array
}
func make_operator(lhs:Double, operator:String, rhs:matrix) -> matrix{
    var array = zeros(rhs.n) // lhs[i], rhs[i]
    var l = ones(rhs.n) * lhs
    if operator == "*"
        {array = make_operator(rhs, "*", lhs)}
    else if operator == "+"{
        array = make_operator(rhs, "+", lhs)}
    else if operator=="-"
        {array = -1 * make_operator(rhs, "-", lhs)}
    else if operator=="/"{
        array = make_operator(l, "/", rhs)}
    else if operator=="<"{
        array = make_operator(rhs, ">", lhs)}
    else if operator==">"{
        array = make_operator(rhs, "<", lhs)}
    else if operator=="<="{
        array = make_operator(rhs, ">=", lhs)}
    else if operator==">="{
        array = make_operator(rhs, "<=", lhs)}
    else {assert(false, "Operator not reconginzed")}
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
    return make_operator(lhs, ">=", rhs)}
func >= (lhs: matrix, rhs: matrix) -> matrix{
    return make_operator(lhs, ">=", rhs)}
func >= (lhs: Double, rhs: matrix) -> matrix{
    return make_operator(lhs, ">=", rhs)}
// LESS THAN OR EQUAL
operator infix <= {associativity none precedence 140}
func <= (lhs: matrix, rhs: Double) -> matrix{
    return make_operator(lhs, "<=", rhs)}
func <= (lhs: matrix, rhs: matrix) -> matrix{
    return make_operator(lhs, "<=", rhs)}
func <= (lhs: Double, rhs: matrix) -> matrix{
    return make_operator(lhs, "<=", rhs)}






























