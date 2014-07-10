//
//  matrix2d.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
struct matrix2d {
    let n: Int
    var rows: Int
    var columns: Int
    var count: Int
//    var grid: [Double]
    var shape: (Int, Int)
    var flat:matrix
    init(columns: Int, rows: Int) {
        self.n = rows * columns
        self.rows = rows
        self.columns = columns
        self.shape = (rows, columns)
        self.count = n
//        grid = Array(count: n, repeatedValue: 0.0)
        self.flat = asmatrix(self.grid)
    }
    func indexIsValidForRow(r: Int, c: Int) -> Bool {
        return r >= 0 && r < rows && c>=0 && c < columns
    }
    subscript(i: Int, j: Int) -> Double {
        get {
            assert(indexIsValidForRow(i, c:j), "Index out of range")
//            return grid[i*columns + j]
            return flat[i*columns + j]
        }
        set {
            assert(indexIsValidForRow(i, c:j), "Index out of range")
//            grid[i*columns + j] = newValue
            flat[i*columns + j] = newValue
//            self.flat = asmatrix(self.grid)
        }
    }
    subscript(r: Range<Int>, c: Range<Int>) -> matrix2d {
        get {
            var x = zeros((r.endIndex - r.startIndex, c.endIndex - c.startIndex))
            var j=0
            var m=0, k=0
            for i in r {
                k = 0
                for j in c{
//                    x[k, m] = grid[j*columns + i]; k += 1
                    x[k, m] = flat[j*columns + i]; k += 1
                }
                m += 1
            }
            return x
        }
        set {
            var j = 0
            var m = 0
            for i in r {
                j = 0
                for k in c{
//                    grid[i*columns+k] = newValue[m, j]; j+=1
                    flat[i*columns+k] = newValue[m, j]; j+=1
                }
                m += 1
            }
//            self.flat = asmatrix(self.grid)
        }
    }
    subscript(r: matrix) -> matrix {
        get {
            var x = self.flat[r]
            return x
        }
        set {
            var j = 0
            for i in 0..<r.n{
//                grid[r[i].int] = newValue[j]; j+=1
                flat[r[i].int] = newValue[j]; j+=1
            }
//            self.flat = asmatrix(self.grid)
        }
    }
}

func println(x: matrix2d, prefix:String="matrix([", postfix:String="])", newline:String="\n", format:String="%.3f"){
    print(prefix)
    var suffix = ", "
    var printed = false
    for i in 0..<x.shape.0{
        if i>0 {print("        ")}
        for j in 0..<x.shape.1{
            print(x[i, j])
            print(", ")
        }
        if i<x.shape.0-1 {println("")}
    }
    print(postfix)
    print(newline)
}
func zeros_like(x: matrix2d) -> matrix2d{
    var y:matrix2d = zeros((x.shape.0, x.shape.1))
    return y
}
func transpose (x: matrix2d) -> matrix2d{
    let n = x.shape.0
    let m = x.shape.1
    var y = zeros((m, n))
    for i in 0..<m{
        for j in 0..<n{
            y[i,j] = x[j,i]
        }
    }
    return y
}
func argwhere(idx: matrix2d) -> matrix{
    return argwhere(idx.flat)
}



//func takesAMutablePointer(x: CMutablePointer<Float>) {
//    
//}

















