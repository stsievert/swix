//
//  io.swift
//  swix
//
//  Created by Scott Sievert on 11/7/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

// ndarray binary
func write_binary(x:ndarray, filename:String, prefix:String=S2_PREFIX){
    let N = x.n
    let data = NSData(bytes:!x, length:N*sizeof(Double))
    data.writeToFile(prefix+"../"+filename, atomically: false)
}
func read_binary(filename:String, prefix:String=S2_PREFIX) -> ndarray{
    let read = NSData(contentsOfFile: prefix+"../"+filename)
    let l:Int! = read?.length
    let sD:Int = sizeof(Double)
    let count = (l.double / sD.double)
    
    let y = zeros(count.int)
    read?.getBytes(!y, length: count.int*sizeof(Double))
    return y
}

// matrix binary
func write_binary(x:matrix, filename:String, prefix:String=S2_PREFIX){
    let y = concat(array(x.shape.0.double, x.shape.1.double), y: x.flat)
    write_binary(y, filename:filename, prefix:prefix)
}
func read_binary(filename:String, prefix:String=S2_PREFIX)->matrix{
    var a:ndarray = read_binary(filename, prefix:prefix)
    let (w, h) = (a[0], a[1])
    return reshape(a[2..<a.n], shape: (w.int,h.int))
}


// ndarray csv
func write_csv(x:ndarray, filename:String, prefix:String=S2_PREFIX){
    // write the array to CSV
    var seperator=","
    var str = ""
    for i in 0..<x.n{
        seperator = i == x.n-1 ? "" : ","
        str += String(format: "\(x[i])"+seperator)
    }
    str += "\n"
    do {
        try str.writeToFile(prefix+"../"+filename, atomically: false, encoding: NSUTF8StringEncoding)
    } catch {
        Swift.print("File probably wasn't recognized")
    }
    
}
func read_csv(filename:String, prefix:String=S2_PREFIX) -> ndarray{
    var x: String?
    do {
        x = try String(contentsOfFile: prefix+"../"+filename, encoding: NSUTF8StringEncoding)
    } catch _ {
        x = nil
    }
    var array:[Double] = []
    var columns:Int = 0
    var z = x!.componentsSeparatedByString(",")
    columns = 0
    for i in 0..<z.count{
        let num = z[i]
        array.append(num.doubleValue)
        columns += 1
    }
    var done = zeros(1 * columns)
    done.grid = array
    return done
}

// matrix csv
func read_csv(filename:String, prefix:String=S2_PREFIX) -> matrix{
    var x: String?
    do {
        x = try String(contentsOfFile: prefix+"../"+filename, encoding: NSUTF8StringEncoding)
    } catch _ {
        x = nil
    }
    var y = x!.componentsSeparatedByString("\n")
    let rows = y.count-1
    var array:[Double] = []
    var columns:Int = 0
    for i in 0..<rows{
        let z = y[i].componentsSeparatedByString(",")
        columns = 0
        for num in z{
            array.append(num.doubleValue)
            columns += 1
        }
    }
    var done = zeros((rows, columns))
    done.flat.grid = array
    return done
}
func write_csv(x:matrix, filename:String, prefix:String=S2_PREFIX){
    var seperator=","
    var str = ""
    for i in 0..<x.shape.0{
        for j in 0..<x.shape.1{
            seperator = j == x.shape.1-1 ? "" : ","
            str += String(format: "\(x[i, j])"+seperator)
        }
        str += "\n"
    }
    do {
        try str.writeToFile(prefix+"../"+filename, atomically: false, encoding: NSUTF8StringEncoding)
    } catch {
        Swift.print("File probably wasn't recognized")
    }
}


