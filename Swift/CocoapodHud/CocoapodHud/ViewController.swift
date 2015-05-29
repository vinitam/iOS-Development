//
//  ViewController.swift
//  CocoapodHud
//
//  Created by Vinita Miranda on 5/21/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonClicked(sender: AnyObject) {
        self
        SVProgressHUD.showWithStatus("Hello")
        
        dispatch_after(25, dispatch_get_main_queue()) { () -> Void in
            SVProgressHUD.dismiss()

        }
    }

}

