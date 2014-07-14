//
//  TestsDoubleComparable.swift
//  TestsAndSample
//
//  Created by Seivan Heidari on 01/07/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import XCTest

class TestsDoubleComparable: SuperTestsScalarComparable, ScalarComparableTesting {

  func testEqual() {
    XCTAssert(self.doubleValue == self.intValue);
    XCTAssert(self.doubleValue == self.cgFloatValue);
    XCTAssert(self.doubleValue == self.int16Value);
    XCTAssert(self.doubleValue == self.int32Value);
    XCTAssert(self.doubleValue == self.int64Value);
    XCTAssert(self.doubleValue == self.uInt16Value);
    XCTAssert(self.doubleValue == self.uInt16Value);
    XCTAssert(self.doubleValue == self.uInt16Value);
    
    
  }
  func testNotEqual() {
    XCTAssertFalse(self.doubleValue != self.intValue);
    XCTAssertFalse(self.doubleValue != self.cgFloatValue);
    XCTAssertFalse(self.doubleValue != self.int16Value);
    XCTAssertFalse(self.doubleValue != self.int32Value);
    XCTAssertFalse(self.doubleValue != self.int64Value);
    XCTAssertFalse(self.doubleValue != self.uInt16Value);
    XCTAssertFalse(self.doubleValue != self.uInt16Value);
    XCTAssertFalse(self.doubleValue != self.uInt16Value);

    
  }
  func testLessThanOrEqual() {
    XCTAssert(self.doubleValue <= self.intValue);
    XCTAssert(self.doubleValue <= self.cgFloatValue);
    XCTAssert(self.doubleValue <= self.int16Value);
    XCTAssert(self.doubleValue <= self.int32Value);
    XCTAssert(self.doubleValue <= self.int64Value);
    XCTAssert(self.doubleValue <= self.uInt16Value);
    XCTAssert(self.doubleValue <= self.uInt16Value);
    XCTAssert(self.doubleValue <= self.uInt16Value);

    self.doubleValue = -1
    XCTAssert(self.doubleValue <= self.intValue);
    XCTAssert(self.doubleValue <= self.cgFloatValue);
    XCTAssert(self.doubleValue <= self.int16Value);
    XCTAssert(self.doubleValue <= self.int32Value);
    XCTAssert(self.doubleValue <= self.int64Value);
    XCTAssert(self.doubleValue <= self.uInt16Value);
    XCTAssert(self.doubleValue <= self.uInt16Value);
    XCTAssert(self.doubleValue <= self.uInt16Value);
    
    
    
  }
  func testLessThan() {
    self.doubleValue = -1
    XCTAssert(self.doubleValue < self.intValue);
    XCTAssert(self.doubleValue < self.cgFloatValue);
    XCTAssert(self.doubleValue < self.int16Value);
    XCTAssert(self.doubleValue < self.int32Value);
    XCTAssert(self.doubleValue < self.int64Value);
    XCTAssert(self.doubleValue < self.uInt16Value);
    XCTAssert(self.doubleValue < self.uInt16Value);
    XCTAssert(self.doubleValue < self.uInt16Value);

    
  }
  
  func testGreaterThanOrEqual() {
    
    XCTAssert(self.doubleValue >= self.intValue);
    XCTAssert(self.doubleValue >= self.cgFloatValue);
    XCTAssert(self.doubleValue >= self.int16Value);
    XCTAssert(self.doubleValue >= self.int32Value);
    XCTAssert(self.doubleValue >= self.int64Value);
    XCTAssert(self.doubleValue >= self.uInt16Value);
    XCTAssert(self.doubleValue >= self.uInt16Value);
    XCTAssert(self.doubleValue >= self.uInt16Value);

    
    self.doubleValue = -1
    XCTAssertFalse(self.doubleValue >= self.intValue);
    XCTAssertFalse(self.doubleValue >= self.cgFloatValue);
    XCTAssertFalse(self.doubleValue >= self.int16Value);
    XCTAssertFalse(self.doubleValue >= self.int32Value);
    XCTAssertFalse(self.doubleValue >= self.int64Value);
    XCTAssertFalse(self.doubleValue >= self.uInt16Value);
    XCTAssertFalse(self.doubleValue >= self.uInt16Value);
    XCTAssertFalse(self.doubleValue >= self.uInt16Value);

  }
  
  func testGreaterThan() {
    
    self.doubleValue = -1
    XCTAssertFalse(self.doubleValue > self.intValue);
    XCTAssertFalse(self.doubleValue > self.cgFloatValue);
    XCTAssertFalse(self.doubleValue > self.int16Value);
    XCTAssertFalse(self.doubleValue > self.int32Value);
    XCTAssertFalse(self.doubleValue > self.int64Value);
    XCTAssertFalse(self.doubleValue > self.uInt16Value);
    XCTAssertFalse(self.doubleValue > self.uInt16Value);
    XCTAssertFalse(self.doubleValue > self.uInt16Value);

    
    
  }
}
