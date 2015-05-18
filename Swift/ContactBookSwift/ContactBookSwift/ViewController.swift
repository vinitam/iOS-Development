//
//  ViewController.swift
//  ContactBookSwift
//
//  Created by Vinita Miranda on 5/17/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit
import AddressBook;

class ViewController: UIViewController {

    var contactsArray = []
    @IBOutlet weak var tableView: UITableView!
    
    var addressBook : ABAddressBook!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createAddressBook() -> Bool
    {
        if self.addressBook != nil {
            return true
        }
        var error : Unmanaged<CFError>? = nil
        let addressBook : ABAddressBook? = ABAddressBookCreateWithOptions(nil, &error).takeRetainedValue()
        if addressBook == nil
        {
            println(error)
            self.addressBook = nil
            return false
        }
        self.addressBook = addressBook
        return true
    }


    func getStatus() -> Bool
    {
        let status = ABAddressBookGetAuthorizationStatus()
        switch status {
        case .Authorized:
            return self.createAddressBook()
        case .NotDetermined:
            var currentStatus : Bool = false
            ABAddressBookRequestAccessWithCompletion(nil) {
                (granted:Bool, err:CFError!) in
                dispatch_async(dispatch_get_main_queue()) {
                    if granted
                    {
                        if self.addressBook != nil {
                            currentStatus = true
                        }
                        var error : Unmanaged<CFError>? = nil
                        let addressBook : ABAddressBook? = ABAddressBookCreateWithOptions(nil, &error).takeRetainedValue()
                        if addressBook == nil
                        {
                            println(error)
                            self.addressBook = nil
                            currentStatus = false
                        }
                        self.addressBook = addressBook
                        currentStatus = true
                    }
                }
            }
            if currentStatus == true
            {
                return true
            }
            else
            {
                return false
            }
            
        case .Restricted:
            return false
        case .Denied:
            return false
        }
    }
    
    @IBAction func showAddressBook(sender: AnyObject) {
        self.getContactNames()
        self.tableView.reloadData()
    }
    
    func getContactNames() {
        if !self.getStatus()
        {
            return
        }
        let people = ABAddressBookCopyArrayOfAllPeople(addressBook).takeRetainedValue() as NSArray as [ABRecord]
        self.contactsArray = people
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.contactsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell : UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        var contact: ABRecordRef = contactsArray[indexPath.row] as ABRecordRef
        var contactName: String = ABRecordCopyCompositeName(contact).takeRetainedValue() as String
        cell.textLabel!.text = contactName
        return cell
    }

}

