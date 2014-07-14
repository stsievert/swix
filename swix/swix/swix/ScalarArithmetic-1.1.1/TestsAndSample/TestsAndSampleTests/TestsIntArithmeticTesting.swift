//
//  TestsIntArithmeticTesting.swift
//  TestsAndSample
//
//  Created by Seivan Heidari on 01/07/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import XCTest

class TestsIntArithmeticTesting: SuperTestsScalarArithmetic, ScalarArithmeticTesting {
  var assignmentIntValue:Int = Int(0)
  var expectedIntValue:Int?
  
  func testAddition() {
    self.expectedValue = 10.0

    
    self.assignmentValue = self.intValue + self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.intValue + self.cgFloatValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.expectedIntValue = 10
    
    self.assignmentIntValue = self.intValue + self.int16Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue + self.int32Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue + self.int64Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue + self.uInt16Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue + self.uInt32Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue + self.uInt64Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)

    
    
  }
  
  func testAdditionAssignment() {
    self.expectedValue = 6.0

    self.assignmentValue = 1
    self.assignmentValue += self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)

    self.assignmentValue = 1
    self.assignmentValue += self.cgFloatValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.expectedIntValue = 6

    self.assignmentIntValue = 1
    self.assignmentIntValue += self.int16Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)

    self.assignmentIntValue = 1
    self.assignmentIntValue += self.int32Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = 1
    self.assignmentIntValue += self.int64Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = 1
    self.assignmentIntValue += self.uInt16Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = 1
    self.assignmentIntValue += self.uInt32Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = 1
    self.assignmentIntValue += self.uInt64Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)




  }
  
  func testSubtraction() {
    self.expectedValue = 0.0
    
    self.assignmentValue = self.intValue - self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)

    self.assignmentValue = self.intValue - self.cgFloatValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.expectedIntValue = 0
    
    self.assignmentIntValue = self.intValue - self.int16Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue - self.int32Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue - self.int64Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue - self.uInt16Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue - self.uInt32Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue - self.uInt64Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)

    
  }
  
  func testSubtractionAssignment() {
    self.expectedValue = -4.0

    self.assignmentValue = 1.0
    self.assignmentValue -= self.intValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.expectedIntValue = -4
    
    self.assignmentIntValue = 1
    self.assignmentIntValue -= self.int16Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = 1
    self.assignmentIntValue -= self.int32Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = 1
    self.assignmentIntValue -= self.int64Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = 1
    self.assignmentIntValue -= self.uInt16Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = 1
    self.assignmentIntValue -= self.uInt32Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = 1
    self.assignmentIntValue -= self.uInt64Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)


    
    
  }
  
  func testMultiplication() {
    self.expectedValue = 25.0
    
    self.assignmentValue = self.intValue * self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.intValue * self.cgFloatValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.expectedIntValue = 25
    self.assignmentIntValue = self.intValue * self.int16Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue * self.int32Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue * self.int64Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue * self.uInt16Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue * self.uInt32Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue * self.uInt64Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)

    
    
    
  }
  
  func testMultiplicationAssignment() {
    self.expectedValue   = 10.0

    self.assignmentValue = 2.0
    self.assignmentValue *= self.intValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.expectedIntValue = 10
    
    self.assignmentIntValue = 2
    self.assignmentIntValue *= self.int16Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = 2
    self.assignmentIntValue *= self.int32Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = 2
    self.assignmentIntValue *= self.int64Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = 2
    self.assignmentIntValue *= self.uInt16Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = 2
    self.assignmentIntValue *= self.uInt32Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = 2
    self.assignmentIntValue *= self.uInt64Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    
  }
  func testDivision() {
    self.expectedValue = 1.0
    
    self.assignmentValue = self.intValue / self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.intValue / self.cgFloatValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.expectedIntValue = 1
    self.assignmentIntValue = self.intValue / self.int16Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue / self.int32Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue / self.int64Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue / self.uInt16Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue / self.uInt32Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue / self.uInt64Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
  }
  
  func testDivisionAssignment() {
    self.expectedValue = 2.0

    self.assignmentValue = 10.0
    self.assignmentValue /= self.intValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.expectedIntValue = 2
    
    self.assignmentIntValue = 10
    self.assignmentIntValue /= self.int16Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = 10
    self.assignmentIntValue /= self.int32Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = 10
    self.assignmentIntValue /= self.int64Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = 10
    self.assignmentIntValue /= self.uInt16Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = 10
    self.assignmentIntValue /= self.uInt32Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    self.assignmentIntValue = 10
    self.assignmentIntValue /= self.uInt64Value
    XCTAssertEqual(self.assignmentValue, self.expectedIntValue!)
    
    
  }


}
