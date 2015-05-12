//
//  ViewController.swift
//  ExtensionSampleSwift
//
//  Created by Vinita Miranda on 5/4/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

extension Float
{
    var currency : String
    {
        return "Rs \(self)"
    }
    
    var incrementByOne : Float
    {
        return self + Float(1)
    }
}

extension String
{
    var addressPerson : String
    {
        return "Mr \(self)"
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("Currency : \(Float(3).currency)")
        println("Increment : \(Float(5).incrementByOne)")
        
        println("Amit".addressPerson);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

