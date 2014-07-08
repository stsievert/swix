//
//  objc_swift_conversion.swift
//  swix
//
//  Created by Scott Sievert on 6/13/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

// an unsafe pointer to matrix
func convertDoubleToMatrix(yy: UnsafePointer<CDouble>, N: Int) -> matrix{
    // assumes yy the output of some objc function that returns double *
    var y = zeros(N)
    for i in 0..<N{
        y[i] = Double(yy[i])
    }
    return y
}
