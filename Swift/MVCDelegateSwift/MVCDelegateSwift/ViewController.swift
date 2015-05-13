//
//  ViewController.swift
//  MVCDelegateSwift
//
//  Created by Vinita Miranda on 5/13/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController,DataManagerProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    
    var drinksArray = [Drink]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var dataManager = DataManager()
        dataManager.delegate = self
        dataManager.fetchDrinks()
        
    }

    func datafetchCompleted(result : [Drink])
    {
        self.drinksArray = result
        
        dispatch_async(dispatch_get_main_queue(),{ ()->() in
            self.tableView.reloadData()
        })
    }
    
    func datafetchFailed(error : NSError)
    {
        
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

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

