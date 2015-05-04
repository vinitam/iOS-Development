//
//  ViewController.swift
//  OptionalSwift
//
//  Created by Vinita Miranda on 5/3/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var optionalString : String?
        
        optionalString = "This is an optional string"
        
        println(optionalString!)
        
        var optionalString1 : String!
        
        optionalString1 = "This is second optional string"
        
        println(optionalString1)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

