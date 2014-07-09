

#if !(arch(x86_64) || arch(arm64))
  import CoreGraphics

  extension Int {
    @conversion func __conversion() -> CGFloat {
      return CGFloat(self)
    }
  }

  extension CGFloat {
  @conversion func __conversion() -> Double {
    return Double(self)
    }
  }


  extension Int16 {
  @conversion func __conversion() -> CGFloat {
  return CGFloat(self)
  }
  
  }
  
  extension Int32 {
  
  @conversion func __conversion() -> CGFloat {
  return CGFloat(self)
  }
  
  }
  
  extension Int64 {
  
  @conversion func __conversion() -> CGFloat {
  return CGFloat(self)
  }
  
  }
  
  
  extension UInt16 {
  @conversion func __conversion() -> CGFloat {
  return CGFloat(self)
  }
  
  }
  
  extension UInt32 {
  
  @conversion func __conversion() -> CGFloat {
  return CGFloat(self)
  }
  
  }
  
  extension UInt64 {
  
  @conversion func __conversion() -> CGFloat {
  return CGFloat(self)
  }
  
  }


#endif

extension Int {
  @conversion func __conversion() -> Double {
    return Double(self)
  }
}

extension Int16 {
  @conversion func __conversion() -> Int {
    return Int(self)
  }
  @conversion func __conversion() -> Double {
    return Double(self)
  }
  
}

extension Int32 {
  @conversion func __conversion() -> Int {
    return Int(self)
  }
  
  @conversion func __conversion() -> Double {
    return Double(self)
  }
  
}

extension Int64 {
  @conversion func __conversion() -> Int {
    return Int(self)
  }
  
  @conversion func __conversion() -> Double {
    return Double(self)
  }
  
}


extension UInt16 {
  @conversion func __conversion() -> Int {
    return Int(self)
  }
  @conversion func __conversion() -> Double {
    return Double(self)
  }
  
}

extension UInt32 {
  @conversion func __conversion() -> Int {
    return Int(self)
  }
  
  @conversion func __conversion() -> Double {
    return Double(self)
  }
  
}

extension UInt64 {
  @conversion func __conversion() -> Int {
    return Int(self)
  }
  
  @conversion func __conversion() -> Double {
    return Double(self)
  }
  
}

