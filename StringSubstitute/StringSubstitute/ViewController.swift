//
//  ViewController.swift
//  StringSubstitute
//
//  Created by Vinita Miranda on 5/3/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var name = "Reeya"
        var message = "Hi"
        
        var greetMessage = "\(message) \(name)"
        println(greetMessage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

