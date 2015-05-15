//
//  ViewController.swift
//  GestureSwift
//
//  Created by Vinita Miranda on 5/15/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("gestureHandler:"))
        leftSwipe.direction = .Left
        view.addGestureRecognizer(leftSwipe)
        
        var rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("gestureHandler:"))
        rightSwipe.direction = .Right
        view.addGestureRecognizer(rightSwipe)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gestureHandler(sender:UISwipeGestureRecognizer)
    {
        if (sender.direction == .Left)
        {
            println("Swipe Left")
        }
        
        if (sender.direction == .Right)
        {
            println("Swipe Right")
        }
    }
    
}

