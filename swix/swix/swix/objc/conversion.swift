//
//  conversion.swift
//  swix
//
//  Created by Scott Sievert on 7/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

func matrixToPointer(x: matrix)->UnsafePointer<Double>{
    return UnsafePointer<Double>(x.grid)
}
func pointerToMatrix(xP: UnsafePointer<Double>, N:Int)->matrix{
    var x = zeros(N)
    for i in 0..<N{
        x[i] = xP[i]
    }
    return x
}