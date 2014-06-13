//
//  constants.swift
//  swix
//
//  Created by Scott Sievert on 6/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate

typealias matrix   = Array<Double>
typealias matrix2d = Array<Array<Double>>

// add extension here -- indexing, x[0..4] = 1 etc
extension Array{
    func flat() -> matrix{
        // ran into issues here. tried `let N = self[0].shape` which works for 2D arrays but compiler fail
        return ones(4)
    }
}

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

let pi = 3.14159265358979323846264338327950288419716939937510582
let e  = 2.71828182845904523536028747135266249775724709369995
let phi = 1.6180339887498948482

