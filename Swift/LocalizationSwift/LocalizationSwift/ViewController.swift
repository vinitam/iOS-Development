//
//  ViewController.swift
//  LocalizationSwift
//
//  Created by Vinita Miranda on 5/17/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let goodMorning = "Hello".localizedWithComment("Greet")

        self.greetLabel.text = goodMorning
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension String {
    func localizedWithComment(comment:String) -> String
    {
        return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: comment)
    }
}