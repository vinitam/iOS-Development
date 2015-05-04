//
//  ViewController.swift
//  FunctionAsReturnTypeSwift
//
//  Created by Vinita Miranda on 5/4/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var computation = getPrice(16)
        println(computation)

        var result = computation(8)
        println(result)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getPrice(age : Int) -> (Float) -> Float
    {
        var perDayCost : Float = 0;
        
        func calculateMinorCost(days: Float) -> Float
        {
            perDayCost = 1000 * days
            return perDayCost
        }
        
        func calculateAdultCost(days: Float) -> Float
        {
            perDayCost = 2000 * days
            return perDayCost
        }
        
        if(age > 18)
        {
            return calculateAdultCost
        }
        else
        {
            return calculateMinorCost
        }
    }
}

