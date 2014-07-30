//
//  twoD-image.swift
//  swix
//
//  Created by Scott Sievert on 7/30/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

func rgb2hsv_pixel(R:Double, G:Double, B:Double)->(Double, Double, Double){
    // tested against wikipedia/HSL_and_HSV. returns (H, S_hsv, V)
    var M = max(array(R, G, B))
    var m = min(array(R, G, B))
    var C = M - m
    var Hp:Double = 0
    if      M==R {Hp = ((G-B)/C) % 6}
    else if M==G {Hp = ((B-R)/C) + 2}
    else if M==B {Hp = ((R-G)/C) + 4}
    var H = 60 * Hp
    var V = M
    var S = 0.0
    if !(V==0) {S = C/V}
    
    return (H, S, V)
}


func rgb2hsv(r:matrix, g:matrix, b:matrix)->(matrix, matrix, matrix){
    assert(r.shape.0 == g.shape.0)
    assert(b.shape.0 == g.shape.0)
    assert(r.shape.1 == g.shape.1)
    assert(b.shape.1 == g.shape.1)
    var h = zeros_like(r)
    var s = zeros_like(g)
    var v = zeros_like(b)
    for i in 0..<r.shape.0{
        for j in 0..<r.shape.1{
            var (h_p, s_p, v_p) = rgb2hsv_pixel(r[i,j], g[i,j], b[i,j])
            h[i,j] = h_p
            s[i,j] = s_p
            v[i,j] = v_p
        }
    }
    return (h, s, v)
}


func savefig(x:matrix, filename:String){
    // prefix should point to the swix folder!
    // prefix is defined in numbers.swift
    // assumes python is on your path
    write_csv(x, filename:"temp.csv")
    system("cd "+S2_PREFIX+"; ~/anaconda/bin/ipython " + "imshow.py " + filename)
    system("rm "+S2_PREFIX+"temp.csv")
}



