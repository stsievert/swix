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
    vDSP_fft_zrop(FFTsetup,
        x,
        1,//.bridgeToObjectiveC().intValue,
        y,
        1,//.bridgeToObjectiveC().intValue,
        log2n,
        FFT_FORWARD.bridgeToObjectiveC().boolValue
    )

    return x
}