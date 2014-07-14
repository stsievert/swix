#ScalarArithmetic

### Why?
* Because I don't need explicit casts to ```Double``` if I am expecting a ```Double```.
* ```5 + 5.0 ``` should return a ```Double```
* Because Double is only a CGFloat on 64bit, so you can't do this on 32 bit:
```swift
let myHeight = 34.5
let myWidth = 100.23
let sizeOfWindow = CGSize(width:myWidth, height:myHeight) 
let myDouble:Double = sizeOfWindow.height // .height is a CGFloat
let isLargerThan = 213.3 > sizeOfWindow.width // 213.3 is a Double


//You can now compare or do mathematical operations on the following: 
    var doubleValue:Double      = 5.0
    var cgFloatValue:CGFloat    = 5.0
    var intValue:Int            = 5
    var int16Value:Int16        = 5
    var int32Value:Int32        = 5
    var int64Value:Int64        = 5
    var uInt16Value:UInt16      = 5
    var uInt32Value:UInt32      = 5
    var uInt64Value:UInt64      = 5
````




### Overview

Takes care of operators for interacting between different types of scalars.
This library makes it easier to compare to ```Int```, ```Float``` and ```CGFloat``` regardless of architecture.

This also makes implicit casts to Double or CGFloat for arguments or variables that takes either types. 


``var myDouble = 2.0`` will give you a ```Double``` and you'd want to use that with other types. 

Since ```CGFloat``` is not a ```Double``` on 32bit, it becomes hard to use CGGeometry and frameworks like CoreGraphics or SpriteKit. This library makes it a little easier and hopefully Apple takes care of it soon. 

Works on both Mac OS and iOS.




### Math Functions

Many people disagreed with the global math functions being used as properties. I was on the fence on that one because I didn't want to write over them for 32 bit. However now that implicit casts are in place. This works on 32bit. 
```swift
let yay = abs(2.0)
```


###Contact


If you end up using ScalarArithmetic in a project, I'd love to hear about it.

email: [seivan.heidari@icloud.com](mailto:seivan.heidari@icloud.com)  
twitter: [@seivanheidari](https://twitter.com/seivanheidari)

***

### License

ScalarArithmetic is © 2014 [Seivan](http://www.github.com/seivan) and may be freely
distributed under the [MIT license](http://opensource.org/licenses/MIT).
See the [`LICENSE.md`](https://github.com/seivan/ScalarArithmetic/blob/master/LICENSE.md) file.

*** 
