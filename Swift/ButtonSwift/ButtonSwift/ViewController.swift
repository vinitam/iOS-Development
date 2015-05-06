//
//  ViewController.swift
//  ButtonSwift
//
//  Created by Vinita Miranda on 5/6/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var greetButton: UIButton!
    
    
    @IBAction func greetingButtonPressed(sender: AnyObject)
    {
        self.greetButton.selected = !self.greetButton.selected
        self.greetButton.setTitle("Click Me", forState: UIControlState.Normal)
        self.greetButton.setTitle("Pressed !!!", forState: UIControlState.Selected)
        
        if(self.greetButton.selected)
        {
            self.greetButton.backgroundColor = UIColor.yellowColor()
        }
        else
        {
            self.greetButton.backgroundColor = UIColor.redColor()
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

