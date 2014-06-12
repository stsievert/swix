//
//  oneD_fft.swift
//  swix
//
//  Created by Scott Sievert on 6/11/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate

func fft(x: matrix) -> matrix{
    let N = x.count
    var y = zeros(N)
    let log2n = vDSP_Length(Int(log2(CDouble(N))))
    let radix = FFT_RADIX2.bridgeToObjectiveC().intValue
    let FFTdirection = "forward"

    let FFTsetup = vDSP_create_fftsetup(log2n, radix)

//    var xx: CConstPointer<DSPSplitComplex> = nil
//    for i in x{
//        xx.append(i)
//    }
//    vDSP_fft_zropD(
//        __vDSP_setup: FFTsetup,
//        __vDSP_signal: x,
//        __vDSP_strideResult: Int(1),//.bridgeToObjectiveC().intValue,
//        __vDSP_result: y,
//        __vDSP_resultResult: Int(1),//.bridgeToObjectiveC().intValue,
//        __vDSP_Log2N: log2n,
//        __vDSP_direction: FFT_FORWARD.bridgeToObjectiveC().boolValue
//    )
    
// from stackoverflow: http://stackoverflow.com/questions/24113029/casting-parameters-to-make-swift-compile-with-vdsp-api
//    let width = 10
//    let height = 10
//
//    var srcAsFloat:CConstPointer<CFloat> = CFloat[](count: Int(width*                           height), repeatedValue: 0)
//    var min:CFloat = 0.0
//    var max:CFloat = 255.0
//    var l:vDSP_Stride = Int(width*height)
//    var dstAsFloat = CFloat[](count: Int(width*height), repeatedValue: 0)
//    vDSP_vclip(
//        __vDSP_A: CConstPointer<CFloat>(&dstAsFloat),
//        __vDSP_I: vDSP_Stride(1),
//        __vDSP_B: CConstPointer<CFloat>(&min),
//        __vDSP_C: CConstPointer<CFloat>(&max),
//        __vDSP_D: CMutablePointer<CFloat>(&dstAsFloat),
//        __vDSP_L: vDSP_Stride(1),
//        __vDSP_N: l
//    )

    return x
}