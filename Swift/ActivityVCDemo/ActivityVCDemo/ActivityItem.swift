//
//  ActivityItem.swift
//  ActivityVCDemo
//
//  Created by Vinita Miranda on 6/19/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ActivityItem: UIActivityItemProvider, UIActivityItemSource
{
    var sharingString : String?
    var sport = Sport()
    
    init?(data:Sport!)
    {
        self.sport = data
        super.init()
    }
    
    override func activityViewControllerPlaceholderItem(activityViewController: UIActivityViewController) -> AnyObject {
        return "Awesome post";
    }
    
    override func activityViewController(activityViewController: UIActivityViewController, itemForActivityType activityType: String) -> AnyObject?
    {
        if(activityType == UIActivityTypeMail)
        {
            return ("\(sport.sportsManName) is playing \(sport.sportName)")
        }
        else if(activityType == UIActivityTypePostToTwitter){
            return ("\(sport.sportsManName) scored \(sport.score)")
        }
        return ("\(sport.sportsManName) = \(sport.score)")


    }
    
    override func activityViewController(activityViewController: UIActivityViewController, subjectForActivityType activityType: String?) -> String {
        
        if(activityType == UIActivityTypeMail){
            return "Check out this mail"
        } else if(activityType == UIActivityTypePostToTwitter)
        {
            return "Check out this tweet"
            
        }
        else if(activityType == UIActivityTypePostToTwitter)
        {
            return "Check out this tweet"
            
        }
        else
        {
            return "Check this !!!!"
        }
    }
    
    
    
}
