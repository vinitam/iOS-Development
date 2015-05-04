//
//  ViewController.swift
//  FunctionSampleSwift
//
//  Created by Vinita Miranda on 5/4/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var sum = addNumbers(2, number2: 3)
        println(sum)
        
        var greeting = greetUser("Siri")
        println(greeting)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func addNumbers(number1 : Int ,number2 : Int) -> Int
    {
        return number1 + number2
    }

    
    func greetUser(name : String) -> String
    {
        return "Hello \(name)"
    }
    
    
}

