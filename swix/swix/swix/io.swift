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
// matrix csv
/* Old Version
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
}*/

func read_csv(filename:String, _ header:Bool=true, _ detectRow: Int=1) -> matrix{
    var x: String?
    do {
        x = try String(contentsOfFile: filename, encoding: NSUTF8StringEncoding)
    } catch _ {
        x = nil
    }
    //Three are three types of line breaks: \r, \n and \r\n. All change to \n.
    x=x!.stringByReplacingOccurrencesOfString("\r\n",withString: "\n")  //Remove \r if \r\n
    x=x!.stringByReplacingOccurrencesOfString("\r",withString: "\n")  //Change \r if there is any
    var y = x!.componentsSeparatedByString("\n")
    let rows = y.count-1
    var array:[Double] = []
    var columns:Int = 0
    var startrow:Int = 0    //The first row of the data
    var categorical_col:[Int]=[]    //Record the columns which are categorical variables
    if(header==true)
    {
        startrow = 1
    }
    let test = y[detectRow + startrow - 1].componentsSeparatedByString(",") //Use first row to detect which columns are categorical
    categorical_col = Array(count:test.count, repeatedValue:-1)
    columns=0
    for testtext in test{
        if(Double(testtext) == nil){
        categorical_col[columns]=0    //If column j is categorical, then categorical_col[j] = 0; otherwise -1.
        }
        columns=columns+1
    }
    var factor = [String:Int]() //Dictionary to map categorical levels -> integer
    var levels = Set<String>()  //Set to store all categorical levels
    for i in startrow..<rows{
        let z = y[i].componentsSeparatedByString(",")
        columns = 0
        for text in z{
            if(Double(text) != nil)
            {
                array.append(Double(text)!)
            }
            else
            {
                let name=String(columns)+text   //In case two columns have same categorical levels, we add prefix
                if(levels.contains(name))
                {
                    array.append(Double(factor[name]!)) //If in this column we have already seen this level, then use it
                }
                else{   //Otherwise, we add a level to this column
                    factor[name]=categorical_col[columns]
                    levels.insert(name)
                    categorical_col[columns]=categorical_col[columns]+1 //Each column will record how many levels it has already encountered.
                    array.append(Double(factor[name]!))
                }
            }
            columns += 1
        }
    }
    var done = zeros((rows-startrow, columns))
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
