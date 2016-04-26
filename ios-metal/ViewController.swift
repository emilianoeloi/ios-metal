//
//  ViewController.swift
//  ios-metal
//
//  Created by Emiliano on 4/25/16.
//  Copyright © 2016 Emiliano. All rights reserved.
//

import UIKit
import MetalKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let device = MTLCreateSystemDefaultDevice() {
            label.text = "Your GPU name is:\n\(device.name!)"
        }else{
            label.text = "Your GPU does not support Metal"
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

