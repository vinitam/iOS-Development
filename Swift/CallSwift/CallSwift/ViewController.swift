//
//  ViewController.swift
//  CallSwift
//
//  Created by Vinita Miranda on 5/12/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func callClicked(sender: AnyObject) {
        let phone = "tel://1234567899";
        let url:NSURL = NSURL(string:phone)!;
        UIApplication.sharedApplication().openURL(url);
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

