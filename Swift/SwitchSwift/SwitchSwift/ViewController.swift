//
//  ViewController.swift
//  SwitchSwift
//
//  Created by Vinita Miranda on 5/7/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var switchView: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.switchView.tintColor = UIColor.greenColor()    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    
    @IBAction func switchValueChanged(sender: AnyObject) {
        
        if(self.switchView.on)
        {
            self.view.backgroundColor = UIColor.redColor()
        }
        else
        {
            self.view.backgroundColor = UIColor.yellowColor()
            
        }
        
    }


}

