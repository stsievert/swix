//
//  main.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//


import Foundation

runTests()
//SpeedTests()

var train = rand((4,6))
println(train)
var targets = array(1, 2, 3, 4)
var predict = rand((6,6))
var svm = SVM()
svm.train(train, targets)
var results = svm.predict(predict)
println(results)


