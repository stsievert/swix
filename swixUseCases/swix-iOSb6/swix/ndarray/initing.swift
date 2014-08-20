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
    return ndarray(n: N)
}
func zeros_like(x: ndarray) -> ndarray{
    return zeros(x.n)
}
func ones(N: Int) -> ndarray{
    return ndarray(n: N)+1
}
func arange(max: Double, x exclusive:Bool = true) -> ndarray{
    var x = arange(0, max, x:exclusive)
    return x
}
func arange(max: Int, x exclusive:Bool = true) -> ndarray{
    var x = arange(0, max.double, x:exclusive)
    return x
}
func range(min:Double, max:Double, step:Double) -> ndarray{
    return linspace(min, max, num:1+((max-min)/step).int)
}
func arange(min: Double, max: Double, x exclusive: Bool = true) -> ndarray{
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
    var x = zeros(num+0)
    var min  = CDouble(min)
    var step = CDouble((max-min).double/(num-1).double)
    vDSP_vrampD(&min, &step, !x, 1.stride, x.n.length)
    return x
}
func array(numbers: Double...) -> ndarray{
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
    var y = zeros(x.count)
    y.grid = x
    return y
}
func asarray(seq: Range<Int>) -> ndarray {
    // improve with [1]
    // [1]:https://gist.github.com/nubbel/d5a3639bea96ad568cf2
    var start:Double = seq.startIndex.double * 1.0
    var end:Double   = seq.endIndex.double * 1.0
    var s = arange(start, end, x:true)
    return s
}

func copy(x: ndarray) -> ndarray{
    return x.copy()
}
func read_csv(filename:String, prefix:String=S2_PREFIX) -> ndarray{
    var x = String.stringWithContentsOfFile(prefix+"../"+filename, encoding: NSUTF8StringEncoding, error: nil)
    var array:[Double] = []
    var columns:Int = 0
    var z = x!.componentsSeparatedByString(",")
    columns = 0
    for i in 0..<z.count-1{
            var num = z[i]
            array.append(num.doubleValue)
            columns += 1
    }
    var done = zeros(1 * columns)
    done.grid = array
    return done
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
    var x = arange(N.double)
    var y = shuffle(x)
    return y
}




















