//
//  ViewController.swift
//  FileManagementSwift
//
//  Created by Vinita Miranda on 5/14/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func CreateFileClicked(sender: AnyObject) {
        
        var inputTextField: UITextField?
        
        //Create the AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: "File", message: "Enter file name", preferredStyle: UIAlertControllerStyle.Alert)
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            actionSheetController.dismissViewControllerAnimated(true, completion: nil)
        }
        actionSheetController.addAction(cancelAction)
        let nextAction: UIAlertAction = UIAlertAction(title: "OK", style: .Default) { action -> Void in
            
            let filemgr = NSFileManager.defaultManager()
            let dirPaths =
            NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)
            var docsDir = dirPaths[0] as! String
            docsDir = docsDir.stringByAppendingPathComponent(inputTextField!.text)
            var error: NSError?

            
            if "".writeToFile(docsDir, atomically: true, encoding: NSUTF8StringEncoding, error: &error) == false {
                if let errorMessage = error {
                    println("\(errorMessage)")
                }
            } else {
            }
            actionSheetController.dismissViewControllerAnimated(true, completion: nil)
            self.performSegueWithIdentifier("ListFiles", sender: self)
        }
        actionSheetController.addAction(nextAction)
        actionSheetController.addTextFieldWithConfigurationHandler { textField -> Void in
            inputTextField = textField
        }
        self.presentViewController(actionSheetController, animated: true, completion: nil)
     }
    

    
    @IBAction func ListFilesClicked(sender: AnyObject) {
    }
}

