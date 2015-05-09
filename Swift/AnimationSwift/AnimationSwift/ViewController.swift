//
//  ViewController.swift
//  AnimationSwift
//
//  Created by Vinita Miranda on 5/7/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topConstraint: NSLayoutConstraint!

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
        override func viewDidAppear(animated: Bool) {
            super.viewDidAppear(animated)
            self.imageView.alpha = 0.0

            //fade in
            UIView.animateWithDuration(2.0, delay: 2.0, options: .TransitionFlipFromRight, animations: {
                self.imageView.alpha = 1.0
                self.imageView.layoutIfNeeded()
                }, completion: {_ in
                    self.animateImageOffset()
            })
        }

    func animateImageOffset()
    {
        
        UIView.animateWithDuration(3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                self.topConstraint.constant = 300
            self.imageView.image = UIImage(named: "2.png")

                self.imageView.layoutIfNeeded()
            }, completion: {_ in
                
            })

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

