//
//  TestsIntComparable.swift
//  TestsAndSample
//
//  Created by Seivan Heidari on 01/07/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import XCTest

class TestsIntComparable: SuperTestsScalarComparable, ScalarComparableTesting {

  func testEqual() {
    XCTAssert(self.intValue == self.doubleValue);
    XCTAssert(self.intValue == self.cgFloatValue);
    XCTAssert(self.intValue == self.int16Value);
    XCTAssert(self.intValue == self.int32Value);
    XCTAssert(self.intValue == self.int64Value);
    XCTAssert(self.intValue == self.uInt16Value);
    XCTAssert(self.intValue == self.uInt16Value);
    XCTAssert(self.intValue == self.uInt16Value);

    
  }
  func testNotEqual() {
    XCTAssertFalse(self.intValue != self.doubleValue);
    XCTAssertFalse(self.intValue != self.cgFloatValue);
    XCTAssertFalse(self.intValue != self.int16Value);
    XCTAssertFalse(self.intValue != self.int32Value);
    XCTAssertFalse(self.intValue != self.int64Value);
    XCTAssertFalse(self.intValue != self.uInt16Value);
    XCTAssertFalse(self.intValue != self.uInt16Value);
    XCTAssertFalse(self.intValue != self.uInt16Value);

    
  }
  func testLessThanOrEqual() {
    XCTAssert(self.intValue <= self.doubleValue);
    XCTAssert(self.intValue <= self.cgFloatValue);
    XCTAssert(self.intValue <= self.int16Value);
    XCTAssert(self.intValue <= self.int32Value);
    XCTAssert(self.intValue <= self.int64Value);
    XCTAssert(self.intValue <= self.uInt16Value);
    XCTAssert(self.intValue <= self.uInt16Value);
    XCTAssert(self.intValue <= self.uInt16Value);

    
    self.intValue = -1
    XCTAssert(self.intValue <= self.doubleValue);
    XCTAssert(self.intValue <= self.cgFloatValue);
    XCTAssert(self.intValue <= self.int16Value);
    XCTAssert(self.intValue <= self.int32Value);
    XCTAssert(self.intValue <= self.int64Value);
    XCTAssert(self.intValue <= self.uInt16Value);
    XCTAssert(self.intValue <= self.uInt16Value);
    XCTAssert(self.intValue <= self.uInt16Value);

    
    
  }
  func testLessThan() {
    self.intValue = -1
    XCTAssert(self.intValue < self.doubleValue);
    XCTAssert(self.intValue < self.cgFloatValue);
    XCTAssert(self.intValue < self.int16Value);
    XCTAssert(self.intValue < self.int32Value);
    XCTAssert(self.intValue < self.int64Value);
    XCTAssert(self.intValue < self.uInt16Value);
    XCTAssert(self.intValue < self.uInt16Value);
    XCTAssert(self.intValue < self.uInt16Value);

    
  }
  
  func testGreaterThanOrEqual() {
    
    XCTAssert(self.intValue >= self.doubleValue);
    XCTAssert(self.intValue >= self.cgFloatValue);
    XCTAssert(self.intValue >= self.int16Value);
    XCTAssert(self.intValue >= self.int32Value);
    XCTAssert(self.intValue >= self.int64Value);
    XCTAssert(self.intValue >= self.uInt16Value);
    XCTAssert(self.intValue >= self.uInt16Value);
    XCTAssert(self.intValue >= self.uInt16Value);

    
    self.intValue = -1
    XCTAssertFalse(self.intValue >= self.doubleValue);
    XCTAssertFalse(self.intValue >= self.cgFloatValue);
    XCTAssertFalse(self.intValue >= self.int16Value);
    XCTAssertFalse(self.intValue >= self.int32Value);
    XCTAssertFalse(self.intValue >= self.int64Value);
    XCTAssertFalse(self.intValue >= self.uInt16Value);
    XCTAssertFalse(self.intValue >= self.uInt16Value);
    XCTAssertFalse(self.intValue >= self.uInt16Value);

    
  }
  
  func testGreaterThan() {
    self.intValue = -1
    XCTAssertFalse(self.intValue > self.doubleValue);
    XCTAssertFalse(self.intValue > self.cgFloatValue);
    XCTAssertFalse(self.intValue > self.int16Value);
    XCTAssertFalse(self.intValue > self.int32Value);
    XCTAssertFalse(self.intValue > self.int64Value);
    XCTAssertFalse(self.intValue > self.uInt16Value);
    XCTAssertFalse(self.intValue > self.uInt16Value);
    XCTAssertFalse(self.intValue > self.uInt16Value);

    
  }

}
