//
//  ViewController.swift
//  TextViewSwift
//
//  Created by Vinita Miranda on 5/7/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.editable = true
        self.textView.backgroundColor = UIColor.redColor()
        self.textView.textColor = UIColor.blackColor()
        self.textView.textAlignment = NSTextAlignment.Center
        self.textView.text = "Hi"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

