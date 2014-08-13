//
//  twoD-complex-math.swift
//  swix
//
//  Created by Scott Sievert on 7/15/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation
import Swift

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
func svd(x: matrix) -> (matrix, ndarray, matrix){
    var (m, n) = x.shape
    var nS = m < n ? m : n // number singular values
    var sigma = zeros(nS)
    var vt = zeros((n,n))
    var u = zeros((m,m))

    var xx = zeros_like(x)
    xx.flat = x.flat
    xx = xx.T
    svd_objc(!xx, m.cint, n.cint, !sigma, !vt, !u);
    
    // to get the svd result to match Python
    var v = transpose(vt)
    u = transpose(u)

    return (u, sigma, v)
}
func inv(x: matrix) -> matrix{
    assert(x.shape.0 == x.shape.1, "To take an inverse of a matrix, the matrix must be square. If you want the inverse of a rectangular matrix, use psuedoinverse.")
    var y = x.copy()
    var (M, N) = x.shape
    
    var ipiv:Array<__CLPK_integer> = Array(count:M*M, repeatedValue:0)
    var lwork:__CLPK_integer = __CLPK_integer(N*N)
    var work:[CDouble] = Array(count:lwork, repeatedValue:0.0)
    var info:__CLPK_integer=0
    var nc:CInt = N.cint
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
    var lwork:CInt = 4 * n.cint
    var info:CInt = 1
    
    // don't compute right or left eigenvectors
    var job = "N"
    var ccharOptional = job.cStringUsingEncoding(NSUTF8StringEncoding)?[0]  // CChar?
    var jobvl = (job.cStringUsingEncoding(NSUTF8StringEncoding)?[0])!
    var jobvr = (job.cStringUsingEncoding(NSUTF8StringEncoding)?[0])!
    
    work[0] = lwork
    var nc = n.cint
    dgeev_(&jobvl, &jobvr, &nc, !x, &nc,
        !value_real, !value_imag, !vector, &nc, !vector, &nc,
        &work, &lwork, &info)
    
    vector = vector.T
    
    return value_real
}









