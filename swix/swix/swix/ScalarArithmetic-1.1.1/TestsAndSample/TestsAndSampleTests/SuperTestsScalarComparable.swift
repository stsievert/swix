//
//  TestsScalarComparable.swift
//  TestsAndSample
//
//  Created by Seivan Heidari on 29/06/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import XCTest
import CoreGraphics

protocol ScalarComparableTesting {
  func testEqual()
  func testNotEqual()
  func testLessThanOrEqual()
  func testLessThan()
  func testGreaterThanOrEqual()
  func testGreaterThan()
}
  
class SuperTestsScalarComparable: XCTestCase {
  var cgFloatValue  = CGFloat(2.0)
  var doubleValue   = Double(2.0)
  var intValue      = 2
  let int16Value:Int16        = 2
  let int32Value:Int32        = 2
  let int64Value:Int64        = 2
  let uInt16Value:UInt16        = 2
  let uInt32Value:UInt32        = 2
  let uInt64Value:UInt64        = 2

}
