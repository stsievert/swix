//
//  TestsCGFloatArithmeticTesting.swift
//  TestsAndSample
//
//  Created by Seivan Heidari on 01/07/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import XCTest

class TestsCGFloatArithmeticTesting: SuperTestsScalarArithmetic, ScalarArithmeticTesting {
  func testAddition() {
    self.expectedValue = 10.0
    
    self.assignmentValue = self.cgFloatValue + self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue + self.intValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue + self.int16Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue + self.int32Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue + self.int64Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue + self.uInt16Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue + self.uInt32Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue + self.uInt64Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
  }
  
  func testAdditionAssignment() {
    self.expectedValue = 6.0

    self.assignmentValue = 1.0
    self.assignmentValue += self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)

    self.assignmentValue = 1.0
    self.assignmentValue += self.intValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 1.0
    self.assignmentValue += self.int16Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 1.0
    self.assignmentValue += self.int32Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 1.0
    self.assignmentValue += self.int64Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 1.0
    self.assignmentValue += self.uInt16Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 1.0
    self.assignmentValue += self.uInt32Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 1.0
    self.assignmentValue += self.uInt64Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
  }
  
  func testSubtraction() {
    self.expectedValue = 0.0
    
    self.assignmentValue = self.cgFloatValue - self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue - self.intValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue - self.int16Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue - self.int32Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue - self.int64Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue - self.uInt16Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue - self.uInt32Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue - self.uInt64Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
  }

  
  func testSubtractionAssignment() {
    self.expectedValue = -4.0

    self.assignmentValue = 1.0
    self.assignmentValue -= self.cgFloatValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    

    self.assignmentValue = 1.0
    self.assignmentValue -= self.int16Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 1.0
    self.assignmentValue -= self.int32Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 1.0
    self.assignmentValue -= self.int64Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 1.0
    self.assignmentValue -= self.uInt16Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 1.0
    self.assignmentValue -= self.uInt32Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 1.0
    self.assignmentValue -= self.uInt64Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)

    
    
  }
  
  func testMultiplication() {
    self.expectedValue = 25.0
    
    self.assignmentValue = self.cgFloatValue * self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue * self.intValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue * self.int16Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue * self.int32Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue * self.int64Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue * self.uInt16Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue * self.uInt32Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue * self.uInt64Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
  }
  
  func testMultiplicationAssignment() {
    self.expectedValue   = 10.0

    self.assignmentValue = 2.0
    self.assignmentValue *= self.cgFloatValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    
    self.assignmentValue = 2.0
    self.assignmentValue *= self.int16Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 2.0
    self.assignmentValue *= self.int32Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 2.0
    self.assignmentValue *= self.int64Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 2.0
    self.assignmentValue *= self.uInt16Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 2.0
    self.assignmentValue *= self.uInt32Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 2.0
    self.assignmentValue *= self.uInt64Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    
  }
  func testDivision() {
    self.expectedValue = 1.0
    
    self.assignmentValue = self.cgFloatValue / self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue / self.intValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue / self.int16Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue / self.int32Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue / self.int64Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue / self.uInt16Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue / self.uInt32Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue / self.uInt64Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
  }
  
  func testDivisionAssignment() {
    self.expectedValue = 2.0

    self.assignmentValue = 10.0
    self.assignmentValue /= self.cgFloatValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 10.0
    self.assignmentValue /= self.int16Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 10.0
    self.assignmentValue /= self.int32Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 10.0
    self.assignmentValue /= self.int64Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 10.0
    self.assignmentValue /= self.uInt16Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 10.0
    self.assignmentValue /= self.uInt32Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 10.0
    self.assignmentValue /= self.uInt64Value
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    
  }

}
