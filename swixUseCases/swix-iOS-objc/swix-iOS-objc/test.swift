//
//  test.swift
//  swix-iOS-objc
//
//  Created by Scott Sievert on 7/12/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

@objc class test : NSObject{
    func testFunc(){
        var x = ones((4,4))
        var y = ones((4,4)) * 2
        var z = x *! y
        println(z)
    }
}