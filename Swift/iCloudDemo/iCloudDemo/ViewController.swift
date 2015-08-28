//
//  ViewController.swift
//  iCloudDemo
//
//  Created by Vinita Miranda on 8/28/15.
//  Copyright (c) 2015 bombaybrew. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dobTextField: UITextField!
    @IBOutlet weak var employeeId: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        if isIcloudAvailable(){
            print("icloud available")
        }

        fetchEmployee()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fetchEmployee()
    {
        let publicDB = CKContainer.defaultContainer().publicCloudDatabase

        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Employee", predicate: predicate)

        publicDB.performQuery(query, inZoneWithID: nil) { results, error in
            println(results)
        }
    }

    @IBAction func addEmployee(sender: AnyObject) {
        let publicDB = CKContainer.defaultContainer().publicCloudDatabase
        let employee : CKRecord = CKRecord(recordType: "Employee") as CKRecord
        employee.setObject(self.nameTextField.text, forKey: "name")
        employee.setObject(self.dobTextField.text, forKey: "dob")
        employee.setObject(self.employeeId.text, forKey: "employeeId")


        publicDB.saveRecord(employee) { savedRecord, error in

        }
    }
    
    func isIcloudAvailable() -> Bool{
        if let _ = NSFileManager.defaultManager().ubiquityIdentityToken{
            return true
        } else {
            return false
        }
    }
}

