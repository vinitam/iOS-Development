//
//  ViewController.swift
//  HelloWorldSwift
//
//  Created by Vinita Miranda on 5/2/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    var sampleString : String?
    
    var sampleInt : Double = 0
    
    @IBAction func buttonClicked(sender: AnyObject) {
        button.setTitle("Clicked", forState: UIControlState.Normal)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        println("Hello World")
        
        sampleString = "test"
        
        println("\(sampleInt)")
        
        var rollNo = 1
        
        var greetingMessage = "Hello roll no \(rollNo)"
        
        println(greetingMessage)
        
        button.setTitle("Hello", forState: UIControlState.Normal)
    }
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

