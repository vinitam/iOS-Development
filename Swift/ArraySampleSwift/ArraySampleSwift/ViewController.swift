//
//  ViewController.swift
//  ArraySampleSwift
//
//  Created by Vinita Miranda on 5/3/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var breakFastItems =  ["tea", "coffee"," milk", "juice"]
        breakFastItems[3] = "eggs"
        println(breakFastItems[2])
        
        breakFastItems.append("corn flakes")
        
        println(breakFastItems)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

