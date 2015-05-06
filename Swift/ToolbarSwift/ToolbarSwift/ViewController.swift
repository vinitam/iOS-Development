//
//  ViewController.swift
//  ToolbarSwift
//
//  Created by Vinita Miranda on 5/6/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toolBar: UIToolbar!
    
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBAction func itemClicked(sender: AnyObject)
    {
        self.toolBar.tintColor = UIColor.redColor()
        self.outputLabel.text = "Item Clicked"
    }

    @IBAction func item1Clicked(sender: AnyObject)
    {
        self.toolBar.tintColor = UIColor.yellowColor()
        self.outputLabel.text = "Item 1 Clicked"
    }
    
    @IBAction func item2Clicked(sender: AnyObject)
    {
        self.toolBar.tintColor = UIColor.blueColor()

        self.outputLabel.text = "Item 2 Clicked"

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

