//
//  numbers.swift
//  swix
//
//  Created by Scott Sievert on 6/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate

// use 3.double or 3.14.int or N.int
extension Int{
    var double:Double {return Double(self)}
    var float:Float {return Float(self)}
}
extension Double{
    var int:Int {return Int(self)}
    var float:Float {return Float(self)}
}
extension Float{
    var double:Double {return Double(self)}
    var int:Int {return Int(self)}
}

// better complex number integration needs to be worked out.
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