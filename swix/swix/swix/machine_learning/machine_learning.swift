//
//  svm.swift
//  swix
//
//  Created by Scott Sievert on 7/16/14.
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
        
        // not implemented yet -- careful! the defaults are shown
        self.params = ["svm_type" : "svc", "kernel_type" : "linear"]
        
        self.N = -1
        self.M = -1
    }
    func train(responses: matrix, targets: ndarray){
        // convert matrix2d to NSArray
        self.M = responses.shape.0
        self.N = responses.shape.1
        self.cvsvm.train(!responses, targets:!targets, m:self.M.cint, n:self.N.cint)
    }
    func predict(response: ndarray) -> Double{
        assert(self.N == response.count, "Sizes of input arguments do not match: predict.count != trained.count. The varianbles you're trying to predict a result from must match variables you trained off of.")
        var tp = self.cvsvm.predict(!response, n:self.N.cint)
        return tp.double
    }
}
class kNearestNeighbors{
    // finds the nearest neighbor over all points. if want to change, dive into knn.mm and change `int k = cvknn.get_max_k();` in `predict(...)`
    var T:Double
    var knn:kNN;
    var N:Int; // variables
    var M:Int; // responses
    init(){
        assert(false, "Careful! My simple tests failed but it looks like it should work.")
        self.T = 1
        self.knn = kNN()
        self.N = -1
        self.M = -1
    }
    func train(responses: matrix, targets: ndarray){
        self.M = responses.shape.0
        self.N = responses.shape.1
        
        self.knn.train(!responses, targets: !targets, m:self.M.cint, n:self.N.cint)
        
    }
    func predict(x: ndarray, k: Int) -> Double{
        assert(self.N == x.count, "Sizes of input arguments do not match: predict.count != trained.count. The varianbles you're trying to predict a result from must match variables you trained off of.")
        assert(k <= 32, "k <= 32 for performance reasons enforced by OpenCV.")
        var result = self.knn.predict(!x, n:x.n.cint, k:k.cint)
        return result.double;
    }
}

