//
//  ViewController.swift
//  LabelSwift
//
//  Created by Vinita Miranda on 5/6/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sumLabel: UILabel!
    
    var firstNumber = 10
    var secondNumber : Int = 15
    
    override func viewDidLoad() {
        self.sumLabel.text = "The sum is: \(firstNumber + secondNumber) hjdgdhjgdsjhsddhsgdshdsbhdsbdhsdbshdbds"
        self.sumLabel.backgroundColor = UIColor.yellowColor()
        self.sumLabel.textColor = UIColor.blackColor()
        self.sumLabel.textAlignment = NSTextAlignment.Center

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

