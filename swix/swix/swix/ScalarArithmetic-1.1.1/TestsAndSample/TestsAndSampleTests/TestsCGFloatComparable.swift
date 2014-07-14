//
//  TestsCGFloatComparable.swift
//  TestsAndSample
//
//  Created by Seivan Heidari on 01/07/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import XCTest

class TestsCGFloatComparable: SuperTestsScalarComparable, ScalarComparableTesting {

  func testEqual() {
    XCTAssert(self.cgFloatValue == self.doubleValue);
    XCTAssert(self.cgFloatValue == self.intValue);
    XCTAssert(self.cgFloatValue == self.int16Value);
    XCTAssert(self.cgFloatValue == self.int32Value);
    XCTAssert(self.cgFloatValue == self.int64Value);
    XCTAssert(self.cgFloatValue == self.uInt16Value);
    XCTAssert(self.cgFloatValue == self.uInt16Value);
    XCTAssert(self.cgFloatValue == self.uInt16Value);
  }
  
  func testNotEqual() {
    XCTAssertFalse(self.cgFloatValue != self.doubleValue);
    XCTAssertFalse(self.cgFloatValue != self.intValue);
    XCTAssertFalse(self.cgFloatValue != self.int16Value);
    XCTAssertFalse(self.cgFloatValue != self.int32Value);
    XCTAssertFalse(self.cgFloatValue != self.int64Value);
    XCTAssertFalse(self.cgFloatValue != self.uInt16Value);
    XCTAssertFalse(self.cgFloatValue != self.uInt16Value);
    XCTAssertFalse(self.cgFloatValue != self.uInt16Value);

    
  }
  func testLessThanOrEqual() {
    XCTAssert(self.cgFloatValue <= self.doubleValue);
    XCTAssert(self.cgFloatValue <= self.intValue);
    XCTAssert(self.cgFloatValue <= self.int16Value);
    XCTAssert(self.cgFloatValue <= self.int32Value);
    XCTAssert(self.cgFloatValue <= self.int64Value);
    XCTAssert(self.cgFloatValue <= self.uInt16Value);
    XCTAssert(self.cgFloatValue <= self.uInt16Value);
    XCTAssert(self.cgFloatValue <= self.uInt16Value);
    
    self.cgFloatValue = -1
    XCTAssert(self.cgFloatValue <= self.doubleValue);
    XCTAssert(self.cgFloatValue <= self.intValue);
    XCTAssert(self.cgFloatValue <= self.int16Value);
    XCTAssert(self.cgFloatValue <= self.int32Value);
    XCTAssert(self.cgFloatValue <= self.int64Value);
    XCTAssert(self.cgFloatValue <= self.uInt16Value);
    XCTAssert(self.cgFloatValue <= self.uInt16Value);
    XCTAssert(self.cgFloatValue <= self.uInt16Value);

    
    
  }
  func testLessThan() {
    self.cgFloatValue = -1
    XCTAssert(self.cgFloatValue < self.doubleValue);
    XCTAssert(self.cgFloatValue < self.intValue);
    XCTAssert(self.cgFloatValue < self.int16Value);
    XCTAssert(self.cgFloatValue < self.int32Value);
    XCTAssert(self.cgFloatValue < self.int64Value);
    XCTAssert(self.cgFloatValue < self.uInt16Value);
    XCTAssert(self.cgFloatValue < self.uInt16Value);
    XCTAssert(self.cgFloatValue < self.uInt16Value);

    
  }
  
  func testGreaterThanOrEqual() {
    
    XCTAssert(self.cgFloatValue >= self.doubleValue);
    XCTAssert(self.cgFloatValue >= self.intValue);
    XCTAssert(self.cgFloatValue >= self.int16Value);
    XCTAssert(self.cgFloatValue >= self.int32Value);
    XCTAssert(self.cgFloatValue >= self.int64Value);
    XCTAssert(self.cgFloatValue >= self.uInt16Value);
    XCTAssert(self.cgFloatValue >= self.uInt16Value);
    XCTAssert(self.cgFloatValue >= self.uInt16Value);

    
    self.cgFloatValue = -1
    XCTAssertFalse(self.cgFloatValue >= self.doubleValue);
    XCTAssertFalse(self.cgFloatValue >= self.intValue);
    XCTAssertFalse(self.cgFloatValue >= self.int16Value);
    XCTAssertFalse(self.cgFloatValue >= self.int32Value);
    XCTAssertFalse(self.cgFloatValue >= self.int64Value);
    XCTAssertFalse(self.cgFloatValue >= self.uInt16Value);
    XCTAssertFalse(self.cgFloatValue >= self.uInt16Value);
    XCTAssertFalse(self.cgFloatValue >= self.uInt16Value);

    
    
  }
  
  func testGreaterThan() {
    self.cgFloatValue = -1
    XCTAssertFalse(self.cgFloatValue > self.doubleValue);
    XCTAssertFalse(self.cgFloatValue >  self.intValue);
    XCTAssertFalse(self.cgFloatValue > self.int16Value);
    XCTAssertFalse(self.cgFloatValue > self.int32Value);
    XCTAssertFalse(self.cgFloatValue > self.int64Value);
    XCTAssertFalse(self.cgFloatValue > self.uInt16Value);
    XCTAssertFalse(self.cgFloatValue > self.uInt16Value);
    XCTAssertFalse(self.cgFloatValue > self.uInt16Value);

    
    
  }

}
