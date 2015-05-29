//
//  DataManager.swift
//  BeerSampleSwift
//
//  Created by Vinita Miranda on 5/25/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

protocol DataManagerProtocol
{
    func datafetchCompleted(result : NSMutableArray)
    func datafetchFailed(error : NSError)
}

class DataManager: NSObject
{
    var delegate : DataManagerProtocol!

    func fetchDataFromUrl(urlString : String)
    {
        var session  = NSURLSession.sharedSession()
        var task = session.dataTaskWithURL(NSURL(string: urlString)!, completionHandler: { (data, response, error) -> Void in
            if((error) != nil)
            {
                self.delegate.datafetchFailed(error)
            }
            else
            {
                var array: NSMutableArray  = (NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as? NSMutableArray)!
                self.delegate?.datafetchCompleted(array)
            }
        })
        task.resume()
    }
    
}
