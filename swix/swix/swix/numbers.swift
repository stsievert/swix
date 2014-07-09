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
let phi = (1 + sqrt(5).double)/2
let φ = phi
let e = 2.7182818284590452353602874713526624977572470936999595
let euler = 0.57721566490153286060651209008240243104215933593992
let inf = 1.0 / 0.0
let DBL_EPS = DBL_EPSILON
let FLT_EPS = FLT_EPSILON

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