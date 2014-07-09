//
//  constants.swift
//  swix
//
//  Created by Scott Sievert on 6/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate

// mathematical constants
let pi = 3.14159265358979323846264338327950288419716939937510582
let e  = 2.71828182845904523536028747135266249775724709369995
let euler = 0.57721566490153286060651209008240243104215933593992
let phi = (1.double + sqrt(5))/2
let inf = 1.0 / 0.0
let sqrt2 = sqrt(2.double)
let epsilon = DBL_EPSILON // smallest difference of two doubles

typealias matrix = [Double]
typealias matrix2d = [[Double]]

// add extension here -- indexing, x[0..4] = 1 etc
extension Array{
    // issues with Array<Double> and extending non-protocol type. Smells like a Swift0.1 bug: http://stackoverflow.com/questions/24047164/extension-of-constructed-generic-type-in-swift
    // possible struct instead? http://stackoverflow.com/questions/24046792/swift-generics-requiring-addition-and-multiplication-abilities-of-a-type
    func flat() -> matrix{
        // ran into issues here. tried `let N = self[0].shape` which works for 2D arrays but compiler fail
        return ones(4)
    }
}
//struct matrix2d {
//    let rows: Int, columns: Int
//    var grid: [Double]
//    var count: Int
//    init(rows: Int, columns: Int) {
//        self.rows = rows
//        self.columns = columns
//        grid = Array(count: rows * columns, repeatedValue: 0.0)
//        self.count = row * columns
//    }
//    func indexIsValidForRow(row: Int, column: Int) -> Bool {
//        return row >= 0 && row < rows && column >= 0 && column < columns
//    }
//    subscript(row: Int, column: Int) -> Double {
//        get {
//            assert(indexIsValidForRow(row, column: column), "Index out of range")
//            return grid[(row * columns) + column]
//        }
//        set {
//            assert(indexIsValidForRow(row, column: column), "Index out of range")
//            grid[(row * columns) + column] = newValue
//        }
//    }
//}



