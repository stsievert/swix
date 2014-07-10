//
//  twoD-operators.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

func make_operator(lhs: matrix2d, operator: String, rhs: matrix2d)->matrix2d{
    assert(lhs.shape.0 == rhs.shape.0, "Sizes must match!")
    assert(lhs.shape.1 == rhs.shape.1, "Sizes must match!")
    
    var result = zeros_like(lhs) // real result
    var lhsM = asmatrix(lhs.grid) // flat
    var rhsM = asmatrix(rhs.grid) // flat
    var resM:matrix = zeros_like(lhsM) // flat matrix
    if operator=="+" {resM = lhsM + rhsM}
    else if operator=="-" {resM = lhsM - rhsM}
    else if operator=="*" {resM = lhsM * rhsM}
    else if operator=="/" {resM = lhsM / rhsM}
    else if operator=="<" {resM = lhsM < rhsM}
    else if operator==">" {resM = lhsM > rhsM}
    else if operator==">=" {resM = lhsM >= rhsM}
    else if operator=="<=" {resM = lhsM <= rhsM}
    result.grid = resM.grid
    result.flat = asmatrix(result.grid)
    return result
}
func make_operator(lhs: matrix2d, operator: String, rhs: Double)->matrix2d{
    var result = zeros_like(lhs) // real result
    var lhsM = asmatrix(lhs.grid) // flat
    var resM:matrix = zeros_like(lhsM) // flat matrix
    if operator=="+" {resM = lhsM + rhs}
    else if operator=="-" {resM = lhsM - rhs}
    else if operator=="*" {resM = lhsM * rhs}
    else if operator=="/" {resM = lhsM / rhs}
    else if operator=="<" {resM = lhsM < rhs}
    else if operator==">" {resM = lhsM > rhs}
    else if operator==">=" {resM = lhsM >= rhs}
    else if operator=="<=" {resM = lhsM <= rhs}
    result.grid = resM.grid
    result.flat = asmatrix(result.grid)
    return result
}
func make_operator(lhs: Double, operator: String, rhs: matrix2d)->matrix2d{
    var result = zeros_like(rhs) // real result
    var rhsM = asmatrix(rhs.grid) // flat
    var resM:matrix = zeros_like(rhsM) // flat matrix
    if operator=="+" {resM = lhs + rhsM}
    else if operator=="-" {resM = lhs - rhsM}
    else if operator=="*" {resM = lhs * rhsM}
    else if operator=="/" {resM = lhs / rhsM}
    else if operator=="<" {resM = lhs < rhsM}
    else if operator==">" {resM = lhs > rhsM}
    else if operator==">=" {resM = lhs >= rhsM}
    else if operator=="<=" {resM = lhs <= rhsM}
    result.grid = resM.grid
    result.flat = asmatrix(result.grid)
    return result
}


// PLUS
operator infix + {associativity none precedence 140}
func + (lhs: matrix2d, rhs: matrix2d) -> matrix2d{
    return make_operator(lhs, "+", rhs)}
func + (lhs: Double, rhs: matrix2d) -> matrix2d{
    return make_operator(lhs, "+", rhs)}
func + (lhs: matrix2d, rhs: Double) -> matrix2d{
    return make_operator(lhs, "+", rhs)}
// MINUS
operator infix - {associativity none precedence 140}
func - (lhs: matrix2d, rhs: matrix2d) -> matrix2d{
    return make_operator(lhs, "-", rhs)}
func - (lhs: Double, rhs: matrix2d) -> matrix2d{
    return make_operator(lhs, "-", rhs)}
func - (lhs: matrix2d, rhs: Double) -> matrix2d{
    return make_operator(lhs, "-", rhs)}
// TIMES
operator infix * {associativity none precedence 140}
func * (lhs: matrix2d, rhs: matrix2d) -> matrix2d{
    return make_operator(lhs, "*", rhs)}
func * (lhs: Double, rhs: matrix2d) -> matrix2d{
    return make_operator(lhs, "*", rhs)}
func * (lhs: matrix2d, rhs: Double) -> matrix2d{
    return make_operator(lhs, "*", rhs)}
// DIVIDE
operator infix / {associativity none precedence 140}
func / (lhs: matrix2d, rhs: matrix2d) -> matrix2d{
    return make_operator(lhs, "/", rhs)
}
func / (lhs: Double, rhs: matrix2d) -> matrix2d{
    return make_operator(lhs, "/", rhs)}
func / (lhs: matrix2d, rhs: Double) -> matrix2d{
    return make_operator(lhs, "/", rhs)}
// EQUALITY
operator infix == {associativity none precedence 140}
func == (lhs: matrix2d, rhs: matrix2d) -> Bool{
    assert(lhs.n == rhs.n, "`+` only works on arrays of equal size")
    return lhs.flat == rhs.flat
}
// LESS THAN
operator infix < {associativity none precedence 140}
func < (lhs: matrix2d, rhs: Double) -> matrix2d{
    return make_operator(lhs, "<", rhs)}
func < (lhs: matrix2d, rhs: matrix2d) -> matrix2d{
    return make_operator(lhs, "<", rhs)}
func < (lhs: Double, rhs: matrix2d) -> matrix2d{
    return make_operator(lhs, "<", rhs)}
// GREATER THAN
operator infix > {associativity none precedence 140}
func > (lhs: matrix2d, rhs: Double) -> matrix2d{
    return make_operator(lhs, ">", rhs)}
func > (lhs: matrix2d, rhs: matrix2d) -> matrix2d{
    return make_operator(lhs, ">", rhs)}
func > (lhs: Double, rhs: matrix2d) -> matrix2d{
    return make_operator(lhs, ">", rhs)}
// GREATER THAN OR EQUAL
operator infix >= {associativity none precedence 140}
func >= (lhs: matrix2d, rhs: Double) -> matrix2d{
    return make_operator(lhs, "=>", rhs)}
func >= (lhs: matrix2d, rhs: matrix2d) -> matrix2d{
    return make_operator(lhs, "=>", rhs)}
func >= (lhs: Double, rhs: matrix2d) -> matrix2d{
    return make_operator(lhs, "=>", rhs)}
// LESS THAN OR EQUAL
operator infix <= {associativity none precedence 140}
func <= (lhs: matrix2d, rhs: Double) -> matrix2d{
    return make_operator(lhs, "=>", rhs)}
func <= (lhs: matrix2d, rhs: matrix2d) -> matrix2d{
    return make_operator(lhs, "=>", rhs)}
func <= (lhs: Double, rhs: matrix2d) -> matrix2d{
    return make_operator(lhs, "=>", rhs)}