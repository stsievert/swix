//
//  oneD_math.swift
//  swix
//
//  Created by Scott Sievert on 6/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//


import Foundation
import Accelerate

func apply_function(function: Double->Double, x: ndarray) -> ndarray{
    // apply a function to every element.
    
    // I've tried the below, but it doesn't apply the function to every element (at least in Xcode6b4)
    //var function:Double->Double = sin
    //var x = arange(N)*pi / N
    //var y = zeros(x.count)
    //dispatch_apply(UInt(N), dispatch_get_global_queue(0,0), {(i)->() in
    //    y[Int(i)] = function(x[Int(i)])
    //    })

    var y = zeros(x.count)
    for i in 0..<x.count{
        y[i] = function(x[i])
    }
    return y
}
func apply_function(function: String, x: ndarray)->ndarray{
    // apply select optimized functions
    var y = zeros_like(x)
    var n = x.n.length
    if function=="abs"{
        vDSP_vabsD(!x, 1, !y, 1, n);}
    else if function=="sign"{
        var o = CDouble(0)
        var l = CDouble(1)
        vDSP_vlimD(!x, 1.stride, &o, &l, !y, 1.stride, n)
    }
    else if function=="cumsum"{
        var scalar:CDouble = 1
        vDSP_vrsumD(!x, 1.stride, &scalar, !y, 1.stride, n)
    }
    else if function=="floor"{
        var z = zeros_like(x)
        vDSP_vfracD(!x, 1.stride, !z, 1.stride, x.n.length)
        y = x - z
    }
    else if function=="log10"{
        assert(min(x) > 0, "log must be called with positive values")
        var value:CDouble = 1 // divide by 1
        var f = 1 // choose power
        vDSP_vdbconD(!x, 1.stride, &value, !y, 1.stride, x.n.length, UInt32(f))
        y /= 20 // since y in power decibels
    }
    else if function=="cos"{
        var count:Int32 = Int32(x.n)
        vvcos(!y, !x, &count)
    }
    else if function=="sin"{
        var count:Int32 = Int32(x.n)
        vvsin(!y, !x, &count)
    }
    else if function=="tan"{
        var count:Int32 = Int32(x.n)
        vvtan(!y, !x, &count)
    }
    else {assert(false, "Function not recongized")}
    return y
}
// OPTIMIZED FUNCTIONS
func min(x: ndarray) -> Double{
    // finds the min
    return x.min()}
func max(x: ndarray) -> Double{
    // finds the max
    return x.max()}
func max(x: ndarray, y:ndarray)->ndarray{
    // finds the max of two arrays element wise
    assert(x.n == y.n)
    var z = zeros_like(x)
    vDSP_vmaxD(!x, 1.stride, !y, 1.stride, !z, 1.stride, x.n.length)
    return z
}
func min(x: ndarray, y:ndarray)->ndarray{
    // finds the min of two arrays element wise
    assert(x.n == y.n)
    var z = zeros_like(x)
    vDSP_vminD(!x, 1.stride, !y, 1.stride, !z, 1.stride, x.n.length)
    return z
}
func sign(x: ndarray)->ndarray{
    // finds the sign
    return apply_function("sign", x)}
func sum(x: ndarray) -> Double{
    // finds the sum of an array
    var ret:CDouble = 0
    vDSP_sveD(!x, 1.stride, &ret, x.n.length)
    return Double(ret)
}
func mean(x: ndarray) -> Double{
    // finds the mean
    return x.mean()
}
func remainder(x1:ndarray, x2:ndarray)->ndarray{
    // finds the remainder
    return (x1 - floor(x1 / x2) * x2)
}
func std(x: ndarray) -> Double{
    // standard deviation
    return sqrt(variance(x))}
func variance(x: ndarray) -> Double{
    // the varianace
    return sum(pow(x - mean(x), 2) / x.count.double)}
func cumsum(x: ndarray) -> ndarray{
    // the sum of each element before.
    return apply_function("cumsum", x)}
func abs(x: ndarray) -> ndarray{
    // absolute value
    return apply_function("abs", x)}
func norm(x: ndarray, ord:Double=2) -> Double{
    // takes the norm of an array
    if ord==2      { return sqrt(sum(pow(x, 2)))}
    else if ord==1 { return sum(abs(x))}
    else if ord==0 { return sum(abs(x) > S2_THRESHOLD)}
    else if ord == -1 || ord == -2{
        return pow(sum(abs(x)^ord.double), 1/ord.double)
    }
    else if ord.double ==  inf {return max(abs(x))}
    else if ord.double == -inf {return min(abs(x))}
    assert(false, "type of norm unrecongnized")
    return -1.0}


// optimized for pow(ndarray, double)
func pow(x:ndarray, power:Double)->ndarray{
    // take the power. also callable with ^
    var y = zeros_like(x)
    CVWrapper.pow(!x, n:x.n.cint, power:power, into:!y)
    return y
}
func pow(x:ndarray, y:ndarray)->ndarray{
    // take the power. also callable with ^
    var z = zeros_like(x)
    for i in 0..<x.n{
        z[i] = pow(x[i], y[i])
    }
    return z
}
func pow(x:Double, y:ndarray)->ndarray{
    // take the power. also callable with ^
    var z = zeros_like(y)
    for i in 0..<y.n{
        z[i] = pow(x, y[i])
    }
    return z
}
func sqrt(x: ndarray) -> ndarray{
    return x^0.5
}
func floor(x: ndarray) -> ndarray{
    return apply_function("floor", x)
}
func ceil(x: ndarray) -> ndarray{
    return floor(x)+1
}

func round(x:ndarray)->ndarray{
    var xx = x.copy()
    var y = zeros_like(x)
    vDSP_vfracD(!xx, 1.stride, !y, 1.stride, x.n.length)
    var i = 0.5 - y
    y[argwhere(i > 0)] *= 0
    var j = argwhere(i <= 0)
    y[j] = ones(j.n)
    return floor(x) + y
}
func round(x:ndarray, #decimals:Double)->ndarray{
    var factor = pow(10, decimals)
    return round(x*factor) / factor
}
func log10(x:ndarray)->ndarray{
    // log_10
    return apply_function("log10", x)
}

func log2(x:ndarray)->ndarray{
    // log_2
    return log10(x) / log10(2.0)
}
func log(x:ndarray)->ndarray{
    // log_e
    return log10(x) / log10(e)
}
func sin(x: ndarray) -> ndarray{
    // trig
    return apply_function("sin", x)
}
func cos(x: ndarray) -> ndarray{
    // trig
    return apply_function("cos", x)
}
func tan(x: ndarray) -> ndarray{
    // trig
    return apply_function("tan", x)
}









