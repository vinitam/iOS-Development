//
//  ViewController.swift
//  TupleSampleSwift
//
//  Created by Vinita Miranda on 5/4/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var result = calculate(5, number2: 2)
        println(result)
        
        var (sum, multiple, substract) = calculate(10, number2: 5)
        println(multiple)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func calculate(number1 : Int, number2 :Int) -> (sum : Int, multiple: Int, subtract :Int)
    {
        var sum : Int = number1 + number2
        var multiple : Int = number1 * number2
        var subtract : Int = number1 - number2
        return(sum, multiple, subtract)
    }

}

