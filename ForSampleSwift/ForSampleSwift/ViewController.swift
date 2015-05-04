//
//  ViewController.swift
//  ForSampleSwift
//
//  Created by Vinita Miranda on 5/3/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var fruitArray = ["Apple", "Grapes","Mango","Custard Apple"]
        
        for fruit in fruitArray
        {
            println(fruit)
        }
        
        
        var  paperTypes = ["Times" : 100 , "DNA" : 500, "The Hindu" : 500]
        
        for (paper,count) in paperTypes
        {
            println("There are \(count) \(paper)s")
        }
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

