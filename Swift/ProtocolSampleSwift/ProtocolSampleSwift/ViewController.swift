//
//  ViewController.swift
//  ProtocolSampleSwift
//
//  Created by Vinita Miranda on 5/9/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit


class ViewController: UIViewController,DetailedDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        var detailedVC : DetailedViewController = segue.destinationViewController as! DetailedViewController
        detailedVC.delegate = self
    }


    func animationDidComplete(detailedViewController : DetailedViewController)
    {
        self.view.backgroundColor = UIColor.greenColor()    
    }

}

