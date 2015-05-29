//
//  ViewController.swift
//  LocalNotificationSwift
//
//  Created by Vinita Miranda on 5/18/15.
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


    @IBAction func sendNotification(sender: UIButton)
    {
        var localNotification:UILocalNotification = UILocalNotification()
        localNotification.alertAction = "Notification test"
        localNotification.alertBody = "This is your first notification !!!!"
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 10)
        localNotification.applicationIconBadgeNumber = 1;

        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
    
}

