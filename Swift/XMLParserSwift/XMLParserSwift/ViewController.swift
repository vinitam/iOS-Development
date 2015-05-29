//
//  ViewController.swift
//  XMLParserSwift
//
//  Created by Vinita Miranda on 5/18/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,DataManagerProtocol {

    @IBOutlet weak var tableView: UITableView!
    
    var tableArray = [Drinks]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var parser : DataManager = DataManager() as DataManager
        parser.delegate = self
        parser.startXmlParsing()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func parsingCompleted(outputArray : [Drinks])
    {
        self.tableArray = outputArray as [Drinks]
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.tableArray.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell") as UITableViewCell
        var drinks = self.tableArray[indexPath.row]
        cell.textLabel!.text = drinks.name;
        return cell;
    }
}

