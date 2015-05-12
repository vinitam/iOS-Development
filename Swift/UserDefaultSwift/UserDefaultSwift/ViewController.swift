//
//  ViewController.swift
//  UserDefaultSwift
//
//  Created by Vinita Miranda on 5/12/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        let defaults = NSUserDefaults.standardUserDefaults()

        
        if(defaults.objectForKey("Login")?.boolValue == true)
        {
            self.navigationController?.navigationBarHidden = true
            self.performSegueWithIdentifier("LoginSuccess", sender: self)
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func loginButtonClicked(sender: AnyObject) {
        
        if(self.userTextField.text == "admin" &&
        self.passwordTextField.text == "admin")
        {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(true, forKey: "Login")
            defaults.synchronize()
            self.performSegueWithIdentifier("LoginSuccess", sender: self)
        }
    }
}

