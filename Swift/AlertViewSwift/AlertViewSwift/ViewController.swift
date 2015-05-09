//
//  ViewController.swift
//  AlertViewSwift
//
//  Created by Vinita Miranda on 5/7/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIAlertViewDelegate {

    @IBOutlet weak var switchView: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func switchedValueChanged(sender: AnyObject) {
        var message = self.switchView.on ? "on" : "off"
        
        
        var alertview = UIAlertView(title: "Alert", message: "The switch is \(message)", delegate: self, cancelButtonTitle: "OK", otherButtonTitles: "A", "B")

        alertview.show()
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int)
    {
        
    }

}

