//
//  complex.swift
//  complex
//
//  Created by Dan Kogai on 6/12/14.
//  Copyright (c) 2014 Dan Kogai. All rights reserved.
//

import Darwin   // Foundation is overkill

extension Double {
    static var PI:Double { return atan2(0, -1) }
    static var π:Double { return PI }
    static var E:Double { return exp(1) }
    static var e:Double { return E }
    static var LN2:Double { return log(2) }
    static var LOG2E:Double { return 1/LN2 }
    static var LN10:Double { return log(10) }
    static var LOG10E:Double { return 1/LN10 }
    static var SQRT2:Double { return sqrt(2) }
    static var SQRT1_2:Double { return 1/SQRT2 }
    static var inf:Double { return 1.0/0.0 }
    var i:Complex { return Complex(0, self) }
}

struct Complex: Printable, Equatable  {
    var (re:Double, im:Double) = (0.0, 0.0)
    init(){}
    init(_ re:Double, _ im:Double) {
        self.re = re
        self.im = im
    }
    init(abs:Double, arg:Double) {
        self.re = abs * cos(arg)
        self.im = abs * sin(arg)
    }
    var description:String {
        let sign = self.im >  0.0 ? "+"
                 : self.im == 0.0 ? "+" : ""
        return "(\(self.re)\(sign)\(self.im).i)"
    }
    static var I:Complex { return Complex(0, 1) }
    var real:Double { get{ return re } set(r){ re = r } }
    var imag:Double { get{ return im } set(i){ im = i } }
    var abs:Double  {
    get { return hypot(re, im) }
    set(r){ let f = r / abs; re *= f; im *= f }
    }
    var arg:Double  {
    get { return atan2(im, re) }
    set(t){ let m = abs; re = m * cos(t); im = m * sin(t) }
    }
    var norm:Double { return re * re + im * im }
    var conj:Complex { return Complex(re, -im) }
    var proj:Complex {
        if re != Double.inf && im != Double.inf {
            return self
        } else {
            return Complex(
                Double.inf,
                im > 0.0 ? 0.0 : im == 0.0 ? 0.0 : -0.0
            )
        }
    }
    var tuple:(Double, Double) {
    get { return (re, im) }
    set(t){ (re, im) = t}
    }
    // (x + yi) * i = (-y + xi)
    var i:Complex { return Complex(-im, re) }
}
// != is auto-generated thanks to Equatable
@infix func == (lhs:Complex, rhs:Complex) -> Bool {
    return lhs.re == rhs.re && lhs.im == rhs.im
}
@infix func == (lhs:Complex, rhs:Double) -> Bool {
    return lhs.re == rhs && lhs.im == 0
}
@infix func == (lhs:Double, rhs:Complex) -> Bool {
    return lhs == rhs.re && rhs.im == 0
}
// +, +=
@prefix func + (z:Complex) -> Complex {
    return z
}
@infix func + (lhs:Complex, rhs:Complex) -> Complex {
    return Complex(lhs.re + rhs.re, lhs.im + rhs.im)
}
@infix func + (lhs:Complex, rhs:Double) -> Complex {
    return lhs + Complex(rhs, 0)
}
@infix func + (lhs:Double, rhs:Complex) -> Complex {
    return Complex(lhs, 0) + rhs
}
@assignment func += (inout lhs:Complex, rhs:Complex) -> Complex {
    lhs.re += rhs.re ; lhs.im += rhs.im
    return lhs
}
@assignment func += (inout lhs:Complex, rhs:Double) -> Complex {
    lhs.re += rhs
    return lhs
}
// -, -=
@prefix func - (z:Complex) -> Complex {
    return Complex(-z.re, -z.im)
}
@infix func - (lhs:Complex, rhs:Complex) -> Complex {
    return Complex(lhs.re - rhs.re, lhs.im - rhs.im)
}
@infix func - (lhs:Complex, rhs:Double) -> Complex {
    return lhs - Complex(rhs, 0)
}
@infix func - (lhs:Double, rhs:Complex) -> Complex {
    return Complex(lhs, 0) - rhs
}
@assignment func -= (inout lhs:Complex, rhs:Complex) -> Complex {
    lhs.re -= rhs.re ; lhs.im -= rhs.im
    return lhs
}
@assignment func -= (inout lhs:Complex, rhs:Double) -> Complex {
    lhs.re -= rhs
    return lhs
}
// *, *=
@infix func * (lhs:Complex, rhs:Complex) -> Complex {
    return Complex(
        lhs.re * rhs.re - lhs.im * rhs.im,
        lhs.re * rhs.im + lhs.im * rhs.re
    )
}
@infix func * (lhs:Complex, rhs:Double) -> Complex {
    return Complex(lhs.re * rhs, lhs.im * rhs)
}
@infix func * (lhs:Double, rhs:Complex) -> Complex {
    return Complex(lhs * rhs.re, lhs * rhs.im)
}
@assignment func *= (inout lhs:Complex, rhs:Complex) -> Complex {
    lhs = lhs * rhs
    return lhs
}
@assignment func *= (inout lhs:Complex, rhs:Double) -> Complex {
    lhs = lhs * rhs
    return lhs
}
// /, /=
@infix func / (lhs:Complex, rhs:Complex) -> Complex {
    let d = rhs.re * rhs.re + rhs.im * rhs.im
    return Complex(
        (lhs.re * rhs.re + lhs.im * rhs.im) / d,
        (lhs.im * rhs.re - lhs.re * rhs.im) / d
    )
}
@infix func / (lhs:Complex, rhs:Double) -> Complex {
    return Complex(lhs.re / rhs, lhs.im / rhs)
}
@infix func / (lhs:Double, rhs:Complex) -> Complex {
    return Complex(lhs, 0) / rhs
}
@assignment func /= (inout lhs:Complex, rhs:Complex) -> Complex {
    lhs = lhs / rhs
    return lhs
}
@assignment func /= (inout lhs:Complex, rhs:Double) -> Complex {
    lhs = lhs / rhs
    return lhs
}
// exp(z)
func exp(z:Complex) -> Complex {
    let abs = exp(z.re)
    let arg = z.im
    return Complex(abs * cos(arg), abs * sin(arg))
}
// log(z)
func log(z:Complex) -> Complex {
    return Complex(log(z.abs), z.arg)
}
// log10(z) -- just because C++ has it
func log10(z:Complex) -> Complex { return log(z) / Double.LN10 }
func log10(r:Double) -> Double { return log(r) / Double.LN10 }
// pow(b, x)
func pow(lhs:Complex, rhs:Complex) -> Complex {
    let z = log(lhs) * rhs
    return exp(z)
}
func pow(lhs:Complex, rhs:Double) -> Complex {
    return pow(lhs, Complex(rhs, 0))
}
func pow(lhs:Double, rhs:Complex) -> Complex {
    return pow(Complex(lhs, 0), rhs)
}
// **, **=
operator infix ** { associativity right precedence 170 }
@infix func ** (lhs:Double, rhs:Double) -> Double {
    return pow(lhs, rhs)
}
@infix func ** (lhs:Complex, rhs:Complex) -> Complex {
    return pow(lhs, rhs)
}
@infix func ** (lhs:Double, rhs:Complex) -> Complex {
    return pow(lhs, rhs)
}
@infix func ** (lhs:Complex, rhs:Double) -> Complex {
    return pow(lhs, rhs)
}
operator infix **= { associativity right precedence 90 }
@assignment func **= (inout lhs:Double, rhs:Double) -> Double {
    lhs = pow(lhs, rhs)
    return lhs
}
@assignment func **= (inout lhs:Complex, rhs:Complex) -> Complex {
    lhs = pow(lhs, rhs)
    return lhs
}
@assignment func **= (inout lhs:Complex, rhs:Double) -> Complex {
    lhs = pow(lhs, rhs)
    return lhs
}
// sqrt(z)
func sqrt(z:Complex) -> Complex {
    return z ** 0.5
}
// cos(z)
func cos(z:Complex) -> Complex {
    // return (exp(i*z) + exp(-i*z)) / 2
    return (exp(z.i) + exp(-z.i)) * 0.5
}
// sin(z)
func sin(z:Complex) -> Complex {
    // return (exp(i*z) - exp(-i*z)) / (2*i)
    return (exp(z.i) - exp(-z.i)) * -0.5.i
}
// tan(z)
func tan(z:Complex) -> Complex {
    // return sin(z) / cos(z)
    let ezi = exp(z.i), e_zi = exp(-z.i)
    return (ezi - e_zi) / (ezi + e_zi).i
}
// atan(z)
func atan(z:Complex) -> Complex {
    return 0.5.i * (log(1 - z.i) - log(1 + z.i))
}
func atan(r:Double) -> Double { return atan(Complex(r, 0)).re }
// atan2(z, zz)
func atan2(z:Complex, zz:Complex) -> Complex {
    return atan(z / zz)
}
// asin(z)
func asin(z:Complex) -> Complex {
    return -1.0.i * log(z.i + sqrt(1 - z*z))
}
// acos(z)
func acos(z:Complex) -> Complex {
    return 1.0.i * log(z - sqrt(1 - z*z).i)
}
// sinh(z)
func sinh(z:Complex) -> Complex {
    return 0.5 * (exp(z) - exp(-z))
}
// cosh(z)
func cosh(z:Complex) -> Complex {
    return 0.5 * (exp(z) + exp(-z))
}
// tanh(z)
func tanh(z:Complex) -> Complex {
    let ez = exp(z), e_z = exp(-z)
    return (ez - e_z) / (ez + e_z)
}
// asinh(z)
func asinh(z:Complex) -> Complex {
    return log(z + sqrt(z*z + 1))
}
// acosh(z)
func acosh(z:Complex) -> Complex {
    return log(z + sqrt(z*z - 1))
}
// atanh(z)
func atanh(z:Complex) -> Complex {
    return 0.5 * log((1 + z)/(1 - z))
}
// for the compatibility's sake w/ C++11
func abs(z:Complex) -> Double { return z.abs }
func arg(z:Complex) -> Double { return z.arg }
func real(z:Complex) -> Double { return z.real }
func imag(z:Complex) -> Double { return z.imag }
func norm(z:Complex) -> Double { return z.norm }
func conj(z:Complex) -> Complex { return z.conj }
func proj(z:Complex) -> Complex { return z.proj }
