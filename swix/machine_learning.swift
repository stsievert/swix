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
        self.cvsvm = cvSVM()
        self.params = ["svm_type" : "svc", "kernel_type" : "linear"]
    }
    func train(responses: matrix2d, targets: matrix){
        // convert matrix2d to NSArray
        var r2:NSArray = NSArray(array: responses)
        var t2:NSArray = NSArray(array: targets)
        self.cvsvm.train(r2, targets:t2)
    }
    func predict(response: matrix) -> Double{
        var r = NSArray(array: response) // response
        var tp = self.cvsvm.predict(r); // target_predicted
        return tp.double; // since double 'default' value
    }
}