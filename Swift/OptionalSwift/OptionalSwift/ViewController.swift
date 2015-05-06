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
        
        var optionalString1 : String!
        
        var optionalString2 : String

        
        optionalString = "Hello"
        

        println(optionalString1)
        
        if optionalString != nil
        {
            println(optionalString!)
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

