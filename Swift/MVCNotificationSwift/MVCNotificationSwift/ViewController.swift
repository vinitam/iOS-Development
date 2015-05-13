//
//  ViewController.swift
//  MVCDelegateSwift
//
//  Created by Vinita Miranda on 5/13/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var drinksArray = [Drink]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var dataManager = DataManager()
        dataManager.fetchDrinks()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "dataFetchSuccessful:", name: "dataFetchSuccessful", object: nil)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "dataFetchFailed:", name: "dataFetchFailed", object: nil)

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return drinksArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell : UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        var drink = drinksArray[indexPath.row]
        cell.textLabel!.text = drink.name
        return cell
    }
    
    func dataFetchSuccessful(notification : NSNotification)
    {
        let userInfo:Dictionary<String,[Drink]> = notification.object as! Dictionary<String,[Drink]>
        self.drinksArray = userInfo["drinks"]!
        
        dispatch_async(dispatch_get_main_queue(),{ ()->() in
            self.tableView.reloadData()
        })
    }
    
    func dataFetchFailed(notification : NSNotification)
    {
        let userInfo:Dictionary<String,NSError> = notification.object as! Dictionary<String,NSError>

        var error = userInfo["error"]!
        
        var alert = UIAlertView(title: "Error", message: error.description, delegate: nil, cancelButtonTitle: "OK")
        alert.show()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

