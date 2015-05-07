//
//  ViewController.swift
//  AnimationSwift
//
//  Created by Vinita Miranda on 5/7/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector(animateView()), userInfo: nil, repeats: false)
    }

    func animateView()
    {
        var animation : CABasicAnimation.anim
        animation = CABasicAnimation.anim
        
        
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
        [animation setFromValue:[NSNumber numberWithFloat:1.3f]];
        [animation setToValue:[NSNumber numberWithFloat:1.f]];
        [animation setDuration:2.f];
        [animation setRemovedOnCompletion:NO];
        [[self.imageView layer] addAnimation:animation forKey:@"scale"];
    }
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

