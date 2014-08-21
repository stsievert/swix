//
//  initing.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate

// the matrix definition and related functions go here

// SLOW PARTS: x[ndarray, ndarray] set


struct ndarray {
    let n: Int
    var count: Int
    var grid: [Double]
    init(n: Int) {
        self.n = n
        self.count = n
        grid = Array(count: n, repeatedValue: 0.0)
    }
    func reshape(shape: (Int,Int)) -> matrix{
        var (mm, nn) = shape
        if mm == -1 {mm = n / nn}
        if nn == -1 {nn = n / mm}
        assert(mm * nn == n, "Number of elements must not change.")
        var y:matrix = zeros((mm, nn))
        y.flat = self
        return y
    }
    func copy() -> ndarray{
        var y = zeros(n)
        cblas_dcopy(self.n.cint, !self, 1.cint, !y, 1.cint)
        return y
    }
    func sort(){
        vDSP_vsortD(!self, self.n.length, 1.cint)
    }
    func indexIsValidForRow(index: Int) -> Bool {
        return index >= 0 && index < n
    }
    func min() -> Double{
        var m:CDouble=0
        vDSP_minvD(!self, 1.stride, &m, self.n.length)
        return Double(m)
    }
    func max() -> Double{
        var m:CDouble=0
        vDSP_maxvD(!self, 1.stride, &m, self.n.length)
        return m
    }
    func mean() -> Double{
        return sum(self) / n
    }
    subscript(index:String)->ndarray{
        get {
            assert(index == "all", "Currently only \"all\" is supported")
            return self
        }
        set {
            assert(index == "all", "Currently only \"all\" is supported")
            self[0..<n] = newValue
        }
    }
    subscript(index: Int) -> Double {
        get {
            var newIndex:Int = index
            if newIndex < 0 {newIndex = self.n + index}
            assert(indexIsValidForRow(newIndex), "Index out of range")
            return grid[newIndex]
        }
        set {
            var newIndex:Int = index
            if newIndex < 0 {newIndex = self.n + index}
            assert(indexIsValidForRow(newIndex), "Index out of range")
            grid[newIndex] = newValue
        }
    }
    subscript(r: Range<Int>) -> ndarray {
        get {
            // assumes that r is not [0, 1, 2, 3...] not [0, 2, 4...]
            return self[asarray(r)]
        }
        set {
            self[asarray(r)].grid = newValue.grid}
    }
    subscript(oidx: ndarray) -> ndarray {
        get {
            // ndarray has fractional parts, and those parts get truncated
            var idx = oidx.copy()
            if idx.max() < 0 {idx += n.double }
            assert((idx.max().int < self.n) && (idx.min() >= 0), "An index is out of bounds")
            var y = zeros(idx.n)
            vDSP_vindexD(!self, !idx, 1.stride, !y, 1.stride, idx.n.length)
            return y
        }
        set {
            var idx = oidx.copy()
            if idx.max() < 0 {idx += n.double }
            assert((idx.max().int < self.n) && (idx.min() >= 0), "An index is out of bounds")
            // asked stackoverflow question at [1]
            // [1]:http://stackoverflow.com/questions/24727674/modify-select-elements-of-an-array
            // tried basic optimization myself, but the compiler took care of that.
            // dropped for speed results (depends on for-loop in C)
            index_xa_b_objc(!self, !idx, !newValue, idx.n.cint)
        }
    }
}

















