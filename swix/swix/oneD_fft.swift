//
//  oneD_fft.swift
//  swix
//
//  Created by Scott Sievert on 6/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate



func fft(x: matrix) -> matrix{
    let N = x.count
    var arg1 = NSArray(array: x)
    var yy = fft_objc(arg1)
    var y = convertDoubleToMatrix(yy, N)
    println(y)
    return x
}

