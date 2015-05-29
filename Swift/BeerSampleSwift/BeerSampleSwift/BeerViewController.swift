//
//  BeerViewController.swift
//  BeerSampleSwift
//
//  Created by Vinita Miranda on 5/25/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class BeerViewController: UIViewController,DataManagerProtocol,UITableViewDelegate,UITableViewDataSource    
{
    var beerArray = NSMutableArray()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerNib(UINib(nibName: "CustomTableViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "CustomTableViewCell")
        self.fetchBeerData()
        self.navigationController!.navigationBar.translucent = false;

    }
    
    override func viewWillAppear(animated: Bool)
    {
        self.title = "Beer"
    }

    func fetchBeerData()
    {
        var dataManager : DataManager = DataManager()
        dataManager.delegate = self
        dataManager.fetchDataFromUrl("http://ontariobeerapi.ca:80/beers/")
    }

    
    func datafetchCompleted(result : NSMutableArray)
    {
        self.beerArray = result
        dispatch_async(dispatch_get_main_queue())
        {
            self.tableView.reloadData()
        }
    }
    
    func datafetchFailed(error : NSError)
    {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.beerArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell : CustomTableViewCell = tableView.dequeueReusableCellWithIdentifier("CustomTableViewCell") as! CustomTableViewCell
        var beerDictionary: NSDictionary = NSDictionary()
        beerDictionary  = self.beerArray[indexPath.row] as! NSDictionary
        cell.titleLabel.text = beerDictionary["name"] as? String
        cell.typeLabel.text = beerDictionary["type"] as? String
        cell.ratingLabel.text = beerDictionary["abv"] as? String
        
        var imageName : String? =  beerDictionary["image_url"] as? String

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
        var destinationVC : ProductViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("ProductViewController") as? ProductViewController)!
        destinationVC.beerDictionary = self.beerArray[indexPath.row] as? NSDictionary
        self.navigationController!.pushViewController(destinationVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
