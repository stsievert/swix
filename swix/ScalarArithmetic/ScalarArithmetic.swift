
import Darwin
import CoreGraphics
import Foundation

protocol ScalarFunctions {
  var acos:Double  {get}
  var asin:Double  {get}
  var atan:Double  {get}
  func atan2(x:Double) -> Double
  var cos:Double   {get}
  var sin:Double   {get}
  var tan:Double   {get}
  var exp:Double   {get}
  var exp2:Double  {get}
  var log:Double   {get}
  var log10:Double {get}
  var log2:Double  {get}
  func pow(exponent:Double) -> Double
  var sqrt:Double  {get}
}


extension Double : ScalarFunctions {
  var abs:Double  { return Double.abs(self)   }
  var acos:Double { return Darwin.acos(self)  }
  var asin:Double { return Darwin.asin(self)  }
  var atan:Double { return Darwin.atan(self)  }
  func atan2(x:Double) -> Double { return Darwin.atan2(self,x) }
  var cos:Double  { return Darwin.cos(self)   }
  var sin:Double  { return Darwin.sin(self)   }
  var tan:Double  { return Darwin.tan(self)   }
  var exp:Double  { return Darwin.exp(self)   }
  var exp2:Double { return Darwin.exp2(self)  }
  var log:Double  { return Darwin.log(self)   }
  var log10:Double{ return Darwin.log10(self) }
  var log2:Double { return Darwin.log2(self)  }
  func pow(exponent:Double)-> Double { return Darwin.pow(self, exponent) }
  var sqrt:Double { return Darwin.sqrt(self)  }
}

protocol ScalarArithmetic {
  var toDouble:Double { get }
  init(_ value:Double)
}

extension Int : ScalarArithmetic {
  var toDouble:Double { return Double(self) }
}


#if !(arch(x86_64) || arch(arm64))
extension CGFloat : ScalarArithmetic, ScalarFunctions {
  var toDouble:Double { return Double(self)      }
  var abs:Double      { return Double(self).abs  }
  var acos:Double     { return Double(self).acos }
  var asin:Double     { return Double(self).asin }
  var atan:Double     { return Double(self).atan }
  func atan2(x:Double) -> Double { return Double(self).atan2(x) }
  var cos:Double      { return Double(self).cos  }
  var sin:Double      { return Double(self).sin  }
  var tan:Double      { return Double(self).tan  }
  var exp:Double      { return Double(self).exp  }
  var exp2:Double     { return Double(self).exp2 }
  var log:Double      { return Double(self).log  }
  var log10:Double    { return Double(self).log10}
  var log2:Double     { return Double(self).log2 }
  func pow(exponent:Double)-> Double { return Double(self).pow(exponent) }
  var sqrt:Double     { return Double(self).sqrt }
}
  
#endif


//Equality T<===>T
//@infix func == <T:ScalarArithmetic, U:ScalarArithmetic> (lhs:T,rhs:U) -> Bool {
//  return (lhs.toDouble == rhs.toDouble)
//}
//@infix func != <T:ScalarArithmetic, U:ScalarArithmetic> (lhs:T,rhs:U) -> Bool {
//  return (lhs == rhs) == false
//}
@infix func <= <T:ScalarArithmetic, U:ScalarArithmetic> (lhs:T,rhs:U) -> Bool {
  return (lhs.toDouble <= rhs.toDouble)
}
@infix func < <T:ScalarArithmetic, U:ScalarArithmetic> (lhs:T,rhs:U) -> Bool {
  return (lhs.toDouble <  rhs.toDouble)
}
@infix func >= <T:ScalarArithmetic, U:ScalarArithmetic> (lhs:T,rhs:U) -> Bool {
  return (lhs < rhs) == false
}
@infix func >  <T:ScalarArithmetic, U:ScalarArithmetic> (lhs:T,rhs:U) -> Bool {
  return (lhs <= rhs) == false
}

//Equality Double<==>T
//@infix func == <T:ScalarArithmetic> (lhs:Double, rhs:T) -> Bool {
//  return (lhs == rhs.toDouble)
//}
//@infix func != <T:ScalarArithmetic> (lhs:Double, rhs:T) -> Bool {
//  return (lhs == rhs) == false
//}
@infix func <= <T:ScalarArithmetic> (lhs:Double, rhs:T) -> Bool {
  return (lhs <= rhs.toDouble)
}
@infix func < <T:ScalarArithmetic> (lhs:Double, rhs:T) -> Bool {
  return (lhs <  rhs.toDouble)
}
@infix func >= <T:ScalarArithmetic> (lhs:Double, rhs:T) -> Bool {
  return (lhs < rhs) == false
}
@infix func >  <T:ScalarArithmetic> (lhs:Double, rhs:T) -> Bool {
  return (lhs <= rhs) == false
}


//Equality T<==>Double
//@infix func == <T:ScalarArithmetic> (lhs:T,rhs:Double) -> Bool {
//  return (lhs.toDouble == rhs)
//}
//@infix func != <T:ScalarArithmetic> (lhs:T,rhs:Double) -> Bool {
//  return (lhs == rhs) == false
//}
@infix func <= <T:ScalarArithmetic> (lhs:T,rhs:Double) -> Bool {
  return (lhs.toDouble <= rhs)
}
@infix func < <T:ScalarArithmetic> (lhs:T,rhs:Double) -> Bool {
  return (lhs.toDouble <  rhs)
}
@infix func >= <T:ScalarArithmetic> (lhs:T,rhs:Double) -> Bool {
  return (lhs < rhs) == false
}
@infix func >  <T:ScalarArithmetic> (lhs:T,rhs:Double) -> Bool {
  return (lhs <= rhs) == false
}


//SUBTRACTION
@infix func - <T:ScalarArithmetic, U:ScalarArithmetic>(lhs: T, rhs:U) -> Double  {
  return lhs.toDouble - rhs.toDouble
}
@infix func - <T:ScalarArithmetic>(lhs:Double, rhs:T) -> Double  {
  return lhs - rhs.toDouble
}
@infix func - <T:ScalarArithmetic>(lhs:T, rhs:Double) -> Double  {
  return lhs.toDouble - rhs
}
@assignment  @infix func -= <T:ScalarArithmetic>(inout lhs:Double, rhs:T)  {
  lhs = lhs - rhs.toDouble
}

//ADDITION
@infix func + <T:ScalarArithmetic, U:ScalarArithmetic>(lhs: T, rhs:U) -> Double  {
  return lhs.toDouble + rhs.toDouble
}
@infix func + <T:ScalarArithmetic>(lhs:Double, rhs:T) -> Double  {
  return lhs + rhs.toDouble
}
@infix func + <T:ScalarArithmetic>(lhs:T, rhs:Double) -> Double  {
  return lhs.toDouble + rhs
}
@assignment  @infix func += <T:ScalarArithmetic>(inout lhs:Double, rhs:T)  {
  lhs = lhs + rhs.toDouble
}

//MULTIPLICATION
@infix func * <T:ScalarArithmetic, U:ScalarArithmetic>(lhs: T, rhs:U) -> Double  {
  return lhs.toDouble * rhs.toDouble
}
@infix func * <T:ScalarArithmetic>(lhs:Double, rhs:T) -> Double  {
  return lhs * rhs.toDouble
}
@infix func * <T:ScalarArithmetic>(lhs:T, rhs:Double) -> Double  {
  return lhs.toDouble * rhs
}
@assignment @infix func *= <T:ScalarArithmetic>(inout lhs:Double, rhs:T)  {
  lhs = lhs * rhs.toDouble
}

//DIVISION
@infix func / <T:ScalarArithmetic, U:ScalarArithmetic>(lhs: T, rhs:U) -> Double  {
  return lhs.toDouble / rhs.toDouble
}
@infix func / <T:ScalarArithmetic>(lhs: Double, rhs:T) -> Double  {
  return lhs / rhs.toDouble
}
@infix func / <T:ScalarArithmetic>(lhs: T, rhs:Double) -> Double  {
  return lhs.toDouble / rhs
}
@assignment @infix func /= <T:ScalarArithmetic>(inout lhs:Double, rhs:T)  {
  lhs = lhs / rhs.toDouble
}


#if !(arch(x86_64) || arch(arm64))
extension CGPoint {
  init(x:Double, y:Double) {
    self.init(x:CGFloat(x), y:CGFloat(y))
  }
}


extension CGSize {
  init(width:Double, height:Double) {
    self.init(width:CGFloat(width), height:CGFloat(height))
  }
}

extension CGVector   {
  init(_ dx:Double, _ dy:Double) {
    self.dx = CGFloat(dx)
    self.dy = CGFloat(dy)
  }
}
#endif
