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
    var y = zeros_like(x)
    var n = vDSP_Length(x.n)
    if function=="abs"{
        vDSP_vabsD(!x, 1, !y, 1, n);}
    else if function=="sign"{
        var o = CDouble(0)
        var l = CDouble(1)
        vDSP_vlimD(!x, vDSP_Stride(1), &o, &l, !y, vDSP_Stride(1), n)
    }
    else if function=="cumsum"{
        var scalar:CDouble = 1
        vDSP_vrsumD(!x, vDSP_Stride(1), &scalar, !y, vDSP_Stride(1), n)
    }
    else if function=="floor"{
        var z = zeros_like(x)
        vDSP_vfracD(!x, vDSP_Stride(1), !z, vDSP_Stride(1), vDSP_Length(x.n))
        y = x - z
    }
    else {assert(false, "Function not recongized")}
    return y
}
// OPTIMIZED FUNCTIONS
func min(x: ndarray) -> Double{
    return x.min()}
func max(x: ndarray) -> Double{
    return x.max()}
func max(x: ndarray, y:ndarray)->ndarray{
    assert(x.n == y.n)
    var z = zeros_like(x)
    vDSP_vmaxD(!x, vDSP_Stride(1), !y, vDSP_Stride(1), !z, vDSP_Stride(1), vDSP_Length((x.n)))
    return z
}
func min(x: ndarray, y:ndarray)->ndarray{
    assert(x.n == y.n)
    var z = zeros_like(x)
    vDSP_vminD(!x, vDSP_Stride(1), !y, vDSP_Stride(1), !z, vDSP_Stride(1), vDSP_Length((x.n)))
    return z
}
func sign(x: ndarray)->ndarray{
    return apply_function("sign", x)}
func sum(x: ndarray) -> Double{
    var ret:CDouble = 0
    vDSP_sveD(!x, vDSP_Stride(1), &ret, vDSP_Length(x.n))
    return Double(ret)
}
func mean(x: ndarray) -> Double{
    return x.mean()
}
func remainder(x1:ndarray, x2:ndarray)->ndarray{
    return (x1 - floor(x1 / x2) * x2)
}
func std(x: ndarray) -> Double{
    return sqrt(variance(x))}
func variance(x: ndarray) -> Double{
    return sum(pow(x - mean(x), 2) / x.count.double)}
func cumsum(x: ndarray) -> ndarray{
    return apply_function("cumsum", x)}
func abs(x: ndarray) -> ndarray{
    return apply_function("abs", x)}
func sign(x: Double) -> Double{
    return x < 0 ? -1 : 1}
func norm(x: ndarray, type:String="l2") -> Double{
    if type=="l2"{ return sqrt(sum(pow(x, 2)))}
    if type=="l1"{ return sum(abs(x))}
    if type=="l0"{ return sum(abs(x) > 1e-9)}
    assert(false, "type of norm unrecongnized")
    return -1.0}


// optimized for pow(ndarray, double)
func pow(x:ndarray, power:Double)->ndarray{
    var y = zeros_like(x)
    CVWrapper.pow(!x, n:x.n.cint, power:power, into:!y)
    return y
}
func pow(x:ndarray, y:ndarray)->ndarray{
    var z = zeros_like(x)
    for i in 0..<x.n{
        z[i] = pow(x[i], y[i])
    }
    return z
}
func pow(x:Double, y:ndarray)->ndarray{
    var z = zeros_like(y)
    for i in 0..<y.n{
        z[i] = pow(x, y[i])
    }
    return z
}

// UNOPTIMIZED FUNCTIONS
func sin(x: ndarray) -> ndarray{
    return apply_function(sin, x)
}
func cos(x: ndarray) -> ndarray{
    return apply_function(cos, x)
}
func tan(x: ndarray) -> ndarray{
    return apply_function(tan, x)
}
/// log_e(.)
func log(x: ndarray) -> ndarray{
    var y = apply_function(log, x)
    return y
}
func sqrt(x: ndarray) -> ndarray{
    var y = apply_function(sqrt, x)
    return y
}
func round(x: ndarray) -> ndarray{
    return apply_function(round, x)
}
func floor(x: ndarray) -> ndarray{
    var y = apply_function("floor", x)
    return y
}
func ceil(x: ndarray) -> ndarray{
    var y = apply_function(ceil, x)
    return y
}









