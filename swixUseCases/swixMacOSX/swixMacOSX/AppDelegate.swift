//
//  AppDelegate.swift
//  swixMacOSX
//
//  Created by Scott Sievert on 7/12/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet var window: NSWindow


    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        // Insert code here to initialize your application
        var x = ones((4,4))
        var y = ones((4,4))*2
        var z = x *! y
        println(z)
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }


}

