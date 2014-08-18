//
//  main.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//


import Foundation
import Swift


runTests()
//SpeedTests()


var x = array(1, 2, 3)
func cumtrapz(x:ndarray)->ndarray{
    var y = zeros_like(x)
    var dx:CDouble = 1.0
    vDSP_vtrapzD(!x, 1.cint, &dx, !y, 1.cint, vDSP_Length(x.n))
    return y
}
//func trapz(x:ndarray)->Double{
//    return cumtrapz(x)
//}
