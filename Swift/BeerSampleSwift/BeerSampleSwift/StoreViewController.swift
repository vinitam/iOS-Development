//
//  StoreViewController.swift
//  BeerSampleSwift
//
//  Created by Vinita Miranda on 5/25/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController,DataManagerProtocol,UITableViewDelegate,UITableViewDataSource   {

    @IBOutlet weak var tableView: UITableView!
    var productDictionary : NSDictionary?
    var storeArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerNib(UINib(nibName: "CustomTableViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "CustomTableViewCell")
        self.fetchStoreInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func fetchStoreInfo()
    {
        var dataManager : DataManager = DataManager()
        dataManager.delegate = self
        var storeId  = self.productDictionary?.objectForKey("product_id") as? Int
        dataManager.fetchDataFromUrl("http://ontariobeerapi.ca:80/products/\(storeId!)/stores/")
    }
    
    
    func datafetchCompleted(result : NSMutableArray)
    {
        self.storeArray = result
        dispatch_async(dispatch_get_main_queue())
            {
                self.tableView.reloadData()
        }
    }
    
    func datafetchFailed(error : NSError)
    {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.storeArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell : CustomTableViewCell = tableView.dequeueReusableCellWithIdentifier("CustomTableViewCell") as! CustomTableViewCell
        var storeDictionary: NSDictionary = NSDictionary()
        storeDictionary  = self.storeArray[indexPath.row] as! NSDictionary
        cell.titleLabel.text = storeDictionary["name"] as? String
        cell.typeLabel.text = storeDictionary["city"] as? String
        cell.ratingLabel.hidden = true
        cell.titleLeadingSpace.constant = 0;
        cell.typeLeadingSpace.constant = 0;
        cell.titleLabel.layoutIfNeeded()
        cell.titleLabel.setNeedsLayout()
        
        cell.typeLabel.layoutIfNeeded()
        cell.typeLabel.setNeedsLayout()
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        var mapViewController = self.storyboard!.instantiateViewControllerWithIdentifier("MapViewController") as? MapViewController
        mapViewController?.storeDictionary = self.storeArray[indexPath.row] as? NSDictionary
        self.navigationController?.pushViewController(mapViewController!, animated: true)
    }


}
