//
//  ViewController.swift
//  swix-iOS
//
//  Created by Scott Sievert on 7/12/14.
//  Copyright (c) 2014 com.scott. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var x = ones((4,4))
        var y = ones((4,4)) * 2
        var z = x *! y
        println(z)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

