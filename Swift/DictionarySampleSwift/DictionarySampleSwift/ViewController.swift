//
//  ViewController.swift
//  DictionarySampleSwift
//
//  Created by Vinita Miranda on 5/3/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var clothesDictionary = ["shirts" : 3, "pant" : 1, "t-shirt" : " 5"]
        clothesDictionary["tie"] = 4
        println(clothesDictionary)
        
        var emptyDictionary = [String: Float]()
        emptyDictionary = ["shirts" : 3.0, "pant" : 1.0, "t-shirt" :  5.0]
        emptyDictionary["watch"] = 9.0
        println(emptyDictionary)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

