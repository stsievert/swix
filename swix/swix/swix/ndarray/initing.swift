//
//  initing.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate
import Swift

// SLOW PARTS: array(doubles), read_csv, write_csv. not a huge deal -- hopefully not used in final code


func zeros(N: Int) -> ndarray{
    // N zeros
    return ndarray(n: N)
}
func zeros_like(x: ndarray) -> ndarray{
    // make an array like the other array
    return zeros(x.n)
}
func ones_like(x: ndarray) -> ndarray{
    // make an array like the other array
    return zeros_like(x) + 1
}
func ones(N: Int) -> ndarray{
    // N ones
    return ndarray(n: N)+1
}
func arange(max: Double, x exclusive:Bool = true) -> ndarray{
    // 0..<max
    var x = arange(0, max, x:exclusive)
    return x
}
func arange(max: Int, x exclusive:Bool = true) -> ndarray{
    // 0..<max
    var x = arange(0, max.double, x:exclusive)
    return x
}
func range(min:Double, max:Double, step:Double) -> ndarray{
    // min, min+step, min+2*step..., max-step, max
    return linspace(min, max, num:1+((max-min)/step).int)
}
func arange(min: Double, max: Double, x exclusive: Bool = true) -> ndarray{
    // min...max
    var pad = 0
    if !exclusive {pad = 1}
    let N = max.int - min.int + pad
    var x = zeros(N)
    var o = CDouble(min)
    var l = CDouble(1)
    vDSP_vrampD(&o, &l, !x, 1.stride, N.length)
    return x
}
func linspace(min: Double, max: Double, num: Int=50) -> ndarray{
    // 0...1
    var x = zeros(num+0)
    var min  = CDouble(min)
    var step = CDouble((max-min).double/(num-1).double)
    vDSP_vrampD(&min, &step, !x, 1.stride, x.n.length)
    return x
}
func array(numbers: Double...) -> ndarray{
    // array(1, 2, 3, 4) -> arange(4)+1
    // okay to leave unoptimized, only used for testing
    var x = zeros(numbers.count)
    var i = 0
    for number in numbers{
        x[i] = number
        i++
    }
    return x
}
func asarray(x: [Double]) -> ndarray{
    // convert a grid of double's to an array
    var y = zeros(x.count)
    y.grid = x
    return y
}
func asarray(seq: Range<Int>) -> ndarray {
    // make a range a grid of arrays
    // improve with [1]
    // [1]:https://gist.github.com/nubbel/d5a3639bea96ad568cf2
    var start:Double = seq.startIndex.double * 1.0
    var end:Double   = seq.endIndex.double * 1.0
    var s = arange(start, end, x:true)
    return s
}

func copy(x: ndarray) -> ndarray{
    // copy the value
    return x.copy()
}

func rand(N: Int, seed:Int=42, distro:String="uniform") -> ndarray{
    var x = zeros(N)
    var i:__CLPK_integer = 1
    if distro=="normal" {i = __CLPK_integer(3)}
    var seed:Array<__CLPK_integer> = [__CLPK_integer(seed), 42, 2, 29]
    var nn:__CLPK_integer  = __CLPK_integer(N)
    dlarnv_(&i, &seed, &nn, !x)
    return x
}
func randn(N: Int, mean: Double=0, sigma: Double=1, seed:Int=42) -> ndarray{
    return (rand(N, distro:"normal") * sigma) + mean;
}
func randperm(N:Int)->ndarray{
    var x = arange(N)
    var y = shuffle(x)
    return y
}




















