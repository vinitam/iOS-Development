//
//  ViewController.swift
//  ActivityVCDemo
//
//  Created by Vinita Miranda on 6/19/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func shareButtonClicked(sender: AnyObject) {
        var sport = Sport()
        sport.sportName = "Cricket"
        sport.sportsManName = "Sachin"
        sport.score = 77
        
        var activityItem = ActivityItem(data: sport)
        let vc = UIActivityViewController(activityItems: [activityItem!], applicationActivities: nil)
        self.presentViewController(vc, animated: true, completion: nil)
        

    }


}

