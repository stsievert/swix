//
//  machine_learning.swift
//  swix
//
//  Created by Scott Sievert on 6/30/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

class SVM{
    var cvsvm:cvSVM;
    var params:Dictionary<String, String>
    init(){
        println("In SVM.init()")
        self.cvsvm = cvSVM()
        self.params = ["svm_type" : "svc", "kernel_type" : "linear"]
    }
    func train(responses: matrix2d, targets: matrix){
        // convert matrix2d to NSArray
        var r = arange(4*6)
        var shape = (Int(4), Int(6))
        var r1_5 = reshape(r, shape)
        println(r1_5)
        var r2:NSArray = NSArray(array: r1_5)
        
        var t = arange(4)
        println(t)
        var t2:NSArray = NSArray(array: t)
        
        self.cvsvm.train(r2, targets:t2)
        
        // call self.cvsvm.train()
        // convert NSArray to matrix2d
    }
    func predict(){
        
    }
    
}