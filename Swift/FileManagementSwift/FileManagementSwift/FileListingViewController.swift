//
//  FileListingViewController.swift
//  FileManagementSwift
//
//  Created by Vinita Miranda on 5/16/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class FileListingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var filesArray = [String]?()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reloadFiles()
    }
    
    func reloadFiles()
    {
        let filemgr = NSFileManager.defaultManager()
        let dirPaths =
        NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)
        let docsDir = dirPaths[0] as! String
        
        var error: NSError?
        self.filesArray =  filemgr.contentsOfDirectoryAtPath(docsDir, error: &error) as? [String]
        self.tableView.reloadData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filesArray!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        var file = self.filesArray![indexPath.row]
        cell.textLabel!.text = file.lastPathComponent
        return cell
    }

    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            var filemgr = NSFileManager.defaultManager()
            let dirPaths =
            NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)
            var docsDir = dirPaths[0] as! String
            docsDir = docsDir.stringByAppendingPathComponent(self.filesArray![indexPath.row])
            var error: NSError?
            
            filemgr.removeItemAtPath(docsDir, error: nil)
            self.reloadFiles()

        }
    }

}
