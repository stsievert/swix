//
//  conversion.swift
//  swix
//
//  Created by Scott Sievert on 7/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

func matrixToPointer(x: matrix)->UnsafePointer<Double>{
    // sustains since objc rewrites raw memory!
    return UnsafePointer<Double>(x.grid)
}
