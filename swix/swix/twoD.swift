//
//  swiix.swift
//  swiix
//
//  Created by Scott Sievert on 6/10/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate

// nice initing
/// array("[1 2; 3 4]") == matrix([1, 2], [3, 4]). Note that this string requires a semicolon after every row except for the last row. the semicolon has to come right after the number. the braces can be dropped if need be, but I include them.
/// stricly uses the format "[1 2; 3 4]". spaces, semicolons, etc all in the same place (more rows/cols allowed)
///  specifically
///      * no space between `[` and first number: gives extra row
///      * no semicolon after last number: throws error
///      * braces (`[]`) can be dropped ("1 2; 3 4" gives same result)
func array(s: String) -> matrix2d{
    var t = s;
    if s.hasPrefix("[") {
        t = s.substringFromIndex(1)
    }
    if t.hasSuffix("]") {
        t = t.substringToIndex(countElements(t) - 1)
    }
    var rows = t.componentsSeparatedByString(";")
    var j = 0
    var M = rows.count
    var N = rows[0].componentsSeparatedByString(" ").count
    var mat = zeros((N, M))

    for item in rows {
        var numbers = item.componentsSeparatedByString(" ")
        var N = numbers.count

        // counting how many numbers we have
        var k = 0
        for i in 0..N{
            if !numbers[i].isEmpty{
                k++
            }
        }
        
        // assigning those numbers
        var row = zeros(k)
        k = 0
        for i in 0..N{
            if !numbers[i].isEmpty{
                row[k] = numbers[i].bridgeToObjectiveC().doubleValue
                k++
            }
        }
        mat[j] = row
        j++
    }
    
    return mat
}
/// zeros((2,2)) = matrix([[0, 0], [0, 0]])
func zeros(length: (Int, Int)) -> matrix2d {
    /* returns two dimensional array of zeros */
    // help from http://stackoverflow.com/questions/24051490/multidimensional-arrays-in-swift
    var NumColumns = length.0
    var NumRows = length.1
    
    var array = matrix2d()
    for column in 0..NumColumns {
        array.append(Array(count:NumRows, repeatedValue:Double(0)))
    }
    return array
}
/// ones((2,2)) = matrix([[1, 1], [1, 1]])
func ones(length: (Int, Int)) -> matrix2d {
    /* returns two dimensional array of zeros */
    // help from http://stackoverflow.com/questions/24051490/multidimensional-arrays-in-swift
    var NumColumns = length.0
    var NumRows = length.1
    
    var array = matrix2d()
    for column in 0..NumColumns {
        array.append(Array(count:NumRows, repeatedValue:Double(1)))
    }
    return array
}

/// nice printing
func println(x: matrix2d)  {
    /* print arrays nicely for small arrays. not nice for larger arrays */
    let NumRows = x.count
    for i in 0..NumRows{
        if i==0{
            print("matrix([")
        }else{
            print("       [")
        }
        print(x[i] as matrix)
        print("]")
//        print(NSString(format: "%.3f", x[i]))
        if i==(NumRows-1){
            print("])")
        }
        print("\n")
    }
}

func reshape(x: matrix, shape: (Int, Int)) -> matrix2d{
    assert(shape.0 * shape.1 == x.count)
    var y = zeros(shape)
    var k = 0
    for i in 0..shape.0{
        for j in 0..shape.1{
            y[i][j] = x[k]
            k = k + 1
        }
        
    }
    return y
}

func transpose (x: matrix2d) -> matrix2d{
    let n = x.count
    let m = x[0].count
    var y = zeros((m, n))
    for i in 0..m{
        for j in 0..m{
            y[i][j] = x[j][i]
        }
    }
    
    return y
}


// ==
operator infix == {associativity none precedence 140}
func == (left: matrix2d, right: matrix2d) -> Bool{
    if left.count != right.count{
        println("`==` only works with arrays of equal size!")
    }
    if left[0].count != right[0].count{
        println("`==` only works with arrays of equal size!")
    }
    assert(left.count == right.count)
    assert(left[0].count == right[0].count)
    var N = left.count
    var M = left[0].count
    for i in 0..M{
        for j in 0..N{
            if left[j][i] != right[j][i]{
                return false
            }
        }
    }
    return true
    
}

// ~~ : about equal
operator infix ~~ {associativity none precedence 140}
func ~~ (left: matrix2d, right: matrix2d) -> Bool{
    if left.count != right.count{
        println("`==` only works with arrays of equal size!")
    }
    if left[0].count != right[0].count{
        println("`==` only works with arrays of equal size!")
    }
    assert(left.count == right.count)
    assert(left[0].count == right[0].count)
    var N = left.count
    var M = left[0].count
    for i in 0..M{
        for j in 0..N{
            if left[j][i] - right[j][i] > 1e-9{
                return false
            }
        }
    }
    return true
}






