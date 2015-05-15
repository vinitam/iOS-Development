//
//  DataManager.swift
//  CoreDataMVCSwift
//
//  Created by Vinita Miranda on 5/12/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit
import CoreData


protocol DataManagerProtocol
{
    func datafetchCompleted(result : [Drink])
    func datafetchFailed(error : NSError)
}

class DataManager: NSObject
{
    var delegate : DataManagerProtocol!
    
    func fetchDrinks()
    {
        var url : NSURL = NSURL(string: "http://www.json-generator.com/api/json/get/ciGAlLjdaq?indent=2")!
        var request: NSURLRequest = NSURLRequest(URL: url)
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            
            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
            var err: NSError?
            var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as? NSDictionary
            
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
                    
                    var resultArray = (appDelegate.managedObjectContext!.executeFetchRequest(drinkFetchRequest, error: nil) as? [Drink])
                    
                    if((error) != nil)
                    {
                        self.delegate.datafetchFailed(error)
                    }
                    else
                    {
                        self.delegate?.datafetchCompleted(resultArray!)
                    }

                }
                else
                {
                    let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                    println("Error could not parse JSON: \(jsonStr)")
                }
            }
            
            
        });
        task.resume()
    }

    
}
