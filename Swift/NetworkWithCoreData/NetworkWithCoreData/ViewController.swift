//
//  ViewController.swift
//  NetworkingSwift
//
//  Created by Vinita Miranda on 5/12/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var drinksArray = [Drink]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var session = NSURLSession.sharedSession()
        var request = NSMutableURLRequest(URL: NSURL(string: "http://www.json-generator.com/api/json/get/ciGAlLjdaq?indent=2")!)
        var err: NSError?
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            
            var err: NSError?
            var json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableLeaves, error: &err) as? NSDictionary
            
            if(err != nil)
            {
                let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                println("Error could not parse JSON: '\(jsonStr)'")
            }
            else
            {
                if let parseJSON = json
                {
                    var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

                    var array = parseJSON["drinks"] as! [Dictionary<String, String>]
                    
                    for currentDrink in array
                    {
                        var drink : Drink = NSEntityDescription.insertNewObjectForEntityForName("Drink", inManagedObjectContext: appDelegate.managedObjectContext!) as! Drink
                        drink.category = currentDrink["category"]!
                        drink.ingredients = currentDrink["ingredients"]!
                        drink.instructions = currentDrink["instructions"]!
                        drink.name = currentDrink["name"]!
                    }

                    [appDelegate.managedObjectContext?.save(nil)]
                    
                    let drinkFetchRequest = NSFetchRequest(entityName: "Drink")
                    
                    self.drinksArray = (appDelegate.managedObjectContext!.executeFetchRequest(drinkFetchRequest, error: nil) as? [Drink])!
                    
                    dispatch_async(dispatch_get_main_queue(),{ ()->() in
                        self.tableView.reloadData()
                    })
                }
                else
                {
                    let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                    println("Error could not parse JSON: \(jsonStr)")
                }
            }
            
            
        })
        task.resume()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.drinksArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        var drink  = self.drinksArray[indexPath.row]
        
        cell.textLabel!.text = drink.name
        return cell
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}

