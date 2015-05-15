//
//  ViewController.swift
//  PlistSwift
//
//  Created by Vinita Miranda on 5/14/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var drinkArray = [Dictionary<String, String>]()
    override func viewDidLoad() {
        super.viewDidLoad()

        let path = NSBundle.mainBundle().pathForResource("Drink", ofType: "plist")
        self.drinkArray = NSArray(contentsOfFile: path!) as! [Dictionary<String, String>]
        dispatch_async(dispatch_get_main_queue(),{ ()->() in
            self.tableView.reloadData()
        })
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.drinkArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell : UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        var drink = self.drinkArray[indexPath.row]
        cell.textLabel!.text = drink["name"]
        return cell
    }
    



}

