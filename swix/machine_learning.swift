//
//  machine_learning.swift
//  swix
//
//  Created by Scott Sievert on 6/30/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

class SVM {
    // swift --> objc --> objc++ --> c++
    var cvsvm:cvSVM;
    var params:Dictionary<String, String>
    var N:Int
    var M:Int
    init(){
        self.cvsvm = cvSVM()
        
        // not implemented yet -- careful!
        self.params = ["svm_type" : "svc", "kernel_type" : "linear"]
        self.N = -1
        self.M = -1
    }
    func train(responses: matrix2d, targets: matrix){
        // convert matrix2d to NSArray
        self.M = targets.count
        self.N = responses[0].count
        var r2:NSArray = NSArray(array: responses)
        var t2:NSArray = NSArray(array: targets)
        self.cvsvm.train(r2, targets:t2)
    }
    func predict(response: matrix) -> Double{
        assert(self.N == response.count, "Sizes of input arguments do not match: predict.count != trained.count. The varianbles you're trying to predict a result from must match variables you trained off of.")
        var r = NSArray(array: response) // response
        var tp = self.cvsvm.predict(r); // target_predicted
        return tp.double; // since double 'default' value
    }
}

class kNearestNeighbors{
    var T:Double
    var knn:kNN;
    init(){
        self.T = 1
        self.knn = kNN()
        println(self.knn.predict())
    }
}