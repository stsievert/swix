//
//  twoD-complex-math.swift
//  swix
//
//  Created by Scott Sievert on 7/15/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Swift
import Accelerate

func rank(x:matrix)->Double{
    var (u, S, v) = svd(x, compute_uv:false)
    var m:Double = (x.shape.0 < x.shape.1 ? x.shape.1 : x.shape.0).double
    var tol = S.max() * m * DOUBLE_EPSILON
    return sum(S > tol)
}
func dot(x: matrix, y: matrix) -> matrix{
    var (Mx, Nx) = x.shape
    var (My, Ny) = y.shape
    assert(Nx == My, "Matrix sizes not compatible for dot product")
    var z = zeros((Mx, Ny))
    cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,
        Mx.cint, Ny.cint, Nx.cint, 1.0,
        !x, Nx.cint,
        !y, Ny.cint, 1.0,
        !z, Ny.cint)
    return z
}
func svd(x: matrix, compute_uv:Bool=true) -> (matrix, ndarray, matrix){
    var (m, n) = x.shape
    var nS = m < n ? m : n // number singular values
    var sigma = zeros(nS)
    var vt = zeros((n,n))
    var u = zeros((m,m))

    var xx = zeros_like(x)
    xx.flat = x.flat
    xx = xx.T
    var c_uv:CInt = compute_uv==true ? 1 : 0
    svd_objc(!xx, m.cint, n.cint, !sigma, !vt, !u, c_uv)
    
    // to get the svd result to match Python
    var v = transpose(vt)
    u = transpose(u)

    return (u, sigma, v)
}
func pinv(x:matrix)->matrix{
    var (u, s, v) = svd(x)
    var m = u.shape.0
    var n = v.shape.1
    var ma = m < n ? n : m
    var cutoff = DOUBLE_EPSILON * ma.double * max(s)
    var i = s > cutoff
    var ipos = argwhere(i)
    s[ipos] = 1 / s[ipos]
    var ineg = argwhere(1-i)
    s[ineg] = zeros_like(ineg)
    var z = zeros((n, m))
    z["diag"] = s
    var res = v.T.dot(z).dot(u.T)
    return res
}
func inv(x: matrix) -> matrix{
    assert(x.shape.0 == x.shape.1, "To take an inverse of a matrix, the matrix must be square. If you want the inverse of a rectangular matrix, use psuedoinverse.")
    var y = x.copy()
    var (M, N) = x.shape
    
    var ipiv:Array<__CLPK_integer> = Array(count:M*M, repeatedValue:0)
    var lwork:__CLPK_integer = __CLPK_integer(N*N)
//    var work:[CDouble] = [CDouble](count:lwork, repeatedValue:0)
    var work = [CDouble](count: Int(lwork), repeatedValue: 0.0)
    var info:__CLPK_integer=0
    var nc = __CLPK_integer(N)
    dgetrf_(&nc, &nc, !y, &nc, &ipiv, &info)
    dgetri_(&nc, !y, &nc, &ipiv, &work, &lwork, &info)
    return y
}
func solve(A: matrix, b: ndarray) -> ndarray{
    var (m, n) = A.shape
    assert(b.n == m, "Ax = b, A.rows == b.n. Sizes must match which makes sense mathematically")
    assert(n == m, "Matrix must be square -- dictated by OpenCV")
    var x = zeros(n)
    CVWrapper.solve(!A, b:!b, x:!x, m:m.cint, n:n.cint)
    return x
}
func eig(x: matrix)->ndarray{
    // matrix, value, vectors
    var (m, n) = x.shape
    assert(m == n, "Input must be square")
    
    var value_real = zeros(m)
    var value_imag = zeros(n)
    var vector = zeros((n,n))
    
    var y = x.copy()
    
    var work:[Double] = Array(count:n*n, repeatedValue:0.0)
    var lwork = __CLPK_integer(4 * n)
    var info = __CLPK_integer(1)
    
    // don't compute right or left eigenvectors
    var job = "N"
    var ccharOptional = job.cStringUsingEncoding(NSUTF8StringEncoding)?[0]  // CChar?
    var jobvl = (job.cStringUsingEncoding(NSUTF8StringEncoding)?[0])!
    var jobvr = (job.cStringUsingEncoding(NSUTF8StringEncoding)?[0])!
    
    work[0] = Double(lwork)
    var nc = __CLPK_integer(n)
    dgeev_(&jobvl, &jobvr, &nc, !x, &nc,
        !value_real, !value_imag, !vector, &nc, !vector, &nc,
        &work, &lwork, &info)
    
    vector = vector.T
    
    return value_real
}









