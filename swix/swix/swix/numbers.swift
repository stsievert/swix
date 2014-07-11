//
//  constants.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

let pi = 3.1415926535897932384626433832795028841971693993751058
let π = pi
let phi = (1 + sqrt(5.double))/2
let φ = phi
let e = exp(1.double)
let euler = 0.57721566490153286060651209008240243104215933593992
let inf = 1.0 / 0.0
let DOUBLE_EPSILON = DBL_EPSILON // smallest possible difference
let FLOAT_EPSILON = FLT_EPSILON

// use 3.double or 3.14.int or N.int
extension Int{
    var int:Int {return Int(self)}
    var float:Float {return Float(self)}
    var double:Double {return Double(self)}
}
extension Double{
    var int:Int {return Int(self)}
    var float:Float {return Float(self)}
    var double:Double {return Double(self)}
}
extension Float{
    var int:Int {return Int(self)}
    var float:Float {return Float(self)}
    var double:Double {return Double(self)}

}
extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
    var doubleValue: Double {
        return (self as NSString).doubleValue
    }
}