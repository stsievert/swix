//
//  twoD-operators.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate

func make_operator(lhs: matrix, operation: String, rhs: matrix)->matrix{
    assert(lhs.shape.0 == rhs.shape.0, "Sizes must match!")
    assert(lhs.shape.1 == rhs.shape.1, "Sizes must match!")
    
    var result = zeros_like(lhs) // real result
    var lhsM = lhs.flat
    var rhsM = rhs.flat
    var resM:ndarray = zeros_like(lhsM) // flat ndarray
    if operation=="+" {resM = lhsM + rhsM}
    else if operation=="-" {resM = lhsM - rhsM}
    else if operation=="*" {resM = lhsM * rhsM}
    else if operation=="/" {resM = lhsM / rhsM}
    else if operation=="<" {resM = lhsM < rhsM}
    else if operation==">" {resM = lhsM > rhsM}
    else if operation==">=" {resM = lhsM >= rhsM}
    else if operation=="<=" {resM = lhsM <= rhsM}
    result.flat.grid = resM.grid
    return result
}
func make_operator(lhs: matrix, operation: String, rhs: Double)->matrix{
    var result = zeros_like(lhs) // real result
//    var lhsM = asmatrix(lhs.grid) // flat
    var lhsM = lhs.flat
    var resM:ndarray = zeros_like(lhsM) // flat matrix
    if operation=="+" {resM = lhsM + rhs}
    else if operation=="-" {resM = lhsM - rhs}
    else if operation=="*" {resM = lhsM * rhs}
    else if operation=="/" {resM = lhsM / rhs}
    else if operation=="<" {resM = lhsM < rhs}
    else if operation==">" {resM = lhsM > rhs}
    else if operation==">=" {resM = lhsM >= rhs}
    else if operation=="<=" {resM = lhsM <= rhs}
    result.flat.grid = resM.grid
    return result
}
func make_operator(lhs: Double, operation: String, rhs: matrix)->matrix{
    var result = zeros_like(rhs) // real result
//    var rhsM = asmatrix(rhs.grid) // flat
    var rhsM = rhs.flat
    var resM:ndarray = zeros_like(rhsM) // flat matrix
    if operation=="+" {resM = lhs + rhsM}
    else if operation=="-" {resM = lhs - rhsM}
    else if operation=="*" {resM = lhs * rhsM}
    else if operation=="/" {resM = lhs / rhsM}
    else if operation=="<" {resM = lhs < rhsM}
    else if operation==">" {resM = lhs > rhsM}
    else if operation==">=" {resM = lhs >= rhsM}
    else if operation=="<=" {resM = lhs <= rhsM}
    result.flat.grid = resM.grid
    return result
}

// DOUBLE ASSIGNMENT
func <- (inout lhs:matrix, rhs:Double){
    var assign = ones((lhs.shape)) * rhs
    lhs = assign
}

// DOT PRODUCT
infix operator *! {associativity none precedence 140}
func *! (lhs: matrix, rhs: matrix) -> matrix{
    return dot(lhs, rhs)}
// SOLVE
infix operator !/ {associativity none precedence 140}
func !/ (lhs: matrix, rhs: ndarray) -> ndarray{
    return solve(lhs, rhs)}
// EQUALITY
func ~== (lhs: matrix, rhs: matrix) -> Bool{
    return (rhs.flat ~== lhs.flat)}

infix operator == {associativity none precedence 140}
func == (lhs: matrix, rhs: matrix)->matrix{
    return (lhs.flat == rhs.flat).reshape(lhs.shape)
}
infix operator !== {associativity none precedence 140}
func !== (lhs: matrix, rhs: matrix)->matrix{
    return (lhs.flat !== rhs.flat).reshape(lhs.shape)
}

/// ELEMENT WISE OPERATORS
// PLUS
infix operator + {associativity none precedence 140}
func + (lhs: matrix, rhs: matrix) -> matrix{
    return make_operator(lhs, "+", rhs)}
func + (lhs: Double, rhs: matrix) -> matrix{
    return make_operator(lhs, "+", rhs)}
func + (lhs: matrix, rhs: Double) -> matrix{
    return make_operator(lhs, "+", rhs)}
// MINUS
infix operator - {associativity none precedence 140}
func - (lhs: matrix, rhs: matrix) -> matrix{
    return make_operator(lhs, "-", rhs)}
func - (lhs: Double, rhs: matrix) -> matrix{
    return make_operator(lhs, "-", rhs)}
func - (lhs: matrix, rhs: Double) -> matrix{
    return make_operator(lhs, "-", rhs)}
// TIMES
infix operator * {associativity none precedence 140}
func * (lhs: matrix, rhs: matrix) -> matrix{
    return make_operator(lhs, "*", rhs)}
func * (lhs: Double, rhs: matrix) -> matrix{
    return make_operator(lhs, "*", rhs)}
func * (lhs: matrix, rhs: Double) -> matrix{
    return make_operator(lhs, "*", rhs)}
// DIVIDE
infix operator / {associativity none precedence 140}
func / (lhs: matrix, rhs: matrix) -> matrix{
    return make_operator(lhs, "/", rhs)
}
func / (lhs: Double, rhs: matrix) -> matrix{
    return make_operator(lhs, "/", rhs)}
func / (lhs: matrix, rhs: Double) -> matrix{
    return make_operator(lhs, "/", rhs)}
// LESS THAN
infix operator < {associativity none precedence 140}
func < (lhs: matrix, rhs: Double) -> matrix{
    return make_operator(lhs, "<", rhs)}
func < (lhs: matrix, rhs: matrix) -> matrix{
    return make_operator(lhs, "<", rhs)}
func < (lhs: Double, rhs: matrix) -> matrix{
    return make_operator(lhs, "<", rhs)}
// GREATER THAN
infix operator > {associativity none precedence 140}
func > (lhs: matrix, rhs: Double) -> matrix{
    return make_operator(lhs, ">", rhs)}
func > (lhs: matrix, rhs: matrix) -> matrix{
    return make_operator(lhs, ">", rhs)}
func > (lhs: Double, rhs: matrix) -> matrix{
    return make_operator(lhs, ">", rhs)}
// GREATER THAN OR EQUAL
infix operator >= {associativity none precedence 140}
func >= (lhs: matrix, rhs: Double) -> matrix{
    return make_operator(lhs, "=>", rhs)}
func >= (lhs: matrix, rhs: matrix) -> matrix{
    return make_operator(lhs, "=>", rhs)}
func >= (lhs: Double, rhs: matrix) -> matrix{
    return make_operator(lhs, "=>", rhs)}
// LESS THAN OR EQUAL
infix operator <= {associativity none precedence 140}
func <= (lhs: matrix, rhs: Double) -> matrix{
    return make_operator(lhs, "=>", rhs)}
func <= (lhs: matrix, rhs: matrix) -> matrix{
    return make_operator(lhs, "=>", rhs)}
func <= (lhs: Double, rhs: matrix) -> matrix{
    return make_operator(lhs, "=>", rhs)}