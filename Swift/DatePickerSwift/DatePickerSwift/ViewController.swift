//
//  ViewController.swift
//  DatePickerSwift
//
//  Created by Vinita Miranda on 5/8/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func printPickerDate(sender: AnyObject)
    {
        var inputString = "03-04-2015"
        var dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone(name: "IST")
        dateFormatter.dateFormat = "dd-MM-yyyy"
        var formattedDate = dateFormatter.dateFromString(inputString)
        dateFormatter.dateFormat = "dd MMM yyyy"
        var formattedString = dateFormatter.stringFromDate(formattedDate!)

        
    }
    

}

