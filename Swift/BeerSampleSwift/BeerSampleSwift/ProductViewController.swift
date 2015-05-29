//
//  ProductViewController.swift
//  BeerSampleSwift
//
//  Created by Vinita Miranda on 5/25/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController,DataManagerProtocol
{
    var productArray = NSMutableArray()
    var beerDictionary : NSDictionary?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerNib(UINib(nibName: "CustomTableViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "CustomTableViewCell")
        self.fetchProductData()
    }

    func fetchProductData()
    {
        var dataManager : DataManager = DataManager()
        dataManager.delegate = self
        var productId  = self.beerDictionary?.objectForKey("beer_id") as? Int
        dataManager.fetchDataFromUrl("http://ontariobeerapi.ca:80/beers/\(productId!)/products/")
    }
    
    
    func datafetchCompleted(result : NSMutableArray)
    {
        self.productArray = result
        dispatch_async(dispatch_get_main_queue())
            {
                self.tableView.reloadData()
        }
    }
    
    func datafetchFailed(error : NSError)
    {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell : CustomTableViewCell = tableView.dequeueReusableCellWithIdentifier("CustomTableViewCell") as! CustomTableViewCell
        var productDictionary: NSDictionary = NSDictionary()
        productDictionary  = self.productArray[indexPath.row] as! NSDictionary
        cell.titleLabel.text = productDictionary["brewer"] as? String
        cell.typeLabel.text = productDictionary["type"] as? String
        cell.ratingLabel.text = productDictionary["price"] as? String
        var imageName : String? =  productDictionary["image_url"] as? String
        ImageLoader.sharedLoader.imageForUrl(imageName!, completionHandler:{(image: UIImage?, url: String) in
            cell.iconImageView.image = image
        })
        return cell
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        var destinationVC : StoreViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("StoreViewController") as? StoreViewController)!
        destinationVC.productDictionary = self.productArray[indexPath.row] as? NSDictionary
        self.navigationController!.pushViewController(destinationVC, animated: true)
    }
    
}
