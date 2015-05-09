//
//  ViewController.swift
//  TextFieldSwift
//
//  Created by Vinita Miranda on 5/6/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        self.textField.text = "Hi"
        self.textField.textColor = UIColor.redColor()
        self.textField.backgroundColor = UIColor.yellowColor()
        self.textField.placeholder = "Enter value"
        self.textField.keyboardType = UIKeyboardType.ASCIICapable
        
    }



    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {

       return true
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if(textField == self.textField)
        {
            if(count(self.textField.text) > 3)
            {
                return false
            }
        }
        
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

