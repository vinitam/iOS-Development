//
//  ViewController.swift
//  SliderSwift
//
//  Created by Vinita Miranda on 5/7/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.slider.minimumValue = 7.0
        self.slider.maximumValue = 10.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderValueChanged(sender: AnyObject) {
        println("\(self.slider.value)")
        
        
    }

}

