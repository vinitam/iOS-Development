//
//  ViewController.swift
//  VariableDemoSwift
//
//  Created by Vinita Miranda on 5/2/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //String
    var sampleInitString = "Hi"
    var sampleNonInitString : String!
    
    //Int
    var sampleInitInt = 42
    var sampleNonInitInt : Int!
    
    //Float
    var sampleInitFloat = 42.0
    var sampleNonInitFloat : Float!
    
    //Array
    var sampleInitArray = ["1" , "2" , "3" , "4"]
    var sampleNonInitArray : [String]!
    
    //Dictionary
    var sampleInitDictionary = ["1" : ["A", "B" , "C"], "2" :  ["D", "E" , "F"], "3" : ["G", "H" , "I"]]
    var sampleNonInitDictionary : [String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

