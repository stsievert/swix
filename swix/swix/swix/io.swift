//
//  io.swift
//  swix
//
//  Created by Scott Sievert on 11/7/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Foundation

// ndarray binary
func write_binary(x:ndarray, #filename:String, prefix:String=S2_PREFIX){
    var N = x.n
    var data = NSData(bytes:!x, length:N*sizeof(Double))
    data.writeToFile(prefix+"../"+filename, atomically: false)
}
func read_binary(filename:String, prefix:String=S2_PREFIX) -> ndarray{
    var read = NSData(contentsOfFile: prefix+"../"+filename)
    var l:Int! = read?.length
    var sD:Int = sizeof(Double)
    var count = (l.double / sD.double)
    
    var y = zeros(count.int)
    read?.getBytes(!y, length: count.int*sizeof(Double))
    return y
}

// matrix binary
func write_binary(x:matrix, #filename:String, prefix:String=S2_PREFIX){
    var y = concat(array(x.shape.0.double, x.shape.1.double), x.flat)
    write_binary(y, filename:filename, prefix:prefix)
}
func read_binary(filename:String, prefix:String=S2_PREFIX)->matrix{
    var a:ndarray = read_binary(filename, prefix:prefix)
    var (w, h) = (a[0], a[1])
    var b = reshape(a[2..<a.n], (w.int,h.int))
    return b
}


// ndarray csv
func write_csv(x:ndarray, #filename:String, prefix:String=S2_PREFIX){
    // write the array to CSV
    var seperator=","
    var str = ""
    for i in 0..<x.n{
        seperator = i == x.n-1 ? "" : ","
        str += String(format: "\(x[i])"+seperator)
    }
    str += "\n"
    var error:NSError?
    str.writeToFile(prefix+"../"+filename, atomically: false, encoding: NSUTF8StringEncoding, error: &error)
    if let error=error{
        println("File probably wasn't recognized \n\(error)")
    }
    
}
func read_csv(filename:String, prefix:String=S2_PREFIX) -> ndarray{
    var x = String(contentsOfFile: prefix+"../"+filename, encoding: NSUTF8StringEncoding, error: nil)
    var array:[Double] = []
    var columns:Int = 0
    var z = x!.componentsSeparatedByString(",")
    columns = 0
    for i in 0..<z.count{
        var num = z[i]
        array.append(num.doubleValue)
        columns += 1
    }
    var done = zeros(1 * columns)
    done.grid = array
    return done
}

// matrix csv
func read_csv(filename:String, prefix:String=S2_PREFIX) -> matrix{
    var x = String(contentsOfFile: prefix+"../"+filename, encoding: NSUTF8StringEncoding, error: nil)
    var y = x!.componentsSeparatedByString("\n")
    var rows = y.count-1
    var array:[Double] = []
    var columns:Int = 0
    for i in 0..<rows{
        var z = y[i].componentsSeparatedByString(",")
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
func write_csv(x:matrix, #filename:String, prefix:String=S2_PREFIX){
    var seperator=","
    var str = ""
    for i in 0..<x.shape.0{
        for j in 0..<x.shape.1{
            seperator = j == x.shape.1-1 ? "" : ","
            str += String(format: "\(x[i, j])"+seperator)
        }
        str += "\n"
    }
    var error:NSError?
    str.writeToFile(prefix+"../"+filename, atomically: false, encoding: NSUTF8StringEncoding, error: &error)
    if let error=error{
        println("File probably wasn't recognized \n\(error)")
    }
}


