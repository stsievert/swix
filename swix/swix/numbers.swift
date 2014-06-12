//
//  numbers.swift
//  swix
//
//  Created by Scott Sievert on 6/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate

// j1 since 1j is complex
let j1 = DSPComplex(real: 0, imag: 1)

class number{
    // I need to do some more thinking over complex numbers. First thought is to return two different arrays, but that seems messy. Ideally, Swift would natively support complex numbers (but alas)
    var real: Double
    var imag: Double
    init(n: Double, j: Double){
        // j: because 1j means complex
        // n: because n kinda means real number
        self.real = n
        self.imag = j
    }
}