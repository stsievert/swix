//
//  oneD-functions.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate

func make_operator(lhs:ndarray, operation:String, rhs:ndarray) -> ndarray{
    assert(lhs.n == rhs.n, "Sizes must match!")
    var array = zeros(lhs.n) // lhs[i], rhs[i]
    var arg_b = zeros(lhs.n)
    var arg_c = zeros(lhs.n)
    
    // see [1] on how to integrate Swift and accelerate
    // [1]:https://github.com/haginile/SwiftAccelerate
    var result = lhs.copy()
    var N = lhs.n
    if operation=="+"
        {cblas_daxpy(N.cint, 1.0.cdouble, !rhs, 1.cint, !result, 1.cint);}
    else if operation=="-"
        {cblas_daxpy(N.cint, -1.0.cdouble, !rhs, 1.cint, !result, 1.cint);}
    else if operation=="*"
        {vDSP_vmulD(!lhs, 1, !rhs, 1, !result, 1, vDSP_Length(lhs.grid.count))}
    else if operation=="/"
        {vDSP_vdivD(!rhs, 1, !lhs, 1, !result, 1, vDSP_Length(lhs.grid.count))}
    else if operation=="<" || operation==">" || operation==">=" || operation=="<=" || operation=="==" || operation=="!=="{
        result = zeros(lhs.n)
        CVWrapper.compare(!lhs, with: !rhs, using: operation.nsstring, into: !result, ofLength: lhs.n.cint)
        // since opencv uses images which use 8-bit values
        result /= 255
    }
    else {assert(false, "operation not recongized!")}
    return result
}
func make_operator(lhs:ndarray, operation:String, rhs:Double) -> ndarray{
    var array = zeros(lhs.n)
    var right = [rhs]
    if operation == "%"
        // unoptimized. for loop in c
        {mod_objc(!lhs, rhs, !array, lhs.n.cint);
    } else if operation == "*"
        {mul_scalar_objc(!lhs, rhs.cdouble, !array, lhs.n.cint)}
    else if operation == "+"
        {vDSP_vsaddD(!lhs, 1, &right, !array, 1, vDSP_Length(lhs.grid.count))}
    else if operation=="/"
        {vDSP_vsdivD(!lhs, 1, &right, !array, 1, vDSP_Length(lhs.grid.count))}
    else if operation=="-"
        {array = make_operation(lhs, "-", ones(lhs.n)*rhs)}
    else if operation=="<" || operation==">" || operation=="<=" || operation==">="{
        CVWrapper.compare(!lhs, withDouble:rhs.cdouble, using:operation.nsstring, into:!array, ofLength:lhs.n.cint)
        array /= 255
    }
    else {assert(false, "operation not recongnized! Error with the speedup?")}
    return array
}
func make_operator(lhs:Double, operation:String, rhs:ndarray) -> ndarray{
    var array = zeros(rhs.n) // lhs[i], rhs[i]
    var l = ones(rhs.n) * lhs
    if operation == "*"
        {array = make_operator(rhs, "*", lhs)}
    else if operation == "+"{
        array = make_operator(rhs, "+", lhs)}
    else if operation=="-"
        {array = -1 * make_operator(rhs, "-", lhs)}
    else if operation=="/"{
        array = make_operator(l, "/", rhs)}
    else if operation=="<"{
        array = make_operator(rhs, ">", lhs)}
    else if operation==">"{
        array = make_operator(rhs, "<", lhs)}
    else if operation=="<="{
        array = make_operator(rhs, ">=", lhs)}
    else if operation==">="{
        array = make_operator(rhs, "<=", lhs)}
    else {assert(false, "Operator not reconginzed")}
    return array
}

// EQUALITY
infix operator ~== {associativity none precedence 140}
func ~== (lhs: ndarray, rhs: ndarray) -> Bool{
    assert(lhs.n == rhs.n, "`~==` only works on arrays of equal size")
    return max(abs(lhs - rhs)) > 1e-6 ? false : true;
}
func == (lhs: ndarray, rhs: ndarray) -> ndarray{
    return make_operator(lhs, "==", rhs)}
func !== (lhs: ndarray, rhs: ndarray) -> ndarray{
    return make_operator(lhs, "!==", rhs)}

// NICE ARITHMETIC
func += (inout x: ndarray, right: Double){
    x = x + right}
func *= (inout x: ndarray, right: Double){
    x = x * right}
func -= (inout x: ndarray, right: Double){
    x = x - right}
func /= (inout x: ndarray, right: Double){
    x = x / right}

// MOD
infix operator % {associativity none precedence 140}
func % (lhs: ndarray, rhs: Double) -> ndarray{
    return make_operator(lhs, "%", rhs)}
// POW
infix operator ^ {associativity none precedence 140}
func ^ (lhs: ndarray, rhs: Double) -> ndarray{
    return pow(lhs, rhs)}
// PLUS
infix operator + {associativity none precedence 140}
func + (lhs: ndarray, rhs: ndarray) -> ndarray{
    return make_operator(lhs, "+", rhs)}
func + (lhs: Double, rhs: ndarray) -> ndarray{
    return make_operator(lhs, "+", rhs)}
func + (lhs: ndarray, rhs: Double) -> ndarray{
    return make_operator(lhs, "+", rhs)}
// MINUS
infix operator - {associativity none precedence 140}
func - (lhs: ndarray, rhs: ndarray) -> ndarray{
    return make_operator(lhs, "-", rhs)}
func - (lhs: Double, rhs: ndarray) -> ndarray{
    return make_operator(lhs, "-", rhs)}
func - (lhs: ndarray, rhs: Double) -> ndarray{
    return make_operator(lhs, "-", rhs)}
// TIMES
infix operator * {associativity none precedence 140}
func * (lhs: ndarray, rhs: ndarray) -> ndarray{
    return make_operator(lhs, "*", rhs)}
func * (lhs: Double, rhs: ndarray) -> ndarray{
    return make_operator(lhs, "*", rhs)}
func * (lhs: ndarray, rhs: Double) -> ndarray{
    return make_operator(lhs, "*", rhs)}
// DIVIDE
infix operator / {associativity none precedence 140}
func / (lhs: ndarray, rhs: ndarray) -> ndarray{
    return make_operator(lhs, "/", rhs)
    }
func / (lhs: Double, rhs: ndarray) -> ndarray{
    return make_operator(lhs, "/", rhs)}
func / (lhs: ndarray, rhs: Double) -> ndarray{
    return make_operator(lhs, "/", rhs)}
// LESS THAN
infix operator < {associativity none precedence 140}
func < (lhs: ndarray, rhs: Double) -> ndarray{
    return make_operator(lhs, "<", rhs)}
func < (lhs: ndarray, rhs: ndarray) -> ndarray{
    return make_operator(lhs, "<", rhs)}
func < (lhs: Double, rhs: ndarray) -> ndarray{
    return make_operator(lhs, "<", rhs)}
// GREATER THAN
infix operator > {associativity none precedence 140}
func > (lhs: ndarray, rhs: Double) -> ndarray{
    return make_operator(lhs, ">", rhs)}
func > (lhs: ndarray, rhs: ndarray) -> ndarray{
    return make_operator(lhs, ">", rhs)}
func > (lhs: Double, rhs: ndarray) -> ndarray{
    return make_operator(lhs, ">", rhs)}
// GREATER THAN OR EQUAL
infix operator >= {associativity none precedence 140}
func >= (lhs: ndarray, rhs: Double) -> ndarray{
    return make_operator(lhs, ">=", rhs)}
func >= (lhs: ndarray, rhs: ndarray) -> ndarray{
    return make_operator(lhs, ">=", rhs)}
func >= (lhs: Double, rhs: ndarray) -> ndarray{
    return make_operator(lhs, ">=", rhs)}
// LESS THAN OR EQUAL
infix operator <= {associativity none precedence 140}
func <= (lhs: ndarray, rhs: Double) -> ndarray{
    return make_operator(lhs, "<=", rhs)}
func <= (lhs: ndarray, rhs: ndarray) -> ndarray{
    return make_operator(lhs, "<=", rhs)}
func <= (lhs: Double, rhs: ndarray) -> ndarray{
    return make_operator(lhs, "<=", rhs)}






























