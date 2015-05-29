//
//  DataManager.swift
//  XMLParserSwift
//
//  Created by Vinita Miranda on 5/19/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit
import CoreData

protocol DataManagerProtocol
{
    func parsingCompleted(outputArray : [Drinks])
    
}

class DataManager: NSObject, NSXMLParserDelegate
{
    var arrayOfObjects : [Drinks] = []
    var currentElement : String = ""
    var parser = NSXMLParser()
    var drinks : Drinks!
    var delegate : DataManagerProtocol!
    
    func startXmlParsing()
    {
        
        self.parser = NSXMLParser(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("drinks", ofType: "xml")!))!
        self.parser.delegate = self
        self.parser.parse()
    }
    
    func parserDidStartDocument(parser: NSXMLParser) {
        self.arrayOfObjects = []
        
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject])
    {
        self.currentElement = elementName;
        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        
        if (self.currentElement == "element")
        {
            self.drinks = NSEntityDescription.insertNewObjectForEntityForName("Drinks", inManagedObjectContext: appDelegate.managedObjectContext!) as! Drinks;
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String?)
    {
        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        if(self.currentElement == "category")
        {
            self.drinks.drink_category = NSEntityDescription.insertNewObjectForEntityForName("DrinkCategory", inManagedObjectContext: appDelegate.managedObjectContext!) as! DrinkCategory
            self.drinks.drink_category.name = string!;
        }
        else if (self.currentElement == "ingredients")
        {
            self.drinks.ingredients = string!;
        }
        else if (self.currentElement == "instructions")
        {
            self.drinks.instructions = string!;
        }
        else if (self.currentElement == "name")
        {
            self.drinks.name = string!;
        }
    }
    
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName == "element")
        {
            self.arrayOfObjects.append(self.drinks)
        }
    }
    
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError)
    {
        var userInfo : Dictionary<NSObject,AnyObject> = parseError.userInfo!
        var lineNumber: AnyObject?   = userInfo["NSXMLParserErrorLineNumber"]
        var errorColumn: AnyObject?  = userInfo["NSXMLParserErrorColumn"]
        var errorMessage: AnyObject? = userInfo["NSXMLParserErrorMessage"]
    }
    
    
    func parserDidEndDocument(parser: NSXMLParser)
    {
        self.delegate.parsingCompleted(self.arrayOfObjects)
    }
    
}
