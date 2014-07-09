//
//  twoD_arth.swift
//  swix
//
//  Created by Scott Sievert on 6/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

// ARITHMETIC OPERATORS
// +

@assignment func += (inout x: matrix2d, right: Double){
    for i in 0..<x.count{
        x[i] = x[i] + right
    }
}
@assignment func *= (inout x: matrix2d, right: Double){
    for i in 0..<x.count{
        x[i] = x[i] * right
    }
}


operator infix + {associativity none precedence 140}
func + (left: matrix2d, right: matrix2d) -> matrix2d{
    if left.count != right.count{
        println("`+` only works with arrays of equal size!")
    }
    assert(left.count == right.count)
    assert(left[0].count == right[0].count)
    var N = left.count
    var M = left[0].count
    var x = zeros((N, M))
    for i in 0..<M{
        for j in 0..<N{
            x[j][i] = left[j][i] + right[j][i]
        }
    }
    return x
    
}
func + (left: matrix2d, right: Double) -> matrix2d{
    var N = left.count
    var M = left[0].count
    var x = zeros((N, M))
    for i in 0..<M{
        for j in 0..<N{
            x[j][i] = left[j][i] + right
        }
    }
    return x
}
func + (left: Double, right: matrix2d) -> matrix2d{
    var N = right.count
    var M = right[0].count
    var x = zeros((N, M))
    for i in 0..<M{
        for j in 0..<N{
            x[j][i] = right[j][i] + left
        }
    }
    return x
}
// *
operator infix * {associativity none precedence 140}
func * (left: matrix2d, right: matrix2d) -> matrix2d{
    if left.count != right.count{
        println("`*` only works with arrays of equal size!")
    }
    assert(left.count == right.count)
    assert(left[0].count == right[0].count)
    var N = left.count
    var M = left[0].count
    var x = zeros((N, M))
    for i in 0..<M{
        for j in 0..<N{
            x[j][i] = left[j][i] * right[j][i]
        }
    }
    return x
    
}
func * (left: matrix2d, right: Double) -> matrix2d{
    var N = left.count
    var M = left[0].count
    var x = zeros((N, M))
    for i in 0..<M{
        for j in 0..<N{
            x[j][i] = left[j][i] * right
        }
    }
    return x
}
func * (left: Double, right: matrix2d) -> matrix2d{
    var N = right.count
    var M = right[0].count
    var x = zeros((N, M))
    for i in 0..<M{
        for j in 0..<N{
            x[j][i] = right[j][i] * left
        }
    }
    return x
}
// -
operator infix - {associativity none precedence 140}
func - (left: matrix2d, right: matrix2d) -> matrix2d{
    if left.count != right.count{
        println("`-` only works with arrays of equal size!")
    }
    assert(left.count == right.count)
    assert(left[0].count == right[0].count)
    var N = left.count
    var M = left[0].count
    var x = zeros((N, M))
    for i in 0..<M{
        for j in 0..<N{
            x[j][i] = left[j][i] - right[j][i]
        }
    }
    return x
    
}
func - (left: matrix2d, right: Double) -> matrix2d{
    var N = left.count
    var M = left[0].count
    var x = zeros((N, M))
    for i in 0..<M{
        for j in 0..<N{
            x[j][i] = left[j][i] - right
        }
    }
    return x
}
func - (left: Double, right: matrix2d) -> matrix2d{
    var N = right.count
    var M = right[0].count
    var x = zeros((N, M))
    for i in 0..<M{
        for j in 0..<N{
            x[j][i] = right[j][i] - left
        }
    }
    return x
}
// /
operator infix / {associativity none precedence 140}
func / (left: matrix2d, right: matrix2d) -> matrix2d{
    if left.count != right.count{
        println("`/` only works with arrays of equal size!")
    }
    assert(left.count == right.count)
    assert(left[0].count == right[0].count)
    var N = left.count
    var M = left[0].count
    var x = zeros((N, M))
    for i in 0..<M{
        for j in 0..<N{
            x[j][i] = left[j][i] / right[j][i]
        }
    }
    return x
    
}
func / (left: matrix2d, right: Double) -> matrix2d{
    var N = left.count
    var M = left[0].count
    var x = zeros((N, M))
    for i in 0..<M{
        for j in 0..<N{
            x[j][i] = left[j][i] / right
        }
    }
    return x
}
func / (left: Double, right: matrix2d) -> matrix2d{
    var N = right.count
    var M = right[0].count
    var x = zeros((N, M))
    for i in 0..<M{
        for j in 0..<N{
            x[j][i] = right[j][i] / left
        }
    }
    return x
}