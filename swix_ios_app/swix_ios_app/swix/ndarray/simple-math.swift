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
    let y = zeros_like(x)
    let n = x.n.length
    var count = Int32(x.n)
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
        vvfloor(!y, !x, &count)
    }
    else if function=="log10"{
        assert(min(x) > 0, "log must be called with positive values")
        vvlog10(!y, !x, &count)
    }
    else if function=="log2"{
        assert(min(x) > 0, "log must be called with positive values")
        vvlog2(!y, !x, &count)
    }
    else if function=="exp2"{
        vvexp2(!y, !x, &count)
    }
    else if function=="log"{
        assert(min(x) > 0, "log must be called with positive values")
        vvlog(!y, !x, &count)
    }
    else if function=="exp"{
        vvexp(!y, !x, &count)
    }
    else if function=="cos"{
        vvcos(!y, !x, &count)
    }
    else if function=="sin"{
        vvsin(!y, !x, &count)
    }
    else if function=="tan"{
        vvtan(!y, !x, &count)
    }
    else if function=="expm1"{
        vvexpm1(!y, !x, &count)
    }
    else if function=="round"{
        vvnint(!y, !x, &count)
    }
    else if function=="ceil"{
        vvceil(!y, !x, &count)
    }
    else if function == "tanh" {
        vvtanh(!y, !x, &count)
    }
    else {assert(false, "Function not recongized")}
    return y
}

// MIN/MAX
func min(x: ndarray) -> Double{
    // finds the min
    return x.min()}
func max(x: ndarray) -> Double{
    // finds the max
    return x.max()}
func max(x: ndarray, y:ndarray)->ndarray{
    // finds the max of two arrays element wise
    assert(x.n == y.n)
    let z = zeros_like(x)
    vDSP_vmaxD(!x, 1.stride, !y, 1.stride, !z, 1.stride, x.n.length)
    return z
}
func min(x: ndarray, y:ndarray)->ndarray{
    // finds the min of two arrays element wise
    assert(x.n == y.n)
    let z = zeros_like(x)
    vDSP_vminD(!x, 1.stride, !y, 1.stride, !z, 1.stride, x.n.length)
    return z
}

// BASIC STATS
func mean(x: ndarray) -> Double{
    // finds the mean
    return x.mean()
}
func std(x: ndarray) -> Double{
    // standard deviation
    return sqrt(variance(x))}
func variance(x: ndarray) -> Double{
    // the varianace
    return sum(pow(x - mean(x), power: 2) / x.count.double)}

// BASIC INFO
func sign(x: ndarray)->ndarray{
    // finds the sign
    return apply_function("sign", x: x)}
func sum(x: ndarray) -> Double{
    // finds the sum of an array
    var ret:CDouble = 0
    vDSP_sveD(!x, 1.stride, &ret, x.n.length)
    return Double(ret)
}
func remainder(x1:ndarray, x2:ndarray)->ndarray{
    // finds the remainder
    return (x1 - floor(x1 / x2) * x2)
}
func cumsum(x: ndarray) -> ndarray{
    // the sum of each element before.
    return apply_function("cumsum", x: x)}
func abs(x: ndarray) -> ndarray{
    // absolute value
    return apply_function("abs", x: x)}
func prod(x:ndarray)->Double{
    var y = x.copy()
    var factor = 1.0
    if min(y) < 0{
        y[argwhere(y < 0.0)] *= -1.0
        if sum(x < 0) % 2 == 1 {factor = -1}
    }
    return factor * exp(sum(log(y)))
}
func cumprod(x:ndarray)->ndarray{
    var y = x.copy()
    if min(y) < 0.0{
        let i = y < 0
        y[argwhere(i)] *= -1.0
        let j = 1 - (cumsum(i) % 2.0) < S2_THRESHOLD
        var z = exp(cumsum(log(y)))
        z[argwhere(j)] *= -1.0
        return z
    }
    return exp(cumsum(log(y)))
}


// POWER FUNCTIONS
func pow(x:ndarray, power:Double)->ndarray{
    // take the power. also callable with ^
    let y = zeros_like(x)
    CVWrapper.pow(!x, n:x.n.cint, power:power, into:!y)
    return y
}
func pow(x:ndarray, y:ndarray)->ndarray{
    // take the power. also callable with ^
    let z = zeros_like(x)
    var num = CInt(x.n)
    vvpow(!z, !y, !x, &num)
    return z
}
func pow(x:Double, y:ndarray)->ndarray{
    // take the power. also callable with ^
    let xx = ones(y.n) * x
    return pow(xx, y: y)
}
func sqrt(x: ndarray) -> ndarray{
    return x^0.5
}
func exp(x:ndarray)->ndarray{
    return apply_function("exp", x: x)
}
func exp2(x:ndarray)->ndarray{
    return apply_function("exp2", x: x)
}
func expm1(x:ndarray)->ndarray{
    return apply_function("expm1", x: x)
}

// ROUND
func round(x:ndarray)->ndarray{
    return apply_function("round", x: x)
}
func round(x:ndarray, decimals:Double)->ndarray{
    let factor = pow(10, decimals)
    return round(x*factor) / factor
}
func floor(x: ndarray) -> ndarray{
    return apply_function("floor", x: x)
}
func ceil(x: ndarray) -> ndarray{
    return apply_function("ceil", x: x)
}

// LOG
func log10(x:ndarray)->ndarray{
    // log_10
    return apply_function("log10", x: x)
}
func log2(x:ndarray)->ndarray{
    // log_2
    return apply_function("log2", x: x)
}
func log(x:ndarray)->ndarray{
    // log_e
    return apply_function("log", x: x)
}

// TRIG
func sin(x: ndarray) -> ndarray{
    return apply_function("sin", x: x)
}
func cos(x: ndarray) -> ndarray{
    return apply_function("cos", x: x)
}
func tan(x: ndarray) -> ndarray{
    return apply_function("tan", x: x)
}
func tanh(x: ndarray) -> ndarray {
    return apply_function("tanh", x: x)
}









