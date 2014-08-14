//
//  matrix2d.swift
//  swix
//
//  Created by Scott Sievert on 7/9/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Accelerate
struct matrix {
    let n: Int
    var rows: Int
    var columns: Int
    var count: Int
    var shape: (Int, Int)
    var flat:ndarray
    var T:matrix {return transpose(self)}
    var I:matrix {return inv(self)}
    init(columns: Int, rows: Int) {
        self.n = rows * columns
        self.rows = rows
        self.columns = columns
        self.shape = (rows, columns)
        self.count = n
        self.flat = zeros(rows * columns)
        
    }
    func copy()->matrix{
        var y = zeros_like(self)
        y.flat = self.flat.copy()
        return y
    }
    subscript(i: String) -> ndarray {
        get {
            assert(i == "diag", "Currently the only support x[string] is x[\"diag\"]")
            var size = rows < columns ? rows : columns
            var i = arange(size)
            return self[i*columns.double + i]
        }
        set {
            assert(i == "diag", "Currently the only support x[string] is x[\"diag\"]")
            var m = shape.0
            var n = shape.1
            var min_mn = m < n ? m : n
            var j = n.double * arange(min_mn)
            self[j + j/n.double] = newValue
        }
    }
    func indexIsValidForRow(r: Int, c: Int) -> Bool {
        return r >= 0 && r < rows && c>=0 && c < columns
    }
    func dot(y: matrix) -> matrix{
        return self *! y
    }
    subscript(i: Int, j: Int) -> Double {
        get {
            assert(indexIsValidForRow(i, c:j), "Index out of range")
            return flat[i*columns + j]
        }
        set {
            assert(indexIsValidForRow(i, c:j), "Index out of range")
            flat[i*columns + j] = newValue
        }
    }
    subscript(r: Range<Int>, c: Range<Int>) -> matrix {
        get {
            var rr = asarray(r)
            var cc = asarray(c)
            var (j, i) = meshgrid(rr, cc)
            var idx = (j.flat*columns.double + i.flat)
            var z = flat[idx]
            var zz = reshape(z, (rr.n, cc.n))
            return zz
        }
        set {
            var rr = asarray(r)
            var cc = asarray(c)
            var (j, i) = meshgrid(rr, cc)
            var idx = j.flat*columns.double + i.flat
            flat[idx] = newValue.flat
        }
    }
    subscript(r: ndarray, c: ndarray) -> matrix {
        get {
            var (j, i) = meshgrid(r, c)
            var idx = (j.flat*columns.double + i.flat)
            var z = flat[idx]
            var zz = reshape(z, (r.n, c.n))
            return zz
        }
        set {
            if r.n > 0 && c.n > 0{
                var (j, i) = meshgrid(r, c)
                var idx = j.flat*columns.double + i.flat
                flat[idx] = newValue.flat
            }
        }
    }
    subscript(r: ndarray) -> ndarray {
        get {return self.flat[r]}
        set {self.flat[r] = newValue }
    }
    subscript(i: Range<Int>, k: Int) -> ndarray {
        get {
            var idx = asarray(i)
            var x:ndarray = self.flat[idx * self.columns.double + k.double]
            return x
        }
        set {
            var idx = asarray(i)
            self.flat[idx * self.columns.double + k.double] = newValue[idx]
        }
    }
    subscript(i: Int, k: Range<Int>) -> ndarray {
        get {
            var idx = asarray(k)
            var x:ndarray = self.flat[i.double * self.columns.double + idx]
            return x
        }
        set {
            var idx = asarray(k)
            self.flat[i.double * self.columns.double + idx] = newValue[idx]
        }
    }
}

















