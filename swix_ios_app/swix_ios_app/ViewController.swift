//
//  ViewController.swift
//  swix_ios_app
//
//  Created by Scott Sievert on 9/13/15.
//  Copyright © 2015 com.scott. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var img = UIImage(named: "space_shuttle.png")!
        self.imageView.image = img
        

    }
    @IBAction func changeImage(sender: AnyObject) {
        var N = 500
        var x = 255*rand((N, N))
        var img2 = RGBAToUIImage(x, g: x, b: x, a: 255*ones(x.shape))
        
        self.imageView.image = img2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

