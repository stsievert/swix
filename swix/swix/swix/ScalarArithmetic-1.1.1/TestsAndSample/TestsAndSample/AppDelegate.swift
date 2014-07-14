//
//  AppDelegate.swift
//  TestsAndSample
//
//  Created by Seivan Heidari on 29/06/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
  var window: UIWindow?

  
  
  
  

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
    self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
    // Override point for customization after application launch.
    self.window!.backgroundColor = UIColor.whiteColor()
    self.window!.makeKeyAndVisible()
    
    
    var doubleValue:Double      = 5.0
    var cgFloatValue:CGFloat    = 5.0
    var intValue:Int            = 5
    var int16Value:Int16        = 5
    var int32Value:Int32        = 5
    var int64Value:Int64        = 5
    var uInt16Value:UInt16      = 5
    var uInt32Value:UInt32      = 5
    var uInt64Value:UInt64      = 5
    
    doubleValue = doubleValue + int16Value
    doubleValue = doubleValue + int32Value
    doubleValue = doubleValue + int64Value
    
    doubleValue = doubleValue + uInt16Value
    doubleValue = doubleValue + uInt32Value
    doubleValue = doubleValue + uInt64Value

    cgFloatValue = cgFloatValue + int16Value
    cgFloatValue = cgFloatValue + int32Value
    cgFloatValue = cgFloatValue + int64Value

    cgFloatValue = cgFloatValue + uInt16Value
    cgFloatValue = cgFloatValue + uInt32Value
    cgFloatValue = cgFloatValue + uInt64Value
    
    intValue = intValue + int64Value
    intValue = intValue + uInt64Value
    intValue = uInt64Value + int64Value
    
    intValue > int64Value
    
    return true
  }

  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

